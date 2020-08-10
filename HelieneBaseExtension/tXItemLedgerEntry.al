tableextension 59104 tXItemLedgerEntry extends "Item Ledger Entry"
{

    fields
    {

        field(59100; "SBRHEL Source Order No."; Code[20])
        {
            Caption = 'Source Order No.';
        }
    }
    
    trigger OnBeforeInsert()
    var
        SalesShptHeader: Record "Sales Shipment Header";
        ReturnShptHeader: Record "Return Shipment Header";
        PurchRcptHeader: Record "Purch. Rcpt. Header";
        ReturnRcptHeader: Record "Return Receipt Header";
    begin
        case "Entry Type" of
            "Entry Type"::Purchase:
                case "Document Type" of
                    "Document Type"::"Purchase Receipt":
                        if PurchRcptHeader.Get("Document No.") then
                            "SBRHEL Source Order No." := PurchRcptHeader."Order No.";
                    "Document Type"::"Purchase Return Shipment":
                        if ReturnShptHeader.Get("Document No.") then
                            "SBRHEL Source Order No." := ReturnShptHeader."Return Order No.";
                end;
            "Entry Type"::Sale:
                case "Document Type" of
                    "Document Type"::"Sales Shipment":
                        if SalesShptHeader.Get("Document No.") then
                            "SBRHEL Source Order No." := SalesShptHeader."Order No.";
                    "Document Type"::"Sales Return Receipt":
                        if ReturnRcptHeader.Get("Document No.") then
                            "SBRHEL Source Order No." := ReturnRcptHeader."Return Order No.";
                end;        
        end;
    end;
}