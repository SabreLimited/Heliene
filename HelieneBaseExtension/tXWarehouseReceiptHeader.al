tableextension 59122 WarehouseReceiptHeaderExt extends "Warehouse Receipt Header"
{
    fields
    {
        field(59100; "SBR Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            Description = 'SBR4219';
            TableRelation = "Shipping Agent";
        }
        field(59101; "SBR Shipment Method Code"; Code[10])
        {
            Caption = 'Shipment Method Code';
            Description = 'SBR4219';
            TableRelation = "Shipment Method";
        }
        field(59102; "SBR Pickup Date"; Date)
        {
            Caption = 'Pickup Date';
            Description = 'SBR4219';
        }
        field(59103; "SBR Quoted Price to Port";Decimal)
        {
            Caption = 'Quoted Price to Port';
            Description = 'SBR4219';
        }
        field(59104;"SBR Quoted Price Inland";Decimal)
        {
            Caption = 'Quoted Price Inland';
            Description = 'SBR4219';
        }
        field(59105; "SBR Freight Invoices"; Text[30])
        {
            Caption = 'Freight Invoices';
            Description = 'SBR4219';
        }        
        field(59106; "SBR ISF Required and/or Filed"; Text[30])
        {
            Caption = 'ISF Required and/or Filed';
            Description = 'SBR4219';
        }            
        field(59107; "SBR Arrival Notice/Manifest #"; Text[30])
        {
            Caption = 'Arrival Notice/Manifest #';
            Description = 'SBR4219';
        }            
        field(59108; "SBR Customs Entry #"; Text[30])
        {
            Caption = 'Customs Entry #';
            Description = 'SBR4219';
        }        
    }
}