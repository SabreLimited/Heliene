pageextension 59111 PurchaseOrderSubformExtension extends "Purchase Order Subform"
{

    PromotedActionCategoriesML = ENU = 'Line,Functions,Order,Print Barcodes';

    layout
    {
        addafter("Unit Price (LCY)")
        {
            // Add changes to table fields here
            field(Watts; "Watts")
            {
            }
            field("Cost Per Watt"; "CostPerWatt")
            {
                DecimalPlaces = 4 : 5;
            }
            field("Price Per Watt"; "PricePerWatt")
            {
                DecimalPlaces = 4 : 5;
            }
        }
    }

    actions
    {
        addafter("O&rder")
        {
            group("Print Barcodes")
            {
                action("Print Barcode")
                {
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
        addlast("F&unctions")
        {
            action(CopyReservEntries)
            {
                ApplicationArea = All;
                Caption = 'Copy Serial Nos.';
                Ellipsis = true;
                Image = CopySerialNo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction();
                var
                    PurchLine: Record "Purchase Line";
                begin
                    PurchLine.Get("Document Type", "Document No.", "Line No.");
                    PurchLine.SetRecFilter;
                    Report.RunModal(Report::"SBR Copy Serial Nos PO", true, false, PurchLine);
                end;
            }
        }
    }
}