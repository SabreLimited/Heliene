pageextension 59141 PostedSalesInvoicesExtension extends "Posted Sales Invoices"
{
    layout
    {
        addlast(Control1)
        {
            field("Total Watts"; TotalWattage)
            {
                Editable = false;
                Visible = false;
            }
        }
    }
}