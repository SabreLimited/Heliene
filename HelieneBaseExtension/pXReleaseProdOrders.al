pageextension 59123 relProdOrdersExt extends "Released Production Orders"
{
    layout
    {
        addafter("Bin Code")
        {
            field("Truck No."; "Truck No.") { }
            field("SBR SO Sell-To-Name"; "SBR SO Sell-To-Name") { }

        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}