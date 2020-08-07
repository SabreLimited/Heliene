pageextension 59148 PostedSalesCrMemoSubformExt extends "Posted Sales Cr. Memo Subform"
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
        }
    }
}