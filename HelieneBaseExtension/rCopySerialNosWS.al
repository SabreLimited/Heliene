report 50108 "SBR Copy Serial Nos WS"
{
    Caption = 'Copy Serial Nos';
    ProcessingOnly = true;

    dataset
    {
        dataitem("Warehouse Shipment Header"; "Warehouse Shipment Header")
        {
            DataItemTableView = sorting("No.");
            // RequestFilterFields = "No.";
            
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
                        if TruckNo <> TruckNo::"0" then
                            CompPurchLine.SetRange("Truck No.", TruckNo);
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
                                    CreateSerialNo(CompPurchLine, ReservEntry."Serial No.", ReservEntry."Quantity (Base)");
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
                        ApplicationArea = All;
                        Caption = 'Comapany Name';
                        TableRelation = Company;
                    }
                    field(PurchHdrNo; PurchHdrNo)
                    {
                        ApplicationArea = All;
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
                    field(TruckNo; TruckNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Truck No.';
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
        Message('Item Tracking Lines have been copied');
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
        TruckNo: Option "0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","260","261","262","263","264","265","266","267","268","269","270","271","272","273","274","275","276","277","278","279","280","281","282","283","284","285","286","287","288","289","290","291","292","293","294","295","296","297","298","299","300","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","316","317","318","319","320","321","322","323","324","325","326","327","328","329","330","331","332","333","334","335","336","337","338","339","340","341","342","343","344","345","346","347","348","349","350";

    procedure CreateSerialNo(PurchLine: Record "Purchase Line"; ForSerialNo: Code[20]; QtyBase: Decimal)
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

