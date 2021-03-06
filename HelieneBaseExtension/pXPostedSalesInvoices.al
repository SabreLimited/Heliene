pageextension 59141 PostedSalesInvoicesExtension extends "Posted Sales Invoices"
{
    layout
    {
        addlast(Control1)
        {
            field("Total Watts"; TotalWattage)
            {
                Editable = false;
                Visible = false;
            }
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