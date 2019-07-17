codeunit 59124 "SO Approval Management"
{
    trigger OnRun()
    begin
        
    end;
    
    procedure sendEmail(Rec: Record "Sales Header");
    var
        Mail : Codeunit "SMTP Mail";
        RecipientList : Text[5000];
        Subject : Text[200];
        Body: Text[5000];
        SMTPMailSetup : Record "SMTP Mail Setup";
    begin
        IF (Rec."SBR Approval Boolean A" = true) AND (Rec."SBR Approval Boolean B" = true) AND (Rec."SBR Approval Boolean C" = true) then begin
            Message('Sales Document is already approved!');
            exit;
        end;
        SMTPMailSetup.GET();
        RecipientList := populateApprovalRecipients();
        Mail.CreateMessage('NAV Server', SMTPMailSetup."SBR Send As Email", RecipientList, 'Sales Order '+Rec."No."+ ' ready for review', 'There is a sales Order ready for your review in NAV.', false);
        Mail.Send();
    end;

    local procedure populateApprovalRecipients():Text[5000];
    var
        UserSetup : Record "User Setup";
        TempUserSetup : Record "User Setup" temporary;
        Exists : boolean;
        RecipientList : Text[5000];
    begin
        TempUserSetup.DeleteAll();
        UserSetup.SetRange("Can Modify SBR Approved Boolean A", true);
        IF UserSetup.FindFirst() then
            repeat
                TempUserSetup.Init();
                TempUserSetup.TransferFields(UserSetup);
                TempUserSetup.Insert();
            until UserSetup.NExt = 0;
        UserSetup.reset;
        UserSetup.SetRange("Can Modify SBR Approved Boolean B", true);
        IF UserSetup.FindFirst() then
            repeat
                Exists := false;
                TempUserSetup.Reset();
                IF TempUserSetup.FindSet() then begin
                    repeat
                        if TempUserSetup."User ID" = UserSetup."User ID" then
                            Exists := true;
                    until TempUserSetup.next = 0;
                end;
                if (Exists <> true) then begin
                    TempUserSetup.Init();
                    TempUserSetup.TransferFields(UserSetup);
                    TempUserSetup.Insert();
                end;
            until UserSetup.NExt = 0;
        UserSetup.reset;
        UserSetup.SetRange("Can Modify SBR Approved Boolean C", true);
        IF UserSetup.FindFirst() then
            repeat
                Exists := false;
                TempUserSetup.Reset();
                IF TempUserSetup.FindSet() then begin
                    repeat
                        if TempUserSetup."User ID" = UserSetup."User ID" then
                            Exists := true;
                    until TempUserSetup.next = 0;
                end;
                if (Exists <> true) then begin
                    TempUserSetup.Init();
                    TempUserSetup.TransferFields(UserSetup);
                    TempUserSetup.Insert();
                end;
            until UserSetup.NExt = 0;
        IF TempUserSetup.FindFirst() then
        repeat
            if (StrLen(RecipientList) > 0) AND (Strlen(TempUserSetup."E-Mail") > 0) then
              RecipientList := RecipientList + ', ';
            RecipientList := RecipientList + TempUserSetup."E-Mail";
        until TempUserSetup.Next = 0;
        exit(RecipientList);
    end;

    var
        myInt: Integer;
}