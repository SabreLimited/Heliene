pageextension 59135 SBRXPostedPurchaseReceipt extends "Posted Purchase Receipt"
{
    layout
    {
        // Add changes to page layout here
        addafter("Responsibility Center"){
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