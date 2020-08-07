pageextension 59125 SalesOrderListExt extends "Sales Order List"
{
    layout
    {
        addafter("Amount Including VAT")
        {
            field("Total Watts"; TotalWattage)
            {
                Editable = False;
            }
        }
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