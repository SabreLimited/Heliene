// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

/*pageextension 59100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}*/

tableextension 59116 SalesHeaderExt extends "Sales Header"
{
    fields
    {

        field(59100; "TotalWattage"; Decimal)
        {
            Caption = 'Total Watts';
            DataClassification = ToBeClassified;
        }
        field(59101;"SBR Approval Boolean A"; Boolean){
            Caption = 'Approval Boolean A';
        }
        field(59102;"SBR Approval Boolean B"; Boolean){
            Caption = 'Approval Boolean B';
        }
        field(59103;"SBR Approval Boolean C"; Boolean){
            Caption = 'Approval Boolean C';
        }
        field(59104;"SBR Date Req to Archive";Date){
            Caption = 'Date Req to Archive';
        }
        field(59105;"SBR Bool Req to Archive"; Boolean){
            Caption = 'Bool Req to Archive';
        }
        // Add changes to table fields here
    }
    
    var
}