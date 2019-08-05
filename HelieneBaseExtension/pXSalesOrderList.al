pageextension 59125 SalesOrderListExt extends "Sales Order List"
{
    layout
    {
        addafter("Amount Including VAT")
        {
            field("Total Watts"; TotalWattage)
            {
                Editable = False;
            }
        }
    }
}