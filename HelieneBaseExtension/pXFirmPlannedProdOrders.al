pageextension 59118 FirmPlannedProdOrdersExtension extends "Firm Planned Prod. Orders"
{
    layout
    {
        addafter("Bin Code")
        {
            // SBR-Jo Aug 29,2018 M3706
            field("H Status"; "SBRHelStatus")
            {
            }
            field("Truck No."; "Truck No.") { }
            field("SBR SO Sell-To-Name"; "SBR SO Sell-To-Name") { }
        }
    }

    var
        myInt: Integer;
}

