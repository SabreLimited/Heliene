pageextension 59121 WarehouseShipmentExtension extends "Warehouse Shipment"
{
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

    var
        myInt: Integer;

}
