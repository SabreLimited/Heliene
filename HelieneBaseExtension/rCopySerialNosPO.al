report 50107 "SBR Copy Serial Nos PO"
{
    Caption = 'Copy Serial Nos';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            RequestFilterFields = "No.";
            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document Type" = FIELD("Document Type"), "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document Type", "Document No.", "Line No.") WHERE(Type = CONST(Item));

                trigger OnAfterGetRecord()
                begin
                    CompWhseShptHdr.ChangeCompany(CompName);
                    CompWhseShptHdr.Get(WhseShptHdrNo);

                    CompWhseShptLine.ChangeCompany(CompName);
                    CompWhseShptLine.SetRange("No.", WhseShptHdrNo);
                    CompWhseShptLine.SetRange("Item No.", "No.");
                    CompWhseShptLine.SetRange("Variant Code", "Variant Code");
                    CompWhseShptLine.SetFilter("Qty. Outstanding", '<>0');
                    if not CompWhseShptLine.FindFirst then
                        Error('Item %1 not found in Warehouse Shipment %1', "No.", WhseShptHdrNo);

                    CompSalesLine.ChangeCompany(CompName);
                    CompSalesLine.SetRange("Document Type", CompWhseShptLine."Source Subtype");
                    CompSalesLine.SetRange("Document No.", CompWhseShptLine."Source No.");
                    CompSalesLine.SetRange(Type, CompSalesLine.Type::Item);
                    CompSalesLine.SetRange("No.", "No.");
                    CompSalesLine.SetRange("Variant Code", "Variant Code");
                    CompSalesLine.SetFilter("Outstanding Quantity", '<>0');
                    if CompSalesLine.FindFirst() then begin
                        CheckIfReservEntryExists(CompSalesLine);

                        ReservEntry.SetCurrentKey(
                          "Source ID", "Source Ref. No.", "Source Type", "Source Subtype",
                          "Source Batch Name", "Source Prod. Order Line", "Reservation Status");
                        ReservEntry.SetRange("Source ID", "Document No.");
                        ReservEntry.SetRange("Source Ref. No.", "Line No.");
                        ReservEntry.SetRange("Source Type", Database::"Purchase Line");
                        ReservEntry.SetRange("Source Subtype", "Document Type");
                        ReservEntry.SetRange("Source Batch Name", '');
                        ReservEntry.SetRange("Source Prod. Order Line", 0);
                        if ReservEntry.FindSet then
                            repeat
                                CreateSerialNo(CompSalesLine, ReservEntry."Serial No.",ReservEntry."Quantity (Base)");
                            until ReservEntry.Next = 0;
                    end else
                        Error('Item %1 not found in Warehouse Shipment %1', "No.", WhseShptHdrNo);
                end;

                trigger OnPreDataItem()
                begin
                    SetFilter("Qty. to Receive", '<>0');
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if WhseShptHdrNo = '' then
                    Error('Please enter Warehouse Shipment No.');
            end;

            trigger OnPreDataItem()
            begin
                if Count > 1 then
                    Error('Please enter filter on Purchase Header');
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
                    field(WhseShptHdrNo; WhseShptHdrNo)
                    {
                        Caption = 'Warehouse Shipment No.';

                        trigger OnLookup(var Text: Text): Boolean
                        var
                            TempWhseShptHdr: Record "Warehouse Shipment Header" temporary;
                            WhseShptList: Page "Warehouse Shipment List";
                        begin
                            if CompName = '' then
                                Error('Please enter Company Name');

                            CompWhseShptHdr.ChangeCompany(CompName);

                            TempWhseShptHdr.DeleteAll;
                            if CompWhseShptHdr.FindSet then
                                repeat
                                    TempWhseShptHdr := CompWhseShptHdr;
                                    TempWhseShptHdr.Insert;
                                until CompWhseShptHdr.Next = 0;

                            if PAGE.RunModal(Page::"SBR Warehouse Shipment List", TempWhseShptHdr) = ACTION::LookupOK then begin
                                Text := TempWhseShptHdr."No.";
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
        ReservEntry: Record "Reservation Entry";
        CompSalesLine: Record "Sales Line";
        CompWhseShptHdr: Record "Warehouse Shipment Header";
        CompWhseShptLine: Record "Warehouse Shipment Line";
        CompReservEntry: Record "Reservation Entry";
        CompName: Text[30];
        WhseShptHdrNo: Code[20];

    procedure CreateSerialNo(SalesLine: Record "Sales Line"; ForSerialNo: Code[20];QtyBase:Decimal)
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

        with SalesLine do begin
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
            CompReservEntry."Source Type" := Database::"Sales Line";
            CompReservEntry."Source Subtype" := "Document Type";
            CompReservEntry."Source ID" := "Document No.";
            CompReservEntry."Source Batch Name" := '';
            CompReservEntry."Source Ref. No." := "Line No.";
            CompReservEntry."Created By" := UserId;
            //CompReservEntry."Expiration Date" := "Expiration Date";
            CompReservEntry."Lot No." := ForLotNo;
            CompReservEntry."Serial No." := ForSerialNo;
            CompReservEntry."Variant Code" := "Variant Code";
            CompReservEntry."Expected Receipt Date" := 0D;
            CompReservEntry."Shipment Date" := SalesLine."Shipment Date";
            CompReservEntry.UpdateItemTracking;
            CompReservEntry.Insert;
        end;
    end;

    procedure CheckIfReservEntryExists(CompSalesLine: Record "Sales Line")
    begin
        CompReservEntry.ChangeCompany(CompName);
        CompReservEntry.SetCurrentKey(
          "Source ID", "Source Ref. No.", "Source Type", "Source Subtype",
          "Source Batch Name", "Source Prod. Order Line", "Reservation Status");
        CompReservEntry.SetRange("Source ID", CompSalesLine."Document No.");
        CompReservEntry.SETRANGE("Source Ref. No.", CompSalesLine."Line No.");
        CompReservEntry.SetRange("Source Type", Database::"Sales Line");
        CompReservEntry.SetRange("Source Subtype", CompSalesLine."Document Type");
        CompReservEntry.SetRange("Source Batch Name", '');
        CompReservEntry.SetRange("Source Prod. Order Line", 0);
        if not CompReservEntry.IsEmpty then
            if Confirm('There are Item Tracking Lines for %1.\Do you want to continue?', false, CompSalesLine."No.") then
                CompReservEntry.DeleteAll
            else
                Error('');
    end;
}

