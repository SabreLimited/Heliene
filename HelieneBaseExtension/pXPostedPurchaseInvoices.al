pageextension 59138 SBRXPostedPurchaseInvoices extends "Posted Purchase Invoices"
{
    layout
    {
        addlast(Control1)
        {
            field("SBR Sales Order No."; "SBR Sales Order No.")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("SBR Watts"; "SBR Watts")
            {
                ApplicationArea = All;
                Visible = false;
            }
        }
    }
}