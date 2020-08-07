pageextension 59147 PostedSalesCreditMemoExtension extends "Posted Sales Credit Memo"
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