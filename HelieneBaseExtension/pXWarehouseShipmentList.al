pageextension 59131 WarehouseShipmentListExt extends "Warehouse Shipment List"
{
    layout
    {
        addafter("Shipment Method Code")
        {
            field("Truck No."; "Truck No.") { }
            field("Ship-To Code"; "SBR Ship-To Code") { }
            field("Sales Header"; "SBR Sales Header") { }
            field("SBR Customer Name"; "SBR Customer Name") { }
            field("Quoted Price"; "SBR Quoted Price") { }
            field("Freight Invoices"; "SBR Freight Invoices") { }
            field("Freight Invoice Costs"; "SBR Freight Invoice Costs") { }
            field("Customs Invoice"; "SBR Customs Invoice") { }
            field("Customs Invoice Costs"; "SBR Customs Invoice Costs") { }
            field("Customs Entry No."; "SBR Customs Entry No.") { }
        }
    }
}