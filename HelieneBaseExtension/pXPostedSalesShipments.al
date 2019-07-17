pageextension 59137 SBRPstdSalesShipmentListExt extends "Posted Sales Shipments"
{
    layout
    {
        // Add changes to page layout here
        addafter("Shipment Date"){
            field("Order No.";"Order No."){}//Sbr-Jo M4065
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}