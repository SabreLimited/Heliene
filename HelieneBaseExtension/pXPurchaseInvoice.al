pageextension 59133 SBRXPurchaseInvoice extends "Purchase Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter("Job Queue Status"){
            field("SBR Sales Order No.";"SBR Sales Order No."){}
            field("SBR Watts";"SBR Watts"){}
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}