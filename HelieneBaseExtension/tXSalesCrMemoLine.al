tableextension 59125 SalesCrMemoLineExt extends "Sales Cr.Memo Line"
{
    fields
    {
        field(59101; "Watts"; Decimal)
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
}