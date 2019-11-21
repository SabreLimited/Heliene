report 50108 "SBR Copy Serial Nos WS"
{
    Caption = 'Copy Serial Nos';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
        {
            RequestFilterFields = "No.";
            dataitem("Warehouse Shipment Line"; "Warehouse Shipment Line")
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemTableView = SORTING("No.", "Line No.");

                trigger OnAfterGetRecord()
                begin
                    if SalesLine.Get("Source Subtype", "Source No.", "Source Line No.") then begin
                        CompPurchHdr.ChangeCompany(CompName);
                        CompPurchHdr.Get(CompPurchHdr."Document Type"::Order, PurchHdrNo);

                        CompPurchLine.ChangeCompany(CompName);
                        CompPurchLine.SetRange("Document Type", CompPurchHdr."Document Type");
                        CompPurchLine.SetRange("Document No.", CompPurchHdr."No.");
                        CompPurchLine.SetRange(Type, CompPurchLine.Type::Item);
                        CompPurchLine.SetRange("No.", SalesLine."No.");
                        CompPurchLine.SetRange("Variant Code", SalesLine."Variant Code");
                        CompPurchLine.SetFilter("Outstanding Quantity", '<>0');
                        if CompPurchLine.FindFirst() then begin
                            CheckIfReservEntryExists(CompPurchLine);
                            ReservEntry.SetCurrentKey(
                              "Source ID", "Source Ref. No.", "Source Type", "Source Subtype",
                              "Source Batch Name", "Source Prod. Order Line", "Reservation Status");
                            ReservEntry.SetRange("Source ID", SalesLine."Document No.");
                            ReservEntry.SetRange("Source Ref. No.", SalesLine."Line No.");
                            ReservEntry.SetRange("Source Type", Database::"Sales Line");
                            ReservEntry.SetRange("Source Subtype", SalesLine."Document Type");
                            ReservEntry.SetRange("Source Batch Name", '');
                            ReservEntry.SetRange("Source Prod. Order Line", 0);
                            if ReservEntry.FindSet then
                                repeat
                                    CreateSerialNo(CompPurchLine, ReservEntry."Serial No.",ReservEntry."Quantity (Base)");
                                until ReservEntry.Next = 0;

                        end else
                            Error('Item %1 not found in Purchase Order %2', SalesLine."No.", PurchHdrNo);
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    SetFilter("Qty. to Ship", '<>0');
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if PurchHdrNo = '' then
                    Error('Please enter Purchase No.');
            end;

            trigger OnPreDataItem()
            begin
                if Count > 1 then
                    Error('Please enter filter on Warehouse Shipmet Header');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Copy To';
                    field(CompName; CompName)
                    {
                        Caption = 'Comapany Name';
                        TableRelation = Company;
                    }
                    field(PurchHdrNo; PurchHdrNo)
                    {
                        Caption = 'Purchase Order No.';

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            TempPurchHdr: Record "Purchase Header" temporary;
                            PurchOrderList: Page "Purchase Order List";
                        begin
                            if CompName = '' then
                                Error('Please enter Company Name');

                            CompPurchHdr.ChangeCompany(CompName);

                            TempPurchHdr.DeleteAll;
                            if CompPurchHdr.FindSet then
                                repeat
                                    TempPurchHdr := CompPurchHdr;
                                    TempPurchHdr.Insert;
                                until CompPurchHdr.Next = 0;

                            if PAGE.RunModal(Page::"Purchase Order List", TempPurchHdr) = ACTION::LookupOK then begin
                                Text := TempPurchHdr."No.";
                                exit(true);
                            end;
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            CompName := 'LIVE HELIENE USA INC';
        end;
    }

    labels
    {
    }

    trigger OnPostReport()
    begin
        Message('Item Tracking Lines has been copied');
    end;

    var
        PurchHdr: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
        SalesLine: Record "Sales Line";
        ReservEntry: Record "Reservation Entry";
        CompPurchHdr: Record "Purchase Header";
        CompPurchLine: Record "Purchase Line";
        CompReservEntry: Record "Reservation Entry";
        CompName: Text[30];
        PurchHdrNo: Code[20];

    procedure CreateSerialNo(PurchLine: Record "Purchase Line"; ForSerialNo: Code[20];QtyBase:Decimal)
    var
        ForLotNo: Code[20];
        NextEntryNo: Integer;
    begin
        CompReservEntry.ChangeCompany(CompName);
        CompReservEntry.Reset;
        CompReservEntry.LockTable;

        if CompReservEntry.FindLast then
            NextEntryNo := CompReservEntry."Entry No." + 1
        else
            NextEntryNo := 1;

        with PurchLine do begin
            CompReservEntry.Init;
            CompReservEntry."Entry No." := NextEntryNo;
            CompReservEntry.Validate("Qty. per Unit of Measure", "Qty. per Unit of Measure");
            CompReservEntry.Positive := true;
            CompReservEntry.Validate("Quantity (Base)", -QtyBase);
            CompReservEntry."Item No." := "No.";
            CompReservEntry."Variant Code" := "Variant Code";
            CompReservEntry."Location Code" := "Location Code";
            CompReservEntry."Reservation Status" := CompReservEntry."Reservation Status"::Surplus;
            CompReservEntry."Creation Date" := Today;
            CompReservEntry."Source Type" := Database::"Purchase Line";
            CompReservEntry."Source Subtype" := "Document Type";
            CompReservEntry."Source ID" := "Document No.";
            CompReservEntry."Source Batch Name" := '';
            CompReservEntry."Source Ref. No." := "Line No.";
            CompReservEntry."Created By" := UserId;
            //CompReservEntry."Expiration Date" := "Expiration Date";
            CompReservEntry."Lot No." := ForLotNo;
            CompReservEntry."Serial No." := ForSerialNo;
            CompReservEntry."Variant Code" := "Variant Code";
            CompReservEntry."Expected Receipt Date" := PurchLine."Expected Receipt Date";
            CompReservEntry."Shipment Date" := 0D;
            CompReservEntry.UpdateItemTracking;
            CompReservEntry.Insert;
        end;
    end;

    procedure CheckIfReservEntryExists(CompPurchLine: Record "Purchase Line")
    begin
        CompReservEntry.ChangeCompany(CompName);
        CompReservEntry.SetCurrentKey(
          "Source ID", "Source Ref. No.", "Source Type", "Source Subtype",
          "Source Batch Name", "Source Prod. Order Line", "Reservation Status");
        CompReservEntry.SetRange("Source ID", CompPurchLine."Document No.");
        CompReservEntry.SETRANGE("Source Ref. No.", CompPurchLine."Line No.");
        CompReservEntry.SetRange("Source Type", Database::"Purchase Line");
        CompReservEntry.SetRange("Source Subtype", CompPurchLine."Document Type");
        CompReservEntry.SetRange("Source Batch Name", '');
        CompReservEntry.SetRange("Source Prod. Order Line", 0);
        if not CompReservEntry.IsEmpty then
            if Confirm('There are Item Tracking Lines for %1.\Do you want to continue?', false, CompPurchLine."No.") then
                CompReservEntry.DeleteAll
            else
                Error('');
    end;

}

