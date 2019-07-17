report 50102 "SBR Sales - Pro Forma Inv"
{
    // version NAVW111.00

    DefaultLayout = RDLC;
    //RDLCLayout = './SBR Sales - Pro Forma Inv.rdlc';
    WordLayout = './REPORTS/SBR Sales - Pro Forma Inv.docx';
    CaptionML = ENU = 'Pro Forma Invoice',
                ESM = 'Factura proforma',
                FRC = 'Facture pro forma',
                ENC = 'Pro Forma Invoice';

    dataset
    {
        dataitem(Header; "Sales Header")
        {
            DataItemTableView = SORTING ("Document Type", "No.");
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeadingML = ENU = 'Pro Forma Invoice',
                                     ESM = 'Factura proforma',
                                     FRC = 'Facture pro forma',
                                     ENC = 'Pro Forma Invoice';
            column(DocumentDate; FORMAT("Document Date", 0, 4))
            {
            }
            column(FormattedDocumentDate; ExtensionFunctions.getFormattedDate("Document Date")) { }//Sbr-Jo M3928
            column(CompanyPicture; CompanyInformation.Picture)
            {
            }
            column(CompanyEMail; CompanyInformation."E-Mail")
            {
            }
            column(CompanyHomePage; CompanyInformation."Home Page")
            {
            }
            column(CompanyPhoneNo; CompanyInformation."Phone No.")
            {
            }
            column(CompanyVATRegNo; CompanyInformation."VAT Registration No.")
            {
            }
            column(CompanyAddress1; CompanyAddress[1])
            {
            }
            column(CompanyAddress2; CompanyAddress[2])
            {
            }
            column(CompanyAddress3; CompanyAddress[3])
            {
            }
            column(CompanyAddress4; CompanyAddress[4])
            {
            }
            column(CompanyAddress5; CompanyAddress[5])
            {
            }
            column(CompanyAddress6; CompanyAddress[6])
            {
            }
            column(CustomerAddress1; CustomerAddress[1])
            {
            }
            column(CustomerAddress2; CustomerAddress[2])
            {
            }
            column(CustomerAddress3; CustomerAddress[3])
            {
            }
            column(CustomerAddress4; CustomerAddress[4])
            {
            }
            column(CustomerAddress5; CustomerAddress[5])
            {
            }
            column(CustomerAddress6; CustomerAddress[6])
            {
            }
            column(CustomerAddress7; CustomerAddress[7])
            {
            }
            column(CustomerAddress8; CustomerAddress[8])
            {
            }
            column(YourReference; "Your Reference")
            {
            }
            column(ExternalDocumentNo; "External Document No.")
            {
            }
            column(DocumentNo; "No.")
            {
            }
            column(CompanyLegalOffice; CompanyInformation.GetLegalOffice)
            {
            }
            column(SalesPersonName; SalespersonPurchaserName)
            {
            }
            column(ShipmentMethodDescription; ShipmentMethodDescription)
            {
            }
            column(Currency; CurrencyCode)
            {
            }
            column(CustomerVATRegNo; CustomerVATRegistrationNo)
            {
            }
            column(PageLbl; PageLbl)
            {
            }
            column(DocumentTitleLbl; DocumentTitleLbl)
            {
            }
            column(YourReferenceLbl; FIELDCAPTION("Your Reference"))
            {
            }
            column(ExternalDocumentNoLbl; FIELDCAPTION("External Document No."))
            {
            }
            column(CompanyLegalOfficeLbl; CompanyInformation.GetLegalOfficeLbl)
            {
            }
            column(SalesPersonLbl; SalesPersonLblText)
            {
            }
            column(EMailLbl; CompanyInformation.FIELDCAPTION("E-Mail"))
            {
            }
            column(HomePageLbl; CompanyInformation.FIELDCAPTION("Home Page"))
            {
            }
            column(CompanyPhoneNoLbl; CompanyInformation.FIELDCAPTION("Phone No."))
            {
            }
            column(ShipmentMethodDescriptionLbl; DummyShipmentMethod.TABLECAPTION)
            {
            }
            column(CurrencyLbl; DummyCurrency.TABLECAPTION)
            {
            }
            column(ItemLbl; Item.TABLECAPTION)
            {
            }
            column(TariffLbl; Item.FIELDCAPTION("Tariff No."))
            {
            }
            column(UnitPriceLbl; Item.FIELDCAPTION("Unit Price"))
            {
            }
            column(CountryOfManufactuctureLbl; CountryOfManufactuctureLbl)
            {
            }
            column(AmountLbl; Line.FIELDCAPTION(Amount))
            {
            }
            column(VATPctLbl; Line.FIELDCAPTION("VAT %"))
            {
            }
            column(VATAmountLbl; DummyVATAmountLine.VATAmountText)
            {
            }
            column(TotalWeightLbl; TotalWeightLbl)
            {
            }
            column(TotalAmountLbl; TotalAmountLbl)
            {
            }
            column(TotalAmountInclVATLbl; TotalAmountInclVATLbl)
            {
            }
            column(QuantityLbl; Line.FIELDCAPTION(Quantity))
            {
            }
            column(NetWeightLbl; Line.FIELDCAPTION("Net Weight"))
            {
            }
            column(DeclartionLbl; DeclartionLbl)
            {
            }
            column(SignatureLbl; SignatureLbl)
            {
            }
            column(SignatureNameLbl; SignatureNameLbl)
            {
            }
            column(SignaturePositionLbl; SignaturePositionLbl)
            {
            }
            column(VATRegNoLbl; CompanyInformation.FIELDCAPTION("VAT Registration No."))
            {
            }
            column(CustomerShipTo1; CustomerShipTo[1]) { }//SBR-Jo M3826
            column(CustomerShipTo2; CustomerShipTo[2]) { }
            column(CustomerShipTo3; CustomerShipTo[3]) { }
            column(CustomerShipTo4; CustomerShipTo[4]) { }
            column(CustomerShipTo5; CustomerShipTo[5]) { }
            column(CustomerShipTo6; CustomerShipTo[6]) { }
            column("TotalWattsPerInvoice"; "TotalWattage" / 1000) { }
            column(DueDate; "Due Date") { }
            column(FormattedDueDate; ExtensionFunctions.getFormattedDate("Due Date")) { }//Sbr-Jo M3928
            column(PaymentTerms; "Payment Terms Code") { }
            column(PTDueDateCalculation; PTDueDateCalculation) { }
            column(PTDiscountDateCalculation; PTDiscountDateCalculation) { }
            column(PTDiscountPercent; PTDiscountPercent) { }
            column(PTDescription; PTDescription) { }
            column(PTCalcPmtDiscOnCrMem; PTCalcPmtDiscOnCrMem) { }
            column(PTLastModifiedDateTime; PTLastModifiedDateTime) { }
            column(FormattedLastModifiedDateTime; ExtensionFunctions.getFormattedDate(DT2Date(PTLastModifiedDateTime))) { }//Sbr-Jo M3928
            column(PTID; PTID) { }
            column(PTSATPaymentTerm; PTSATPaymentTerm) { } //end m3826
            column(totalKiloWatts; totalKiloWatts) { }
            column(prePaymentAmount; prepaidSum) { }
            column(totalinclPrepayments; Header."Amount Including VAT" - prepaidSum) { }//END SBR-Jo M3840
            dataitem(SalesPersonRec; "Salesperson/Purchaser")//Sbr-Jo M
            {
                DataItemLink = Code = FIELD ("Salesperson Code");
                column(SBRSalespersonCode; Code) { }
                column(SBRSalespersonName; Name) { }
                column(SBRSalespersonCommission; "Commission %") { }
                column(SBRSalespersonEmail; "E-Mail") { }
                column(SBRSalespersonPhone; "Phone No.") { }
                column(SBRSalespersonNextTaskDate; ExtensionFunctions.getFormattedDate(SalesPersonRec."Next Task Date")) { }
            }//Sbr-Jo 
            dataitem(Line; "Sales Line")
            {
                DataItemLink = "Document Type" = FIELD ("Document Type"), "Document No." = FIELD ("No.");
                DataItemLinkReference = Header;
                DataItemTableView = SORTING ("Document No.", "Line No.");
                column(ItemDescription; Description)
                {
                }
                column(CountryOfManufacturing; Item."Country/Region of Origin Code")
                {
                }
                column(Tariff; Item."Tariff No.")
                {
                }
                column(Quantity; "Qty. to Invoice")
                {
                }
                column(Price; LinePrice)
                {
                }
                column(NetWeight; "Net Weight")
                {
                }
                column(LineAmount; LineAmount)
                {
                }
                column(VATPct; "VAT %")
                {
                }
                column(VATAmount; VATAmount)
                {
                }
                column(Watts; Watts) { }//SBR-Jo M3826
                column("ItemNumber"; "No.") { }
                column(ShipmentDate; "Shipment Date") { }
                column(FormattedShipmentDate; ExtensionFunctions.getFormattedDate("Shipment Date")) { }//Sbr-Jo M3928
                column(TruckNo; "Truck No.") { }
                column(TotalWatts; Watts * Quantity) { }
                column(PricePerWatt; PricePerWatt) { }
                column(Modules; Quantity) { }//END SBR-Jo M3826

                trigger OnAfterGetRecord();
                begin
                    Item.GET("No.");

                    if Quantity = 0 then begin
                        LinePrice := "Unit Price";
                        LineAmount := 0;
                        VATAmount := 0;
                    end else begin
                        LinePrice := ROUND(Amount / Quantity);
                        LineAmount := ROUND(Amount * "Qty. to Invoice" / Quantity);
                        VATAmount := ROUND(("Amount Including VAT" - Amount) * "Qty. to Invoice" / Quantity);

                        TotalAmount += LineAmount;
                        TotalWeight += ROUND("Qty. to Invoice" * "Net Weight");
                        TotalVATAmount += VATAmount;
                        TotalAmountInclVAT += ROUND("Amount Including VAT" * "Qty. to Invoice" / Quantity);
                    end;
                end;

                trigger OnPreDataItem();
                begin
                    TotalWeight := 0;
                    TotalAmount := 0;
                    TotalVATAmount := 0;
                    TotalAmountInclVAT := 0;
                    SETRANGE(Type, Type::Item);
                end;
            }
            dataitem(Totals; "Integer")
            {
                MaxIteration = 1;
                column(TotalWeight; TotalWeight)
                {
                }
                column(TotalValue; TotalAmount)
                {
                }
                column(TotalVATAmount; TotalVATAmount)
                {
                }
                column(TotalAmountInclVAT; TotalAmountInclVAT)
                {
                }
            }

            trigger OnAfterGetRecord();
            begin
                FormatDocumentFields(Header);
                populatePaymentTerms(Header);//Sbr-Jo M3826
                calculateKiloWatts(Header);//Sbr-Jo M3840
                calculatePrePaymentInfo(Header);
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        CompanyInformation.GET;
        CompanyInformation.CALCFIELDS(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
        DocumentTitleLbl: TextConst ENU = 'Pro Forma Invoice', ESM = 'Factura proforma', FRC = 'Facture pro forma', ENC = 'Pro Forma Invoice';
        PageLbl: TextConst ENU = 'Page', ESM = 'Página', FRC = 'Page', ENC = 'Page';
        Item: Record Item;
        DummyVATAmountLine: Record "VAT Amount Line";
        DummyShipmentMethod: Record "Shipment Method";
        DummyCurrency: Record Currency;
        CompanyAddress: array[8] of Text[50];
        CustomerAddress: array[8] of Text[50];
        CustomerShipTo: array[8] of Text[50]; //SBR-Jo M3826
        SalesPersonLblText: Text[50];
        CountryOfManufactuctureLbl: TextConst ENU = 'Country', ESM = 'País', FRC = 'Pays', ENC = 'Country';
        TotalWeightLbl: TextConst ENU = 'Total Weight', ESM = 'Peso total', FRC = 'Poids total', ENC = 'Total Weight';
        SalespersonPurchaserName: Text;
        ShipmentMethodDescription: Text;
        CustomerVATRegistrationNo: Text;
        TotalAmountLbl: Text[50];
        TotalAmountInclVATLbl: Text[50];
        CurrencyCode: Code[10];
        TotalWeight: Decimal;
        TotalAmount: Decimal;
        DeclartionLbl: TextConst ENU = 'For customs purposes only.', ESM = 'Solo para fines aduaneros.', FRC = '‡ des fins douanières uniquement.', ENC = 'For customs purposes only.';
        SignatureLbl: TextConst ENU = 'For and on behalf of the above named company:', ESM = 'Para la empresa antes mencionada y en nombre de ella:', FRC = 'Au nom et pour le compte de la compagnie nommée ci-dessus :', ENC = 'For and on behalf of the above named company:';
        SignatureNameLbl: TextConst ENU = 'Name (in print) Signature', ESM = 'Firma de nombre (impreso)', FRC = 'Signature (en toutes lettres) du nom', ENC = 'Name (in print) Signature';
        SignaturePositionLbl: TextConst ENU = 'Position in company', ESM = 'Puesto en la empresa', FRC = 'Poste dans la compagnie', ENC = 'Position in company';
        TotalVATAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        LinePrice: Decimal;
        LineAmount: Decimal;
        VATAmount: Decimal;
        PTDueDateCalculation: DateFormula;//SBR-Jo M3826
        PTDiscountDateCalculation: DateFormula;
        PTDiscountPercent: Decimal;
        PTDescription: Text[50];
        PTCalcPmtDiscOnCrMem: Boolean;
        PTLastModifiedDateTime: DateTime;
        PTID: GUID;
        PTSATPaymentTerm: Code[10];
        totalKiloWatts: Decimal;
        prepaidSum: Decimal;
        ExtensionFunctions: Codeunit ExtensionFunctions;
        //END SBR-Jo M3826

    local procedure FormatDocumentFields(SalesHeader: Record "Sales Header");
    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        ShipmentMethod: Record "Shipment Method";
        ResponsibilityCenter: Record "Responsibility Center";
        Customer: Record Customer;
        FormatDocument: Codeunit "Format Document";
        FormatAddress: Codeunit "Format Address";
        TotalAmounExclVATLbl: Text[50];
    begin
        with SalesHeader do begin
            Customer.GET("Sell-to Customer No.");
            CustomerVATRegistrationNo := Customer."VAT Registration No.";
            FormatDocument.SetSalesPerson(SalespersonPurchaser, "Salesperson Code", SalesPersonLblText);
            SalespersonPurchaserName := SalespersonPurchaser.Name;

            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");
            ShipmentMethodDescription := ShipmentMethod.Description;

            FormatAddress.GetCompanyAddr("Responsibility Center", ResponsibilityCenter, CompanyInformation, CompanyAddress);
            FormatAddress.SalesHeaderBillTo(CustomerAddress, SalesHeader);
            FormatAddress.SalesHeaderShipTo(CustomerShipTo, CustomerAddress, SalesHeader);//SBR-Jo 3826

            if "Currency Code" = '' then begin
                GeneralLedgerSetup.GET;
                GeneralLedgerSetup.TESTFIELD("LCY Code");
                CurrencyCode := GeneralLedgerSetup."LCY Code";
            end else
                CurrencyCode := "Currency Code";

            FormatDocument.SetTotalLabels("Currency Code", TotalAmountLbl, TotalAmountInclVATLbl, TotalAmounExclVATLbl);
        end;
    end;

    local procedure populatePaymentTerms(SalesHeader: Record "Sales Header"); //SBR-Jo M3826
    var
        PaymentTerms: Record "Payment Terms";
    begin
        IF PaymentTerms.GET(SalesHeader."Payment Terms Code") then begin
            PTDueDateCalculation := PaymentTerms."Due Date Calculation";
            PTDiscountDateCalculation := PaymentTerms."Discount Date Calculation";
            PTDiscountPercent := PaymentTerms."Discount %";
            PTDescription := PaymentTerms.Description;
            PTCalcPmtDiscOnCrMem := PaymentTerms."Calc. Pmt. Disc. on Cr. Memos";
            PTLastModifiedDateTime := PaymentTerms."Last Modified Date Time";
            PTID := PaymentTerms.Id;
            PTSATPaymentTerm := PaymentTerms."SAT Payment Term";
        end;
    end;

    local procedure calculateKiloWatts(SalesHeader: record "Sales Header");
    var
        SalesLine: Record "Sales Line";
    begin
        totalKiloWatts := 0;
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        IF SalesLine.FindSet() then begin
            repeat
                totalKiloWatts := totalKiloWatts + (SalesLine.Watts * SalesLine.Quantity);
            until SalesLine.Next = 0;
            totalKiloWatts := totalKiloWatts / 1000;
        end;
    end;

    local procedure calculatePrePaymentInfo(SalesHeader: Record "Sales Header");
    var
        SalesInvoice: Record "Sales Invoice Header";
    begin
        prepaidSum := 0;
        SalesInvoice.SetRange("Prepayment Invoice", true);
        SalesInvoice.SetRange("Prepayment Order No.", SalesHeader."No.");
        if SalesInvoice.findfirst then begin
            repeat
                prepaidSum := SalesInvoice."Amount Including VAT";
            until SalesInvoice.Next = 0;
        end;
    end;
}

