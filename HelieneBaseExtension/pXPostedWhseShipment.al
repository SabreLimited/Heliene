pageextension 59003 pxPstedWhseShipment extends "Posted Whse. Shipment"
{
    layout
    {
        // Add changes to page layout here
        addafter("Assignment Time")
        {
            field("Quoted Price"; "SBR Quoted Price") { }
            field("Freight Invoices"; "SBR Freight Invoices") { }
            field("Freight Invoice Costs"; "SBR Freight Invoice Costs") { }
            field("Customs Invoice"; "SBR Customs Invoice") { }
            field("Customs Invoice Costs"; "SBR Customs Invoice Costs") { }
            field("Customs Entry No."; "SBR Customs Entry No.") { }
            field("Deliver on time or Delayed"; "SBR Deliver on time or Delayed") { }
            field("Reasoning for Delay"; "SBR Reasoning for Delay")
            {
                Editable = true;
                Enabled = true;
            }
            field("Carrier Rate"; "SBR Carrier Rate") { }
            field("Total Watts Per Truck"; "SBR Total Watts Per Truck") { }
            field("Sales Header"; "SBR Sales Header") { }//SBR-Jo M3974
            field("Ship-To Code"; "SBR Ship-To Code") { }//SBR-Jo M3974
            field("Truck No."; "Truck No.") { }//SBR-Jo M3974
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}