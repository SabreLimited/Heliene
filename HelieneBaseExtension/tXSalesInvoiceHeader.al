tableextension 59117 SalesInvoiceHeaderExt extends "Sales Invoice Header"
{
    fields
    {
        field(59100; "TotalWattage"; Decimal)
        {
            Caption = 'Total Watts';
            DataClassification = ToBeClassified;
        }
        field(59165; "SBRHEL Linked Customer No."; Code[20])
        {
            Caption = 'Linked Customer No.';            
            Editable = false;         
        }
        field(59166; "SBRHEL Linked Sales Order No."; Code[20])
        {
            Caption = 'Linked Sales Order No.';            
            Editable = false;
        }
        field(59167; "SBRHEL Linked Customer Name"; Text[50])
        {
            Caption = 'Linked Customer Name';            
            Editable = false;         
        }
    }
}