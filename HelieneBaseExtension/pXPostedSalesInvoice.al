pageextension 59139 PostedSalesInvoiceExtension extends "Posted Sales Invoice"
{
    layout
    {
        addafter("External Document No.")
        {
            field("Total Watts"; "TotalWattage")
            {
                Editable = false;
            }
        }
        addlast(General)
        {
            field("SBRHEL Linked Sales Order No.";"SBRHEL Linked Sales Order No.")
            {
                ApplicationArea = All;
                CaptionClass = LinkedSalesOrderCaption;
                Visible = LinkedCompanyFieldsVisible;
                Editable = false;
            }
            field("SBRHEL Linked Customer Name";"SBRHEL Linked Customer Name")
            {
                ApplicationArea = All;
                CaptionClass = LinkedCustomerCaption;
                Visible = LinkedCompanyFieldsVisible;
                Editable = false;
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

