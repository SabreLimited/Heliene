tableextension 59107 tXValueEntry extends "Value Entry"
{

    fields
    {

        field(59100; "SBRHEL Source Order No."; Code[20])
        {
            Caption = 'Source Order No.';
        }
    }
    
    trigger OnBeforeInsert()
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
    begin
        if ItemLedgerEntry.Get("Item Ledger Entry No.") then
            "SBRHEL Source Order No." := ItemLedgerEntry."SBRHEL Source Order No.";
    end;
}