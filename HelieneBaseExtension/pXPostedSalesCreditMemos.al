pageextension 59149 PostedSalesCreditMemosExt extends "Posted Sales Credit Memos"
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