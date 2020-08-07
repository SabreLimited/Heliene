pageextension 59115 SBRHELSalesList extends "Sales List"
{
     layout
    {
        addlast(Control1)
        {
            field("SBRHEL Linked Sales Order No.";"SBRHEL Linked Sales Order No.")
            {
                ApplicationArea = All;
                CaptionClass = LinkedSalesOrderCaption;
                Visible = LinkedCompanyFieldsVisible;
            }        
            field("SBRHEL Linked Customer Name";"SBRHEL Linked Customer Name")
            {
                ApplicationArea = All;
                CaptionClass = LinkedCustomerCaption;
                Visible = LinkedCompanyFieldsVisible;
            }
        }    
    }
    actions
    {
        modify(Card)
        {
            Visible = false;      
            Enabled = false;          
        }
        addafter(Card)
        {
            action(SBRHELCard)
            {
                Caption = 'Card';
                Image = EditLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;

                trigger OnAction();
                var
                    SalesHeader: Record "Sales Header";
                    PageManagement: Codeunit "Page Management";
                begin 
                    if SalesHeader.Get("Document Type","No.") and (SalesHeader."No." = "No.") and 
                        (SalesHeader."Sell-to Customer No." = "Sell-to Customer No.")
                    then
                        PageManagement.PageRun(Rec);
                end;
            }
        }
    }

    trigger OnOpenPage();
    begin
       SBRCustMgt.GetLinkedCompanyParameters(LinkedCustomerCaption,LinkedSalesOrderCaption,SelectUSOrderVisible,LinkedCompanyFieldsVisible);
    end;

    var        
        SBRCustMgt: Codeunit "SBRCust Management";
        LinkedCustomerCaption: Text;
        LinkedSalesOrderCaption: Text;
        [InDataSet]
        SelectUSOrderVisible: Boolean;
        [InDataSet]
        LinkedCompanyFieldsVisible: Boolean;
}