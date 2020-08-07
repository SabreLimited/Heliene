tableextension 59103 "SBRHEL Item Vendor" extends "Item Vendor"
{
    // HEL11.00 / 0005510 / SGR / 2020-06-03
    //   - New object

    fields
    {
        field(59100; "SBRHEL Vendor Name"; Text[50])
        {
            Caption = 'Vendor Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
            Editable = false;
        }
        field(59101; "SBRHEL Status"; Option)
        {
            Caption = 'Status';
            OptionMembers = New,"Under Development",Certified,"n/a",Closed;
        }
        field(59102; "SBRHEL Certification Type"; Text[50])
        {
            Caption = 'Certification Type';
        }
        field(59103; "SBRHEL Certification Date"; Date)
        {
            Caption = 'Certification Date';
        }
    }
}