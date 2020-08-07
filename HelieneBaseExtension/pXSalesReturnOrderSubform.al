pageextension 59145 SalesReturnOrderSubformExt extends "Sales Return Order Subform"
{
    layout
    {
        addafter("Unit Price")
        {
            field("WP"; "Watts")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Price Per Watt"; "PricePerWatt")
            {
                ApplicationArea = All;
                DecimalPlaces = 4 : 5;
            }
            field("Total Watts"; "SBR Total Watts")
            {
                ApplicationArea = All;
            }
        }
    }
}