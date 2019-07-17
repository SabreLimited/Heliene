pageextension 59117 SalesOrderExtension extends "Sales Order"
{
    layout
    {
        addafter("External Document No."){
        // Add changes to table fields here
            field("Total Watts"; "TotalWattage")
            {
                Editable = false;
            }
            field("Approval Boolean A"; "SBR Approval Boolean A"){}
            field("Approval Boolean B"; "SBR Approval Boolean B"){}
            field("Approval Boolean C"; "SBR Approval Boolean C"){}
            field("Date Req to Archive";"SBR Date Req to Archive"){}
            field("Bool Req to Archive";"SBR Bool Req to Archive"){}
        }
    }
    actions
    {
        addafter("ProformaInvoice")
        {
            action("SO Approval Email"){
                trigger OnAction();
                var
                    SoApprovalManagement : Codeunit "SO Approval Management";
                begin
                    SoApprovalManagement.SendEmail(Rec);
                end;

            }
        }
    }

    var
        myInt: Integer;

}

