codeunit 59131 "Whse. Ship. - Post & Receive"
{
    // HEL11.00 / 0001 / SGR / 071019
    //   - New object


    trigger OnRun()
    var
        PreviousSourceNoL: Code[20];
    begin
        with WarehouseShipmentLineTempG do
        begin
            SetCurrentKey("No.", "Source Type", "Source Subtype", "Source No.", "Source Line No.");

            FindSet;

            repeat
            if "Source No." <> PreviousSourceNoL then begin
                if CanTransferOrderBeReceived("Source No.") then begin
                    CreateReceipt("Source No.");
                    PostReceipt(SetQtyToReceiveOnWarehouseReceiptLines("Source No."));
                end;

                PreviousSourceNoL := "Source No.";
            end;
            until Next = 0;
        end;
    end;

    var
        WarehouseShipmentNoG: Code[20];
        WarehouseShipmentLineTempG: Record "Warehouse Shipment Line" temporary;

    procedure SetWarehouseShipmentVariables(WarehouseShipmentNoP: Code[20])
    begin
        WarehouseShipmentNoG := WarehouseShipmentNoP;

        CopyWarehouseShipmentLines;
    end;

    local procedure CopyWarehouseShipmentLines()
    var
        WarehouseShipmentLineL: Record "Warehouse Shipment Line";
    begin
        with WarehouseShipmentLineL do
        begin
            SetRange("No.", WarehouseShipmentNoG);
            SetRange("Source Type", DATABASE::"Transfer Line");
            SetFilter("Qty. to Ship", '<>%1', 0);

            if FindSet then
                repeat
              InsertWarehouseShipmentLineTemp(WarehouseShipmentLineL);
                until Next = 0;
        end;
    end;

    local procedure InsertWarehouseShipmentLineTemp(var WarehouseShipmentLineP: Record "Warehouse Shipment Line")
    begin
        WarehouseShipmentLineTempG.Init;

        WarehouseShipmentLineTempG.TransferFields(WarehouseShipmentLineP);

        WarehouseShipmentLineTempG.Insert;
    end;

    local procedure CanTransferOrderBeReceived(TransferHeaderNoP: Code[20]): Boolean
    var
        TransferLineL: Record "Transfer Line";
    begin
        with TransferLineL do
        begin
            SetRange("Document No.", TransferHeaderNoP);
            SetFilter("Item No.", '<>%1', '');
            SetFilter("Qty. in Transit", '<>%1', 0);
            SetRange("Derived From Line No.", 0);

            exit(not IsEmpty);
        end;
    end;

    local procedure CreateReceipt(TransferHeaderNoP: Code[20])
    var
        TransferHeaderL: Record "Transfer Header";
        GetSourceDocInboundL: Codeunit "Get Source Doc. Inbound";
    begin
        TransferHeaderL.Get(TransferHeaderNoP);

        GetSourceDocInboundL.CreateFromInbndTransferOrderHideDialog(TransferHeaderL);
    end;

    local procedure SetQtyToReceiveOnWarehouseReceiptLines(TransferHeaderNoP: Code[20]): Code[20]
    var
        WarehouseReceiptLineL: Record "Warehouse Receipt Line";
        WarehouseReceiptHeaderNoL: Code[20];
    begin
        with WarehouseReceiptLineL do
        begin
            SetCurrentKey("Source Type"); //M5130
            SetRange("Source Type", DATABASE::"Transfer Line");
            SetRange("Source No.", TransferHeaderNoP);
            SetFilter("Qty. Outstanding", '<>%1', 0);

            FindSet(true);

            WarehouseReceiptHeaderNoL := "No.";

            repeat
            Validate("Qty. to Receive", "Qty. Outstanding");
            Modify(true);

            SetQtyToHandleOnReservationEntries(WarehouseReceiptLineL) //M5130
          until Next = 0;
        end;

        exit(WarehouseReceiptHeaderNoL);
    end;

    local procedure PostReceipt(WarehouseReceiptHeaderNoP: Code[20])
    var
        WarehouseReceiptLineL: Record "Warehouse Receipt Line";
        WhsePostReceiptL: Codeunit "Whse.-Post Receipt";
    begin
        WarehouseReceiptLineL.SetRange("No.", WarehouseReceiptHeaderNoP);

        WarehouseReceiptLineL.FindSet;

        WhsePostReceiptL.Run(WarehouseReceiptLineL);
        WhsePostReceiptL.GetResultMessage;
    end;

    local procedure SetQtyToHandleOnReservationEntries(WarehouseReceiptLineP: Record "Warehouse Receipt Line")
    var
        ReservEntry: Record "Reservation Entry";
        TransLine: Record "Transfer Line";
    begin
        //M5130 <
        if not TransLine.Get(WarehouseReceiptLineP."Source No.", WarehouseReceiptLineP."Source Line No.") then
            exit;

        ReservEntry.SetCurrentKey(
          "Source ID", "Source Ref. No.", "Source Type", "Source Subtype",
          "Source Batch Name", "Source Prod. Order Line", "Reservation Status");
        ReservEntry.SetRange("Source ID", TransLine."Document No.");
        // ReservEntry.SetRange("Source Ref. No.", TransLine."Line No.");
        ReservEntry.SetRange("Source Type", DATABASE::"Transfer Line");
        ReservEntry.SetRange("Source Subtype", 1);
        ReservEntry.SetRange("Source Batch Name", '');
        // ReservEntry.SetRange("Source Prod. Order Line", TransLine."Derived From Line No.");
        ReservEntry.SetRange("Source Prod. Order Line", TransLine."Line No.");
        if ReservEntry.FindSet then
            repeat
                ReservEntry.Validate("Qty. to Handle (Base)", 1);
                ReservEntry.Modify;
            until ReservEntry.Next = 0;
        //M5130 >
    end;
}

