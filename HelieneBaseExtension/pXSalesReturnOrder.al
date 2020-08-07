pageextension 59144 SalesReturnOrderExtension extends "Sales Return Order"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Total Watts"; "TotalWattage")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}