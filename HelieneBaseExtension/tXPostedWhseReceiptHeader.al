tableextension 59023 txPstdWhseRcptHdr extends "Posted Whse. Receipt Header"
{
    fields
    {
        field(59100; "SBR Shipping Agent Code"; Code[10])
        {
            Caption = 'Shipping Agent Code';
            Description = 'SBR4219';
            TableRelation = "Shipping Agent";
        }        
        field(59103; "SBR Quoted Price to Port"; Decimal)
        {
            Caption = 'Quoted Price to Port';
            Description = 'SBR4219';
        }
        field(59104; "SBR Quoted Price Inland"; Decimal)
        {
            Caption = 'Quoted Price Inland';
            Description = 'SBR4219';
        }
        field(59108; "SBR Customs Entry #"; Text[30])
        {
            Caption = 'Customs Entry #';
            Description = 'SBR4219';
        }                
    }
}