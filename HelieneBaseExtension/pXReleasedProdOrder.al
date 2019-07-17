//"SBR Sales Order Line No."
pageextension 59126 relProdOrderExt extends "Released Production Order"
{
    layout
    {
        addafter("SBR Sales Order Line No.")
        {
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