codeunit 59130 ExtensionFunctions
{
    trigger OnRun()
    begin

    end;

    procedure getFormattedDate(unformattedDate: Date): Text;
    begin
        exit(FORMAT(unformattedDate, 0, '<Closing><Month,2>/<Day,2>/<Year>'));
        //exit(FORMAT(date2dmy(unformattedDate, 2)) + '/' + FORMAT(date2dmy(unformattedDate, 1)) + '/' + FORMAT(date2dmy(unformattedDate, 3)));
    end;


    var
        myInt: Integer;
}