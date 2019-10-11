pageextension 59142 SBRXPurchaseOrder extends "Purchase Order"
{
    actions
    {
        addlast("F&unctions")
        {
            action(CopyReservEntries)
            {
                Caption = 'Copy Serial Nos.';
                Image = CopySerialNo;
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction();
                var
                    PurchHdr: Record "Purchase Header";
                begin
                    PurchHdr.Get("Document Type","No.");
                    PurchHdr.SetRecFilter;
                    Report.RunModal(Report::"IC Copy Serial Nos PO", true, false, PurchHdr);
                end;
            }
        }
    }
}