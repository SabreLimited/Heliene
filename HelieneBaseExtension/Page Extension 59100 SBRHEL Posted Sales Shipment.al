pageextension 59100 "SBRHEL Posted Sales Shipment" extends "Posted Sales Shipment"
{
    // HEL11.00 / 0005558 / SGR / 2020-04-28
    //   - New object

    layout
    {
        addafter(Shipping)
        {
            group(SBRHELHeliene)
            {
                Caption = 'Heliene';

                field("SBRHEL Truck No."; "SBRHEL Truck No.")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Ship-To Code"; "SBRHEL Ship-To Code")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Sales Header"; "SBRHEL Sales Header")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Quoted Price"; "SBRHEL Quoted Price")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Customer Name"; "SBRHEL Customer Name")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Module Count"; "SBRHEL Module Count")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Freight Invoices"; "SBRHEL Freight Invoices")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Freight Invoice Costs"; "SBRHEL Freight Invoice Costs")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Customs Invoice"; "SBRHEL Customs Invoice")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Customs Invoice Costs"; "SBRHEL Customs Invoice Costs")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Customs Entry No."; "SBRHEL Customs Entry No.")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Carrier Rate"; "SBRHEL Carrier Rate")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Total Watts Per Truck"; "SBRHEL Total Watts Per Truck")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Deliver on Time or Delayed"; "SBRHEL Deliver on Time or Delayed")
                {
                    ApplicationArea = All;
                }
                field("SBRHEL Reasoning for Delay"; "SBRHEL Reasoning for Delay")
                {
                    ApplicationArea = All;
                }                                                                                                                                                                                                                
            }
        }
    }
}