pageextension 59111 PurchaseOrderSubformExtension extends "Purchase Order Subform"
{

    PromotedActionCategoriesML=ENU='Line,Functions,Order,Print Barcodes';
    layout
    {
        addafter("Unit Price (LCY)"){
        // Add changes to table fields here
            field(Watts; "Watts")
            {
            }
            field("Cost Per Watt"; "CostPerWatt")
            {
            DecimalPlaces = 4:5;
            }
            field("Price Per Watt";"PricePerWatt")
            {
            DecimalPlaces = 4:5;
            }
        }
    }

    actions{
        
        addafter("O&rder"){
            group("Print Barcodes"){
                action("Print Barcode"){
                    Image = BarCode;
                    Promoted = true;
                    
                    trigger OnAction()
                    var
                        BarcodeReport: Report BarcodeReport;
                        PurchaseLine: Record "Purchase Line";
                    begin
                        CurrPage.SetSelectionFilter(PurchaseLine);
                        Report.Run(59112, true, false, PurchaseLine);
                    end;
                }
            }
        }
    }
    

    var
        myInt: Integer;
}