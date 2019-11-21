pageextension 59121 WarehouseShipmentExtension extends "Warehouse Shipment"
{
    // HEL11.00 / 0001 / SGR / 071019
    //   - Added action "Post Shipment & Receipt"

    layout
    {
        addafter(Shipping)
        {

            group("Heliene")
            {
                field("Truck No."; "Truck No.")
                {
                    trigger OnDrillDown()
                    var
                        SalesLine: Record "Sales Line";
                        SalesLines: Page "Sales Lines";
                    begin
                        SalesLine.SetRange("Truck No.", "Truck No.");
                        SalesLine.SetRange("SBR Ship-To Code", "SBR Ship-To Code");
                        SalesLine.SetRange("Document No.", "SBR Sales Header");
                        SalesLines.SetTableView(SalesLine);
                        SalesLines.RUNMODAL();

                    end;
                }
                field("Ship-To Code"; "SBR Ship-To Code") { }
                field("Sales Header"; "SBR Sales Header") { }
                field("Customer Name"; "SBR Customer Name") { }
                field("Module Count"; "SBR Module Count") { }
                field("Quoted Price"; "SBR Quoted Price") { }
                field("Freight Invoices"; "SBR Freight Invoices") { }
                field("Freight Invoice Costs"; "SBR Freight Invoice Costs") { }
                field("Customs Invoice"; "SBR Customs Invoice") { }
                field("Customs Invoice Costs"; "SBR Customs Invoice Costs") { }
                field("Customs Entry No."; "SBR Customs Entry No.") { }
                field("Carrier Rate"; "SBR Carrier Rate") { }
                field("Total Watts Per Truck"; "SBR Total Watts Per Truck") { }
            }
        }
    }

    actions
    {
        addafter("Post and &Print")
        {
            action("PostShipmentReceipt")
            {
                Ellipsis = true;
                Caption = 'Post Shipment & Receipt';
                ApplicationArea = All;
                Promoted = true;
                PromotedIsBig = true;
                Image = PostBatch;
                PromotedCategory = Process;
                trigger OnAction();
                var
                    WhseShipPostReceiveL: Codeunit "Whse. Ship. - Post & Receive";
                begin
                    // HEL11.00 / 0001 / SGR / 071019 BEGIN
                    WhseShipPostReceiveL.SetWarehouseShipmentVariables("No.");
                    CurrPage.WhseShptLines.Page.PostShipmentYesNo; //PostShipmentYesNo;
                    WhseShipPostReceiveL.RUN;
                    // HEL11.00 / 0001 / SGR / 071019 END
                end;
            }
        }
        addlast("F&unctions")
        {
            action(CopyReservEntries)
            {
                ApplicationArea = All;
                Caption = 'Copy Serial Nos.';
                Ellipsis = true;
                Image = CopySerialNo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction();
                var
                    WhseShptHdr: Record "Warehouse Shipment Header";
                begin
                    WhseShptHdr.Get("No.");
                    WhseShptHdr.SetRecFilter;
                    Report.RunModal(Report::"SBR Copy Serial Nos WS", true, false, WhseShptHdr);
                end;
            }
        }
    }
}

