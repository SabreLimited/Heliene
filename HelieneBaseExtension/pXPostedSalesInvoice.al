pageextension 59139 PostedSalesInvoiceExtension extends "Posted Sales Invoice"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Total Watts"; "TotalWattage")
            {
                Editable = false;
            }
        }
    }
}

