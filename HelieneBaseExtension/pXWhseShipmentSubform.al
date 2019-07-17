pageextension 59132 whseSubformExt extends "Whse. Shipment Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Assemble to Order")
        {
            field("SBR Ship-To Code"; "SBR Ship-To Code") { }
            field("SBR Truck No."; "SBR Truck No.") { }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}