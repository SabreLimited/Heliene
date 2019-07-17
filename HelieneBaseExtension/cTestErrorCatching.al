codeunit 59127 testErrorCatching
{
    trigger OnRun()
    begin
        Rec.TestField("SBR Date Req to Archive");
        Rec.Testfield("SBR Bool Req to Archive");
    end;
    
    var
        Rec: Record "Sales Header";
}