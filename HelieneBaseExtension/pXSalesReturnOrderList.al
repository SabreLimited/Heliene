pageextension 59146 SalesReturnOrderListExt extends "Sales Return Order List"
{
    layout
    {
        addafter("Amount Including VAT")
        {
            field("Total Watts"; TotalWattage)
            {
                ApplicationArea = All;
                Editable = False;
            }
        }
    }
}