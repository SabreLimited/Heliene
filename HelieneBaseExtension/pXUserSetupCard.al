pageextension 59124 pageExtensionUserCard extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addafter("Email"){
            field("Can Approve Boolean A";"Can Modify SBR Approved Boolean A"){}
            field("Can Approve Boolean B";"Can Modify SBR Approved Boolean B"){}
            field("Can Approve Boolean C";"Can Modify SBR Approved Boolean C"){}
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
}