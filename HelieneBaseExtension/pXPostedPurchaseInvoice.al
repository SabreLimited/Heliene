pageextension 59134 SBRXPostedPurchaseInvoice extends "Posted Purchase Invoice"
{
    layout
    {
        // Add changes to page layout here
        addafter(Corrective){
            field("SBR Sales Order No.";"SBR Sales Order No."){
                Enabled = false;
            }
            field("SBR Watts";"SBR Watts"){
                Enabled = false;
            }
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}