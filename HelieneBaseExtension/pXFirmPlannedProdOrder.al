pageextension 59120 FirmPlannedProdOrderExtension extends "Firm Planned Prod. Order"
{
    layout
    {
        addafter("Last Date Modified")
        {
            field("H Status"; "SBRHelStatus")
            {
            }
            field("SBR SO Sell-To-Name"; "SBR SO Sell-To-Name") { }
            field("Variant Code"; "SBR Variant Code") { }
        }
    }

    var
        myInt: Integer;
}

