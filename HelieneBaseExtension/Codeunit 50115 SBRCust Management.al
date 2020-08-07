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
}