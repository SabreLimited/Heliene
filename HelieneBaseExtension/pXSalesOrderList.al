pageextension 59125 MyExtension extends "Sales Order List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Amount Including VAT"){
            field("Total Watts";TotalWattage){
                Editable = False;
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