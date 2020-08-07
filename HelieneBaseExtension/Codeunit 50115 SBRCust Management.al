codeunit 50115 "SBRCust Management"
{
    // HEL11.00 / 0005558 / SGR / 2020-06-09
    //   - New object

    procedure SetDeliveronTimeorDelayedOnSalesHeader(var SalesHeaderP: Record "Sales Header")
    begin
        with SalesHeaderP do
        begin
            IF "Posting Date" > "Requested Delivery Date" then
                "SBRHEL Deliver on time or Delayed" := "SBRHEL Deliver on time or Delayed"::Late
            else
                "SBRHEL Deliver on Time or Delayed" := "SBRHEL Deliver on Time or Delayed"::"On Time";
        end;
    end;

    procedure GetLinkedCompanyParameters(var LinkedCustomerCaption:Text;var LinkedSalesOrderCaption:Text; 
        var SelectUSOrderVisible: Boolean;var LinkedCompanyFieldsVisible: Boolean)
    var
        Company: Record Company;
        SalesSetup: Record "Sales & Receivables Setup";
    begin 
        SalesSetup.Get();

        SelectUSOrderVisible := SalesSetup."SBRHEL US Company Name" <> '';
        LinkedCompanyFieldsVisible := SalesSetup."SBRHEL US Company Name" <> '';        
        if not LinkedCompanyFieldsVisible then 
            if Company.FindSet then
                repeat
                    SalesSetup.ChangeCompany(Company.Name);
                    if SalesSetup.Get and 
                        (SalesSetup."SBRHEL US Company Name" = CompanyName)
                    then
                        LinkedCompanyFieldsVisible := true;
                until (Company.Next = 0) or LinkedCompanyFieldsVisible;

        if LinkedCompanyFieldsVisible then 
            if SalesSetup."SBRHEL US Company Name" <> CompanyName then begin 
                LinkedCustomerCaption := 'US Customer Name';
                LinkedSalesOrderCaption := 'US Sales Order No.';
            end else begin 
                LinkedCustomerCaption := 'CA Customer Name';
                LinkedSalesOrderCaption := 'CA Sales Order No.';
            end;        
    end;
}