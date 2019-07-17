pageextension 59127 smtpmailSetup extends "SMTP Mail Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Secure Connection"){
            field("Send As Email";"SBR Send As Email"){}
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}