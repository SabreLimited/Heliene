pageextension 59106 PostedSalesShipmentLinesExt extends "Posted Sales Shipment Lines"
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