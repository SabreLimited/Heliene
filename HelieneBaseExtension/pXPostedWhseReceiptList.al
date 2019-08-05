pageextension 59140 PostedWhseReceiptListExt extends "Posted Whse. Receipt List"
{
    layout
    {
        addlast(Control1)
        {
            field("SBR Shipping Agent Code"; "SBR Shipping Agent Code")
            {
                ApplicationArea = All;
                Description = 'SBR4219';
                Visible = false;
            }
            field("SBR Quoted Price to Port"; "SBR Quoted Price to Port")
            {
                ApplicationArea = All;
                Description = 'SBR4219';
                Visible = false;
            }
            field("SBR Quoted Price Inland"; "SBR Quoted Price Inland")
            {
                ApplicationArea = All;
                Description = 'SBR4219';
                Visible = false;
            }
            field("SBR Customs Entry #"; "SBR Customs Entry #")
            {
                ApplicationArea = All;
                Description = 'SBR4219';
                Visible = false;
            }
        }
    }
}