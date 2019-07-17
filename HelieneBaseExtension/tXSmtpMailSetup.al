tableextension 59126 smtpMailExt extends "SMTP Mail Setup"
{
    fields
    {
        // Add changes to table fields here
        field(59100; "SBR Send As Email"; text[100]){
            Caption = 'Send as Email';
        }
    }
    
    var
        myInt: Integer;
}