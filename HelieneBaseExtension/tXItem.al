tableextension 59109 ItemExtension extends Item
{
    fields
    {
        // Add changes to table fields here
        field(59101; "Watts"; Decimal)//Changed from Int at Pat's Request -SbrJo m3704
        {
            Caption = 'Watts';
            DataClassification = ToBeClassified;
        }
        field(59102; "CostPerWatt"; Decimal)
        {
            Caption = 'Cost Per Watt';
            DataClassification = ToBeClassified;
            DecimalPlaces = 4:5;
        }
        field(59103; "PricePerWatt"; Decimal)
        {
            Caption = 'Price Per Watt';
            DataClassification = ToBeClassified;
            DecimalPlaces = 4:5;
        }
    }
    
    var
        myInt: Integer;
}