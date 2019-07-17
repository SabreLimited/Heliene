pageextension 59104 SalesInvoiceLinesExt extends "Sales Invoice Subform"
{
    layout
    {
        // Add changes to page layout here
        addafter(Quantity)
        {
            field("Truck No."; "Truck No.")
            {
              ApplicationArea = All;
            }
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
}