pageextension 59102 SalesLinesExt extends "Sales Lines"
{
    layout
    {
        // Add changes to page layout here
        addafter("Outstanding Quantity")
        {
            field("Truck No."; "Truck No.")
            {
              ApplicationArea = All;
            }
            FIELD("Ship To Code";"SBR Ship-To Code")
            {
                CaptionML = ENU='Ship-To Code';
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
        }
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    /*trigger OnAfterGetRecord(); //Sbr-Jo I cannot fix the symbols error on Heliene 
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
}