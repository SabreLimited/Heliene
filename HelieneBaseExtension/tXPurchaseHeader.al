tableextension 59000 SBRXPurchaseHeader extends "Purchase Header"
{
    fields
    {
        // Add changes to table fields here
        field(50000;"SBR Sales Order No."; Text[35]){
            Caption = 'Sales Order No.';
        }
        field(50001; "SBR Watts"; Decimal){
            Caption = 'Watts';
        }
    }
    
    var
        myInt: Integer;
}