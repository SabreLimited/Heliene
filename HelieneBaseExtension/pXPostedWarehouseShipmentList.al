pageextension 59002 pxPstedWhseShptList extends "Posted Whse. Shipment List"
{
    layout
    {
        // Add changes to page layout here
        addafter("Shipment Method Code")
        {
            field("Quoted Price"; "SBR Quoted Price") { }
            field("Freight Invoices"; "SBR Freight Invoices") { }
            field("Freight Invoice Costs"; "SBR Freight Invoice Costs") { }
            field("Customs Invoice"; "SBR Customs Invoice") { }
            field("Customs Invoice Costs"; "SBR Customs Invoice Costs") { }
            field("Customs Entry No."; "SBR Customs Entry No.") { }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}