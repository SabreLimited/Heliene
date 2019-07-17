report 59112 BarcodeReport
{
    DefaultLayout = RDLC;
    RDLCLayout = './REPORTS/BarcodeReport.rdlc';

    dataset
    {
        dataitem(PurchaseLine; "Purchase Line")
        {
            RequestFilterFields = "Document No.";
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
    
}