pageextension 59130 PostedWhseReceipt extends "Posted Whse. Receipt"
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
                    Editable = false;
                }
                field("SBR Quoted Price to Port"; "SBR Quoted Price to Port")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                    Editable = false;
                }
                field("SBR Quoted Price Inland"; "SBR Quoted Price Inland")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                    Editable = false;
                }
                field("SBR Customs Entry #"; "SBR Customs Entry #")
                {
                    ApplicationArea = All;
                    Description = 'SBR4219';
                    Editable = false;
                }
            }
        }
    }
}