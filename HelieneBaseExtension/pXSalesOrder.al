pageextension 59117 SalesOrderExtension extends "Sales Order"
{
    layout
    {
        addafter("External Document No.")
        {
            // Add changes to table fields here
            field("Total Watts"; "TotalWattage")
            {
                Editable = false;
            }
            field("Approval Boolean A"; "SBR Approval Boolean A") { }
            field("Approval Boolean B"; "SBR Approval Boolean B") { }
            field("Approval Boolean C"; "SBR Approval Boolean C") { }
            field("Date Req to Archive"; "SBR Date Req to Archive") { }
            field("Bool Req to Archive"; "SBR Bool Req to Archive") { }
        }
        addlast(General)
        {
            field("SBRHEL Linked Sales Order No.";"SBRHEL Linked Sales Order No.")
            {
                ApplicationArea = All;
                CaptionClass = LinkedSalesOrderCaption;
                Visible = LinkedCompanyFieldsVisible;
                Editable = SelectUSOrderVisible;                
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
        addafter("ProformaInvoice")
        {
            action("SO Approval Email")
            {
                trigger OnAction();
                var
                    SoApprovalManagement: Codeunit "SO Approval Management";
                begin
                    SoApprovalManagement.SendEmail(Rec);
                end;
            }            
        }    
        addlast("F&unctions")
        {
            action(SBRHELSelectUSOrder)
            {
                Caption = 'Select US Sales Order';
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category7;
                Image = Select_Purchase_Order;
                Visible = SelectUSOrderVisible;
                Enabled = SelectUSOrderVisible;

                trigger OnAction();
                var
                    SalesSetup: Record "Sales & Receivables Setup";
                    SalesHeader: Record "Sales Header";
                    SalesHeader2: Record "Sales Header";
                begin
                    CurrPage.SaveRecord;

                    SalesSetup.Get;
                    SalesSetup.TestField("SBRHEL US Company Name");

                    SalesHeader.ChangeCompany(SalesSetup."SBRHEL US Company Name");
                    SalesHeader.SetRange("Document Type",SalesHeader."Document Type"::Order);
                    if Page.RunModal(Page::"Sales List",SalesHeader) <> "Action"::LookupOK then
                        exit;

                    SalesHeader.TestField("SBRHEL Linked Sales Order No.",'');

                    if "SBRHEL Linked Sales Order No." <> '' then begin
                        SalesHeader2.ChangeCompany(SalesSetup."SBRHEL US Company Name");
                        if SalesHeader2.Get(SalesHeader."Document Type"::Order,"SBRHEL Linked Sales Order No.") then begin 
                            SalesHeader2."SBRHEL Linked Customer No." := '';
                            SalesHeader2."SBRHEL Linked Customer Name" := '';
                            SalesHeader2."SBRHEL Linked Sales Order No." := '';
                            SalesHeader2.Modify; 
                        end;
                    end;

                    SalesHeader.Get("Document Type"::Order,SalesHeader."No.");
                    SalesHeader."SBRHEL Linked Customer No." := "Sell-to Customer No.";
                    SalesHeader."SBRHEL Linked Customer Name" := "Sell-to Customer Name";
                    SalesHeader."SBRHEL Linked Sales Order No." := "No.";
                    SalesHeader.Modify;

                    "SBRHEL Linked Customer No." := SalesHeader."Sell-to Customer No.";
                    "SBRHEL Linked Customer Name" := SalesHeader."Sell-to Customer Name";
                    "SBRHEL Linked Sales Order No." := SalesHeader."No.";
                    Modify;

                    CurrPage.Update(false);
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

