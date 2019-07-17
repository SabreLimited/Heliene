pageextension 59112 SalesOrderSubformExtension extends "Sales Order Subform"
{
    layout
    {
        addafter("Unit Price"){
            field("Truck No.";"Truck No."){

            }
            field("WP"; "Watts")
            {
                Editable = false;
            }
            field("Cost Per Watt"; "CostPerWatt")
            {
                DecimalPlaces = 4:5;
            }
            field("Price Per Watt";"PricePerWatt")
            {
                DecimalPlaces = 4:5;
            }
            field("Ship-To Code"; "SBR Ship-To Code"){

            }
            field("Total Watts";"SBR Total Watts"){
                
            }
            field("SBR Prod Order Line Number";"SBR Prod Order Line Number"){
                Caption = 'Production Order Line No.';
            }
            field("SBR Production Order Quantity";"SBR Production Order Quantity"){
                Caption = 'Production Order Qty.';
            }
            field("SBR Production Order Finished Qty";"SBR Production Order Finished Qty"){
                Caption = 'Production Order Finished Qty.';
            }
            field("SBR Production Order Remaining Qty";"SBR Production Order Remaining Qty"){
                Caption = 'Production Order Remaining Qty.';
            }
            field("SBR General Product Posting Group";"Gen. Prod. Posting Group"){
                Caption = 'Gen. Prod. Posting Group';
            }
        }
    }
    actions
    {
        addafter("BlanketOrder")
        {

        }
    }
    
    /*trigger OnAfterGetRecord(); //Symbols error on heliene is unfixable.
    var
        ProductionOrder: Record "Production Order";
        ProdOrderLine : Record "Prod. Order Line";
    begin
        ProductionOrder.SetRange("SBR Sales Order No.", "Document No.");
        ProductionOrder.SetRange("SBR Sales Order Line No.", "Line No.");
        IF ProductionOrder.FindFirst() then begin
            ProdOrderLine.SetRange("Prod. Order No.", ProductionOrder."No.");
            IF ProdOrderLine.FindFirst() THEN begin
                Rec."SBR Prod Order Line Number" := ProdOrderLine."Line No.";
                Rec."SBR Production Order Finished Qty" := ProdOrderLine."Finished Quantity";
                Rec."SBR Production Order Remaining Qty" := ProdOrderLine."Remaining Quantity";
                Rec."SBR Production Order Quantity" := ProdOrderLine.Quantity;
                Rec.Modify();
            end;
        end;      
    end;*/

    var
        myInt: Integer;
}