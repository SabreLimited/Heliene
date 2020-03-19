pageextension 59143 ProdBOMVersionListExt extends "Prod. BOM Version List"
{
    layout
    {
        addafter(Description)
        {
            field(Status;Status)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }
}