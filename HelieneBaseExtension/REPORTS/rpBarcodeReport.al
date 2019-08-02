report 59112 BarcodeReport
{
    dataset
    {
        dataitem(PurchaseLine; "Purchase Line")
        {
            column(PL_DocNo; "Document No.")
            {
                
            }
            column(PL_ItemNo; "No.")
            {
                
            }
            column(PL_LineNo; "Line No.")
            {
                
            }
            column(PL_Description; "Description")
            {
                
            }
        }
    }
    
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    field("Purchase Order"; PurchaseLine."Document No.")
                    {
                        
                    }
                }
            }
        }
    
        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    
                }
            }
        }
    }
    
    var
        myInt: Integer;
}