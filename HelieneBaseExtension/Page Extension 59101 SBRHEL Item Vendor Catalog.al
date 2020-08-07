pageextension 59101 "SBRHEL Item Vendor Catalog" extends "Item Vendor Catalog"
{
    // HEL11.00 / 0005510 / SGR / 2020-06-03
    //   - New object

    layout
    {
        addlast(Control1)
        {
            field("SBRHEL Vendor Name"; "SBRHEL Vendor Name")
            {
                ApplicationArea = All;
            }
            field("SBRHEL Status"; "SBRHEL Status")
            {
                ApplicationArea = All;
            }
            field("SBRHEL Certification Type"; "SBRHEL Certification Type")
            {
                ApplicationArea = All;
            }
            field("SBRHEL Certification Date"; "SBRHEL Certification Date")
            {
                ApplicationArea = All;
            }                                    
        }
    }
}