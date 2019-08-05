tableextension 59116 SalesHeaderExt extends "Sales Header"
{
    fields
    {

        field(59100; "TotalWattage"; Decimal)
        {
            Caption = 'Total Watts';
            DataClassification = ToBeClassified;
        }
        field(59101; "SBR Approval Boolean A"; Boolean)
        {
            Caption = 'Approval Boolean A';
        }
        field(59102; "SBR Approval Boolean B"; Boolean)
        {
            Caption = 'Approval Boolean B';
        }
        field(59103; "SBR Approval Boolean C"; Boolean)
        {
            Caption = 'Approval Boolean C';
        }
        field(59104; "SBR Date Req to Archive"; Date)
        {
            Caption = 'Date Req to Archive';
        }
        field(59105; "SBR Bool Req to Archive"; Boolean)
        {
            Caption = 'Bool Req to Archive';
        }
    }
}