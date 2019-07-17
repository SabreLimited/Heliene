pageextension 59131 WarehouseShipmentListExt extends "Warehouse Shipment List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Shipment Method Code")
        {
            field("Truck No."; "Truck No.")
            {
                //ApplicationArea = All;
            }
            field("Ship-To Code"; "SBR Ship-To Code")
            {
                //ApplicationArea = All;
            }
            field("Sales Header"; "SBR Sales Header")
            {
                //ApplicationArea = All;
            }
            field("Quoted Price"; "SBR Quoted Price") { }
            field("Freight Invoices"; "SBR Freight Invoices") { }
            field("Freight Invoice Costs"; "SBR Freight Invoice Costs") { }
            field("Customs Invoice"; "SBR Customs Invoice") { }
            field("Customs Invoice Costs"; "SBR Customs Invoice Costs") { }
            field("Customs Entry No."; "SBR Customs Entry No.") { }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
}