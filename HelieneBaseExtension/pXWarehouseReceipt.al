pageextension 59128 WarehouseReceiptExtension extends "Warehouse Receipt"
{
    layout
    {
        addlast(Content)
        {

            group("Heliene")
            {
                field("SBR Shipping Agent Code"; "SBR Shipping Agent Code")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                }
                field("SBR Shipment Method Code"; "SBR Shipment Method Code")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                }
                field("SBR Pickup Date"; "SBR Pickup Date")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                }
                field("SBR Quoted Price to Port"; "SBR Quoted Price to Port")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                }
                field("SBR Quoted Price Inland"; "SBR Quoted Price Inland")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                }
                field("SBR Freight Invoices"; "SBR Freight Invoices")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                }
                field("SBR ISF Required and/or Filed"; "SBR ISF Required and/or Filed")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                }
                field("SBR Arrival Notice/Manifest #"; "SBR Arrival Notice/Manifest #")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                }
                field("SBR Customs Entry #"; "SBR Customs Entry #")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                }
            }
        }
    }
}