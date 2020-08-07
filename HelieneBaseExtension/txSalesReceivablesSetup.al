tableextension 59112 SBRHELSalesReceivablesSetup extends "Sales & Receivables Setup"
{
    fields
    {
        field(59100; "SBRHEL US Company Name"; Text[30])
        {
            Caption = 'US Company Name';
            DataClassification = CustomerContent;
            TableRelation = Company;
        }        
    }
}