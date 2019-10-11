report 50108 "IC Copy Serial Nos WS"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Warehouse Shipment Header";"Warehouse Shipment Header")
        {
            RequestFilterFields = "No.";
            dataitem("Warehouse Shipment Line";"Warehouse Shipment Line")
            {
                DataItemLink = "No."=FIELD("No.");
                DataItemTableView = SORTING("No.","Line No.");

                trigger OnAfterGetRecord()
                begin
                    CompSalesLine.ChangeCompany(CompName);
                    CompSalesLine.SetRange("Document Type",CompWhseShptLine."Source Subtype");
                    CompSalesLine.SetRange("Document No.",CompWhseShptLine."Source No.");
                    CompSalesLine.SetRange("IC Partner Ref. Type",CompSalesLine."IC Partner Ref. Type"::Item);
                    CompSalesLine.SetRange("IC Partner Reference","Item No.");
                    if CompSalesLine.FindSet then
                      repeat
                        CompReservEntry.ChangeCompany(CompName);
                        CompReservEntry.SetCurrentKey(
                          "Source ID","Source Ref. No.","Source Type","Source Subtype",
                          "Source Batch Name","Source Prod. Order Line","Reservation Status");
                        CompReservEntry.SetRange("Source ID",CompSalesLine."Document No.");
                        CompReservEntry.SetRange("Source Ref. No.",CompSalesLine."Line No.");
                        CompReservEntry.SetRange("Source Type",DATABASE::"Sales Line");
                        CompReservEntry.SetRange("Source Subtype",CompSalesLine."Document Type");
                        CompReservEntry.SetRange("Source Batch Name",'');
                        CompReservEntry.SetRange("Source Prod. Order Line",0);
                        if CompReservEntry.FindSet then
                          repeat
                            SalesLine.Get("Source Subtype","Source No.","Source Line No.");
                            CreateSerialNo(SalesLine,CompReservEntry."Serial No.");
                          until CompReservEntry.Next = 0;
                      until CompSalesLine.Next = 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if WhseShptHdrNo = '' then
                  Error('Please enter Warehouse Shipment No.');

                CompWhseShptHdr.ChangeCompany(CompName);
                CompWhseShptHdr.Get(WhseShptHdrNo);

                CompWhseShptLine.ChangeCompany(CompName);
                CompWhseShptLine.SetRange("No.",WhseShptHdrNo);
                CompWhseShptLine.FindFirst;

                WhseShptLine.SetRange("No.","No.");
                WhseShptLine.FindFirst;

                ReservEntry.SetCurrentKey(
                  "Source ID","Source Ref. No.","Source Type","Source Subtype",
                  "Source Batch Name","Source Prod. Order Line","Reservation Status");
                ReservEntry.SetRange("Source ID",WhseShptLine."Source No.");
                //ReservEntry.SETRANGE("Source Ref. No.",SalesLine."Line No.");
                ReservEntry.SetRange("Source Type",WhseShptLine."Source Type");
                ReservEntry.SetRange("Source Subtype",WhseShptLine."Source Subtype");
                ReservEntry.SetRange("Source Batch Name",'');
                ReservEntry.SetRange("Source Prod. Order Line",0);
                if not ReservEntry.IsEmpty then
                  if Confirm('There are Item Tracking Lines for %1.\Do you want to continue?',false,"No.") then
                    ReservEntry.DeleteAll
                  else
                    Error('');
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
                    Caption = 'Options';
                    field(CompName;CompName)
                    {
                        Caption = 'Comapany Name';
                        TableRelation = Company;
                    }
                    field(WhseShptHdrNo;WhseShptHdrNo)
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

                            if PAGE.RunModal(50000,TempWhseShptHdr) = ACTION::LookupOK then begin
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
            CompName := 'LIVE HELIENE CANADA';
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
        WhseShptHdr: Record "Warehouse Shipment Header";
        WhseShptLine: Record "Warehouse Shipment Line";
        SalesLine: Record "Sales Line";
        ReservEntry: Record "Reservation Entry";
        CompWhseShptHdr: Record "Warehouse Shipment Header";
        CompWhseShptLine: Record "Warehouse Shipment Line";
        CompSalesLine: Record "Sales Line";
        CompReservEntry: Record "Reservation Entry";
        CompName: Text[30];
        WhseShptHdrNo: Code[20];

    procedure CreateSerialNo(SalesLine: Record "Sales Line";ForSerialNo: Code[20])
    var
        ForLotNo: Code[20];
        ShipmentDate: Date;
        NextEntryNo: Integer;
    begin

        ReservEntry.Reset;
        ReservEntry.LockTable;

        if ReservEntry.FindLast then
          NextEntryNo := ReservEntry."Entry No." + 1
        else
          NextEntryNo := 1;

        with SalesLine do begin
          ReservEntry.Init;
          ReservEntry."Entry No." := NextEntryNo;
          ReservEntry.Validate("Qty. per Unit of Measure", "Qty. per Unit of Measure");
          ReservEntry.Positive := true;
          ReservEntry.Validate("Quantity (Base)", -"Quantity (Base)");
          ReservEntry."Item No." := "No.";
          ReservEntry."Location Code" := "Location Code";
          ReservEntry."Reservation Status" := ReservEntry."Reservation Status"::Surplus;
          ReservEntry."Creation Date" := Today;
          ReservEntry."Source Type" := DATABASE::"Sales Line";
          ReservEntry."Source Subtype" := "Document Type";
          ReservEntry."Source ID" := "Document No.";
          ReservEntry."Source Batch Name" := '';
          ReservEntry."Source Ref. No." := "Line No.";
          ReservEntry."Created By" := UserId;
          //ReservEntry."Expiration Date" := "Expiration Date";
          ReservEntry."Lot No." := ForLotNo;
          ReservEntry."Serial No." := ForSerialNo;
          ReservEntry."Variant Code" := "Variant Code";
          ReservEntry."Expected Receipt Date" := 0D;
          ReservEntry."Shipment Date" := SalesLine."Shipment Date";
          ReservEntry.UpdateItemTracking;
          ReservEntry.Insert;
        end;
    end;
}

