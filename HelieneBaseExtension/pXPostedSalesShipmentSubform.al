pageextension 59108 PostedSalesShipmentSubformExt extends "Posted Sales Shpt. Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter("Quantity Invoiced")
        {
            field("Truck No."; "Truck No.")
            {
             // ApplicationArea = All;
            }
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
}