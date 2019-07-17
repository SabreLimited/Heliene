pageextension 59110 ItemCardExtension extends "Item Card"
{
    layout
    {
        addafter("Unit Price"){
        // Add changes to table fields here
            field(Watts; "Watts")
            {
            }
            field("Cost Per Watt"; "CostPerWatt")
            {
            DecimalPlaces = 4:5;
            }
            field("Price Per Watt";"PricePerWatt")
            {
            DecimalPlaces = 4:5;
            }
        }
    }
    
    var
        myInt: Integer;
}