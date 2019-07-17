report 50101 "SBR Sales - Order Conf." //Was Report 1305
{

    WordLayout = './REPORTS/SBR Sales - Order Conf..docx';
    CaptionML = ENU = 'Sales - Confirmation',
                ESM = 'Venta - Confirmación',
                FRC = 'Ventes - Confirmation',
                ENC = 'Sales - Confirmation';
    DefaultLayout = Word;
    PreviewMode = PrintLayout;
    WordMergeDataItem = Header;

    dataset
    {
        dataitem(Header; "Sales Header")
        {
            DataItemTableView = SORTING ("Document Type", "No.") WHERE ("Document Type" = CONST (Order));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeadingML = ENU = 'Sales Order',
                                     ESM = 'Pedido venta',
                                     FRC = 'Document de vente',
                                     ENC = 'Sales Order';
            column(CompanyAddress1; CompanyAddr[1])
            {
            }
            column(CompanyAddress2; CompanyAddr[2])
            {
            }
            column(CompanyAddress3; CompanyAddr[3])
            {
            }
            column(CompanyAddress4; CompanyAddr[4])
            {
            }
            column(CompanyAddress5; CompanyAddr[5])
            {
            }
            column(CompanyAddress6; CompanyAddr[6])
            {
            }
            column(CompanyHomePage; CompanyInfo."Home Page")
            {
            }
            column(CompanyEMail; CompanyInfo."E-Mail")
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {
            }
            column(CompanyPhoneNo_Lbl; CompanyInfoPhoneNoLbl)
            {
            }
            column(CompanyGiroNo; CompanyInfo."Giro No.")
            {
            }
            column(CompanyGiroNo_Lbl; CompanyInfoGiroNoLbl)
            {
            }
            column(CompanyBankName; CompanyInfo."Bank Name")
            {
            }
            column(CompanyBankName_Lbl; CompanyInfoBankNameLbl)
            {
            }
            column(CompanyBankBranchNo; CompanyInfo."Bank Branch No.")
            {
            }
            column(CompanyBankBranchNo_Lbl; CompanyInfo.FIELDCAPTION("Bank Branch No."))
            {
            }
            column(CompanyBankAccountNo; CompanyInfo."Bank Account No.")
            {
            }
            column(CompanyBankAccountNo_Lbl; CompanyInfoBankAccNoLbl)
            {
            }
            column(CompanyIBAN; CompanyInfo.IBAN)
            {
            }
            column(CompanyIBAN_Lbl; CompanyInfo.FIELDCAPTION(IBAN))
            {
            }
            column(CompanySWIFT; CompanyInfo."SWIFT Code")
            {
            }
            column(CompanySWIFT_Lbl; CompanyInfo.FIELDCAPTION("SWIFT Code"))
            {
            }
            column(CompanyLogoPosition; CompanyLogoPosition)
            {
            }
            column(CompanyRegistrationNumber; CompanyInfo.GetRegistrationNumber)
            {
            }
            column(CompanyRegistrationNumber_Lbl; CompanyInfo.GetRegistrationNumberLbl)
            {
            }
            column(CompanyVATRegNo; CompanyInfo.GetVATRegistrationNumber)
            {
            }
            column(CompanyVATRegNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl)
            {
            }
            column(CompanyVATRegistrationNo; CompanyInfo.GetVATRegistrationNumber)
            {
            }
            column(CompanyVATRegistrationNo_Lbl; CompanyInfo.GetVATRegistrationNumberLbl)
            {
            }
            column(CompanyLegalOffice; CompanyInfo.GetLegalOffice)
            {
            }
            column(CompanyLegalOffice_Lbl; CompanyInfo.GetLegalOfficeLbl)
            {
            }
            column(CompanyCustomGiro; CompanyInfo.GetCustomGiro)
            {
            }
            column(CompanyCustomGiro_Lbl; CompanyInfo.GetCustomGiroLbl)
            {
            }
            column(CompanyLegalStatement; GetLegalStatement)
            {
            }
            column(CustomerAddress1; CustAddr[1])
            {
            }
            column(CustomerAddress2; CustAddr[2])
            {
            }
            column(CustomerAddress3; CustAddr[3])
            {
            }
            column(CustomerAddress4; CustAddr[4])
            {
            }
            column(CustomerAddress5; CustAddr[5])
            {
            }
            column(CustomerAddress6; CustAddr[6])
            {
            }
            column(CustomerAddress7; CustAddr[7])
            {
            }
            column(CustomerAddress8; CustAddr[8])
            {
            }
            column(CustomerPostalBarCode; FormatAddr.PostalBarCode(1))
            {
            }
            column(YourReference; "External Document No.")
            {
            }
            column(YourReference_Lbl; FIELDCAPTION("External Document No."))
            {
            }
            column(ShipmentMethodDescription; ShipmentMethod.Description)
            {
            }
            column(ShipmentMethodDescription_Lbl; ShptMethodDescLbl)
            {
            }
            column(ShipmentDate; FORMAT("Shipment Date", 0, 4))
            {
            }
            column(FormattedShipmentDate; ExtensionFunctions.getFormattedDate("Shipment Date")) { }//Sbr-Jo M3928
            column(ShipmentDate_Lbl; FIELDCAPTION("Shipment Date"))
            {
            }
            column(Shipment_Lbl; ShipmentLbl)
            {
            }
            column(ShowShippingAddress; ShowShippingAddr)
            {
            }
            column(ShipToAddress_Lbl; ShiptoAddrLbl)
            {
            }
            column(ShipToAddress1; ShipToAddr[1])
            {
            }
            column(ShipToAddress2; ShipToAddr[2])
            {
            }
            column(ShipToAddress3; ShipToAddr[3])
            {
            }
            column(ShipToAddress4; ShipToAddr[4])
            {
            }
            column(ShipToAddress5; ShipToAddr[5])
            {
            }
            column(ShipToAddress6; ShipToAddr[6])
            {
            }
            column(ShipToAddress7; ShipToAddr[7])
            {
            }
            column(ShipToAddress8; ShipToAddr[8])
            {
            }
            column(PaymentTermsDescription; PaymentTerms.Description)
            {
            }
            column(PaymentTermsDescription_Lbl; PaymentTermsDescLbl)
            {
            }
            column(PaymentMethodDescription; PaymentMethod.Description)
            {
            }
            column(PaymentMethodDescription_Lbl; PaymentMethodDescLbl)
            {
            }
            column(DocumentCopyText; STRSUBSTNO(DocumentCaption, CopyText))
            {
            }
            column(BilltoCustumerNo; "Bill-to Customer No.")
            {
            }
            column(BilltoCustomerNo_Lbl; FIELDCAPTION("Bill-to Customer No."))
            {
            }
            column(DocumentDate; FORMAT("Document Date", 0, 4))
            {
            }
            column(FormattedDocumentDate; FORMAT(date2dmy("Document Date", 2)) + '/' + FORMAT(date2dmy("Document Date", 1)) + '/' + FORMAT(date2dmy("Document Date", 3))) { }//Sbr-Jo M3928
            column(DocumentDate_Lbl; FIELDCAPTION("Document Date"))
            {
            }
            column(DueDate; FORMAT("Due Date", 0, 4))
            {
            }
            column(FormattedDueDate; FORMAT(date2dmy("Due Date", 2)) + '/' + FORMAT(date2dmy("Due Date", 1)) + '/' + FORMAT(date2dmy("Due Date", 3))) { }//Sbr-Jo M3928
            column(DueDate_Lbl; FIELDCAPTION("Due Date"))
            {
            }
            column(DocumentNo; "No.")
            {
            }
            column(DocumentNo_Lbl; InvNoLbl)
            {
            }
            column(PONumber_Lbl; PONumberLbl)
            {
            }
            column(QuoteNo; "Quote No.")
            {
            }
            column(QuoteNo_Lbl; FIELDCAPTION("Quote No."))
            {
            }
            column(PricesIncludingVAT; "Prices Including VAT")
            {
            }
            column(PricesIncludingVAT_Lbl; FIELDCAPTION("Prices Including VAT"))
            {
            }
            column(PricesIncludingVATYesNo; FORMAT("Prices Including VAT"))
            {
            }
            column(SalesPerson_Lbl; SalespersonLbl)
            {
            }
            column(Salesperson_Lbl2; SalespersonLbl2)
            {
            }
            column(SalesPersonBlank_Lbl; SalesPersonText)
            {
            }
            column(SalesPersonName; SalespersonPurchaser.Name)
            {
            }
            column(SelltoCustomerNo; "Sell-to Customer No.")
            {
            }
            column(SelltoCustomerNo_Lbl; FIELDCAPTION("Sell-to Customer No."))
            {
            }
            column(VATRegistrationNo; GetCustomerVATRegistrationNumber)
            {
            }
            column(VATRegistrationNo_Lbl; GetCustomerVATRegistrationNumberLbl)
            {
            }
            column(GlobalLocationNumber; GetCustomerGlobalLocationNumber)
            {
            }
            column(GlobalLocationNumber_Lbl; GetCustomerGlobalLocationNumberLbl)
            {
            }
            column(LegalEntityType; Cust.GetLegalEntityType)
            {
            }
            column(LegalEntityType_Lbl; Cust.GetLegalEntityTypeLbl)
            {
            }
            column(Copy_Lbl; CopyLbl)
            {
            }
            column(EMail_Lbl; EMailLbl)
            {
            }
            column(HomePage_Lbl; HomePageLbl)
            {
            }
            column(InvoiceDiscountBaseAmount_Lbl; InvDiscBaseAmtLbl)
            {
            }
            column(InvoiceDiscountAmount_Lbl; InvDiscountAmtLbl)
            {
            }
            column(LineAmountAfterInvoiceDiscount_Lbl; LineAmtAfterInvDiscLbl)
            {
            }
            column(LocalCurrency_Lbl; LocalCurrencyLbl)
            {
            }
            column(ExchangeRateAsText; ExchangeRateText)
            {
            }
            column(Page_Lbl; PageLbl)
            {
            }
            column(SalesInvoiceLineDiscount_Lbl; SalesInvLineDiscLbl)
            {
            }
            column(DocumentTitle; SalesConfirmationLbl)
            {
            }
            column(Subtotal_Lbl; SubtotalLbl)
            {
            }
            column(Total_Lbl; TotalLbl)
            {
            }
            column(VATAmount_Lbl; VATAmtLbl)
            {
            }
            column(VATBase_Lbl; VATBaseLbl)
            {
            }
            column(VATAmountSpecification_Lbl; VATAmtSpecificationLbl)
            {
            }
            column(VATClauses_Lbl; VATClausesLbl)
            {
            }
            column(VATIdentifier_Lbl; VATIdentifierLbl)
            {
            }
            column(VATPercentage_Lbl; VATPercentageLbl)
            {
            }
            column(VATClause_Lbl; VATClause.TABLECAPTION)
            {
            }
            column(ExtDocNo_SalesHeader; "External Document No.")
            {
            }
            column(ShowWorkDescription; ShowWorkDescription)
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column("RequestedDeliveryAddress"; "Requested Delivery Date") { } //SBR-Jo M3841
            column(RequestedDeliveryDateText; FORMAT("Requested Delivery Date")) { }
            column("PlannedDeliveryDate"; "Promised Delivery Date") { }//END SBR-Jo M3841
            column(FormattedPlannedDeliveryDate; SBRPlannedDeliveryDate) { } //Sbr-Jo m3928
            column(FormattedRequestedDeliveryDate; SBRRequestedDeliveryDate) { } //Sbr-Jo m3928
                column(GrandTotalWatts; TotalWatts) { }//Sbr-Jo M3841 //Sbr-Jo Moved from line to header

            dataitem(Line; "Sales Line")
            {
                DataItemLink = "Document No." = FIELD ("No.");
                DataItemLinkReference = Header;
                DataItemTableView = SORTING ("Document No.", "Line No.");
                UseTemporary = true;
                column(LineNo_Line; "Line No.")
                {
                }
                column(AmountExcludingVAT_Line; Amount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(AmountExcludingVAT_Line_Lbl; FIELDCAPTION(Amount))
                {
                }
                column(AmountIncludingVAT_Line; "Amount Including VAT")
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(AmountIncludingVAT_Line_Lbl; FIELDCAPTION("Amount Including VAT"))
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(Description_Line; Description)
                {
                }
                column(Description_Line_Lbl; FIELDCAPTION(Description))
                {
                }
                column(LineDiscountPercent_Line; "Line Discount %")
                {
                }
                column(LineDiscountPercentText_Line; LineDiscountPctText)
                {
                }
                column(LineAmount_Line; FormattedLineAmount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(LineAmount_Line_Lbl; FIELDCAPTION("Line Amount"))
                {
                }
                column(ItemNo_Line; "No.")
                {
                }
                column(ItemNo_Line_Lbl; FIELDCAPTION("No."))
                {
                }
                column(ShipmentDate_Line; FORMAT("Shipment Date"))
                {
                }
                column(FormattedShipmentDate_Line; SBRFormattedShipmentDate_Line) { } //Sbr-Jo M3928
                column(ShipmentDate_Line_Lbl; PostedShipmentDateLbl)
                {
                }
                column(Quantity_Line; FormattedQuantity)
                {
                }
                column(Quantity_Line_Lbl; FIELDCAPTION(Quantity))
                {
                }
                column(Type_Line; FORMAT(Type))
                {
                }
                column(UnitPrice; FormattedUnitPrice)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 2;
                }
                column(UnitPrice_Lbl; FIELDCAPTION("Unit Price"))
                {
                }
                column(UnitOfMeasure; "Unit of Measure")
                {
                }
                column(UnitOfMeasure_Lbl; FIELDCAPTION("Unit of Measure"))
                {
                }
                column(Unit_Lbl; UnitLbl)
                {
                }
                column(VATIdentifier_Line; "VAT Identifier")
                {
                }
                column(VATIdentifier_Line_Lbl; FIELDCAPTION("VAT Identifier"))
                {
                }
                column(VATPct_Line; FormattedVATPct)
                {
                }
                column(VATPct_Line_Lbl; FIELDCAPTION("VAT %"))
                {
                }
                column(TransHeaderAmount; TransHeaderAmount)
                {
                    AutoFormatExpression = "Currency Code";
                    AutoFormatType = 1;
                }
                column(CrossReferenceNo; "Cross-Reference No.")
                {
                }
                column(CrossReferenceNo_Lbl; FIELDCAPTION("Cross-Reference No."))
                {
                }
                column(UnitPrice_Lbl2; UnitPriceLbl)
                {
                }
                column(LineAmount_Lbl; LineAmountLbl)
                {
                }
                column(Watts; Watts)
                {
                }
                column(PricePerWatt; PricePerWatt)
                {
                }
                column(TotalWatts; Watts * Quantity)
                {
                }
                column(TotalKW; (Watts * Quantity) / 1000)
                {
                }
                column(TruckNo; "Truck No.")
                {
                }
                column(LinePlannedDeliveryDate; "Planned Delivery Date")
                {
                }
                column(FormattedLinePlannedDeliveryDate; SBRFormattedPlannedDeliveryDate_Line) { } //Sbr-Jo M3928
                column(LineNo_singleDigits; "Line No." / 1000)//SBR-Jo M3841
                {
                }
                column(Line_RequestedDeliveryDate; "Requested Delivery Date") { }//SBR-Jo M3841
                column(FormattedLine_RequestedDeliveryDate; SBRFormattedRequestedDeliveryDate_Line) { } //Sbr-Jo M3928

                dataitem(AssemblyLine; "Assembly Line")
                {
                    DataItemTableView = SORTING ("Document No.", "Line No.");
                    column(LineNo_AssemblyLine; "No.")
                    {
                    }
                    column(Description_AssemblyLine; Description)
                    {
                    }
                    column(Quantity_AssemblyLine; Quantity)
                    {
                        DecimalPlaces = 0 : 5;
                    }
                    column(UnitOfMeasure_AssemblyLine; GetUOMText("Unit of Measure Code"))
                    {
                    }
                    column(VariantCode_AssemblyLine; "Variant Code")
                    {
                    }

                    trigger OnPreDataItem();
                    begin
                        if not DisplayAssemblyInformation then
                            CurrReport.BREAK;
                        if not AsmInfoExistsForLine then
                            CurrReport.BREAK;
                        SETRANGE("Document Type", AsmHeader."Document Type");
                        SETRANGE("Document No.", AsmHeader."No.");
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    if Type = Type::"G/L Account" then
                        "No." := '';

                    if "Line Discount %" = 0 then
                        LineDiscountPctText := ''
                    else
                        LineDiscountPctText := STRSUBSTNO('%1%', -ROUND("Line Discount %", 0.1));

                    if DisplayAssemblyInformation then
                        AsmInfoExistsForLine := AsmToOrderExists(AsmHeader);

                    TransHeaderAmount += PrevLineAmount;
                    PrevLineAmount := "Line Amount";
                    TotalSubTotal += "Line Amount";
                    TotalInvDiscAmount -= "Inv. Discount Amount";
                    TotalAmount += Amount;
                    TotalAmountVAT += "Amount Including VAT" - Amount;
                    TotalAmountInclVAT += "Amount Including VAT";
                    TotalPaymentDiscOnVAT += -("Line Amount" - "Inv. Discount Amount" - "Amount Including VAT");

                    FormatDocument.SetSalesLine(Line, FormattedQuantity, FormattedUnitPrice, FormattedVATPct, FormattedLineAmount);
                    //TotalWatts += Watts;
                    if FirstLineHasBeenOutput then
                        CLEAR(CompanyInfo.Picture);
                    FirstLineHasBeenOutput := true;
                    IF "Shipment Date" <> 0D THEN
                        SBRFormattedShipmentDate_Line := Format(Date2dmy("Shipment Date", 2)) + '/' + format(Date2dmy("Shipment Date", 1)) + '/' + format(Date2dmy("Shipment Date", 3));
                    IF "Planned Delivery Date" <> 0D then
                        SBRFormattedPlannedDeliveryDate_Line := Format(Date2dmy("Planned Delivery Date", 2)) + '/' + format(Date2dmy("Planned Delivery Date", 1)) + '/' + format(Date2dmy("Planned Delivery Date", 3));
                    IF "Requested Delivery Date" <> 0D then
                        SBRFormattedRequestedDeliveryDate_Line := Format(Date2dmy("Requested Delivery Date", 2)) + '/' + format(Date2dmy("Requested Delivery Date", 1)) + '/' + format(Date2dmy("Requested Delivery Date", 3));
                end;

                trigger OnPreDataItem();
                begin
                    MoreLines := FIND('+');
                    while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) and (Amount = 0) do
                        MoreLines := NEXT(-1) <> 0;
                    if not MoreLines then
                        CurrReport.BREAK;
                    SETRANGE("Line No.", 0, "Line No.");
                    CurrReport.CREATETOTALS("Line Amount", Amount, "Amount Including VAT", "Inv. Discount Amount");
                    TransHeaderAmount := 0;
                    PrevLineAmount := 0;
                    FirstLineHasBeenOutput := false;
                    CompanyInfo.CALCFIELDS(Picture);
                end;
            }
            dataitem(WorkDescriptionLines; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 .. 99999));
                column(WorkDescriptionLineNumber; Number)
                {
                }
                column(WorkDescriptionLine; WorkDescriptionLine)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    if not TempBlobWorkDescription.MoreTextLines then
                        CurrReport.BREAK;
                    WorkDescriptionLine := TempBlobWorkDescription.ReadTextLine;
                end;

                trigger OnPostDataItem();
                begin
                    CLEAR(TempBlobWorkDescription);
                end;

                trigger OnPreDataItem();
                begin
                    if not ShowWorkDescription then
                        CurrReport.BREAK;
                    TempBlobWorkDescription.Blob := Header."Work Description";
                end;
            }
            dataitem(VATAmountLine; "VAT Amount Line")
            {
                DataItemTableView = SORTING ("VAT Identifier", "VAT Calculation Type", "Tax Group Code", "Use Tax", Positive);
                UseTemporary = true;
                column(InvoiceDiscountAmount_VATAmountLine; "Invoice Discount Amount")
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(InvoiceDiscountAmount_VATAmountLine_Lbl; FIELDCAPTION("Invoice Discount Amount"))
                {
                }
                column(InvoiceDiscountBaseAmount_VATAmountLine; "Inv. Disc. Base Amount")
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(InvoiceDiscountBaseAmount_VATAmountLine_Lbl; FIELDCAPTION("Inv. Disc. Base Amount"))
                {
                }
                column(LineAmount_VatAmountLine; "Line Amount")
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(LineAmount_VatAmountLine_Lbl; FIELDCAPTION("Line Amount"))
                {
                }
                column(VATAmount_VatAmountLine; "VAT Amount")
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATAmount_VatAmountLine_Lbl; FIELDCAPTION("VAT Amount"))
                {
                }
                column(VATAmountLCY_VATAmountLine; VATAmountLCY)
                {
                }
                column(VATAmountLCY_VATAmountLine_Lbl; VATAmountLCYLbl)
                {
                }
                column(VATBase_VatAmountLine; "VAT Base")
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(VATBase_VatAmountLine_Lbl; FIELDCAPTION("VAT Base"))
                {
                }
                column(VATBaseLCY_VATAmountLine; VATBaseLCY)
                {
                }
                column(VATBaseLCY_VATAmountLine_Lbl; VATBaseLCYLbl)
                {
                }
                column(VATIdentifier_VatAmountLine; "VAT Identifier")
                {
                }
                column(VATIdentifier_VatAmountLine_Lbl; FIELDCAPTION("VAT Identifier"))
                {
                }
                column(VATPct_VatAmountLine; "VAT %")
                {
                    DecimalPlaces = 0 : 5;
                }
                column(VATPct_VatAmountLine_Lbl; FIELDCAPTION("VAT %"))
                {
                }
                column(NoOfVATIdentifiers; COUNT)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    VATBaseLCY :=
                      GetBaseLCY(
                        Header."Posting Date", Header."Currency Code",
                        Header."Currency Factor");
                    VATAmountLCY :=
                      GetAmountLCY(
                        Header."Posting Date", Header."Currency Code",
                        Header."Currency Factor");

                    TotalVATBaseLCY += VATBaseLCY;
                    TotalVATAmountLCY += VATAmountLCY;

                    if "VAT Clause Code" <> '' then begin
                        VATClauseLine := VATAmountLine;
                        if VATClauseLine.INSERT then;
                    end;
                end;

                trigger OnPreDataItem();
                begin
                    CurrReport.CREATETOTALS(
                      "Line Amount", "Inv. Disc. Base Amount",
                      "Invoice Discount Amount", "VAT Base", "VAT Amount",
                      VATBaseLCY, VATAmountLCY);

                    TotalVATBaseLCY := 0;
                    TotalVATAmountLCY := 0;

                    VATClauseLine.DELETEALL;
                end;
            }
            dataitem(VATClauseLine; "VAT Amount Line")
            {
                UseTemporary = true;
                column(VATIdentifier_VATClauseLine; "VAT Identifier")
                {
                }
                column(Code_VATClauseLine; VATClause.Code)
                {
                }
                column(Code_VATClauseLine_Lbl; VATClause.FIELDCAPTION(Code))
                {
                }
                column(Description_VATClauseLine; VATClause.Description)
                {
                }
                column(Description2_VATClauseLine; VATClause."Description 2")
                {
                }
                column(VATAmount_VATClauseLine; "VAT Amount")
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(NoOfVATClauses; COUNT)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    if "VAT Clause Code" = '' then
                        CurrReport.SKIP;
                    if not VATClause.GET("VAT Clause Code") then
                        CurrReport.SKIP;
                    VATClause.TranslateDescription(Header."Language Code");
                end;
            }
            dataitem(ReportTotalsLine; "Report Totals Buffer")
            {
                DataItemTableView = SORTING ("Line No.");
                UseTemporary = true;
                column(Description_ReportTotalsLine; Description)
                {
                }
                column(Amount_ReportTotalsLine; Amount)
                {
                }
                column(AmountFormatted_ReportTotalsLine; "Amount Formatted")
                {
                }
                column(FontBold_ReportTotalsLine; "Font Bold")
                {
                }
                column(FontUnderline_ReportTotalsLine; "Font Underline")
                {
                }

                trigger OnPreDataItem();
                begin
                    CreateReportTotalLines;
                end;
            }
            dataitem(USReportTotalsLine; "Report Totals Buffer")
            {
                DataItemTableView = SORTING ("Line No.");
                UseTemporary = true;
                column(Description_USReportTotalsLine; Description)
                {
                }
                column(Amount_USReportTotalsLine; Amount)
                {
                }
                column(AmountFormatted_USReportTotalsLine; "Amount Formatted")
                {
                }
                column(FontBold_USReportTotalsLine; "Font Bold")
                {
                }
                column(FontUnderline_USReportTotalsLine; "Font Underline")
                {
                }

                trigger OnPreDataItem();
                begin
                    CreateUSReportTotalLines;
                end;
            }
            dataitem(LetterText; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                column(GreetingText; GreetingLbl)
                {
                }
                column(BodyText; BodyLbl)
                {
                }
                column(ClosingText; ClosingLbl)
                {
                }
                column(PmtDiscText; PmtDiscText)
                {
                }

                trigger OnPreDataItem();
                begin
                    PmtDiscText := '';
                    if Header."Payment Discount %" <> 0 then
                        PmtDiscText := STRSUBSTNO(PmtDiscTxt, Header."Pmt. Discount Date", Header."Payment Discount %");
                end;
            }
            dataitem(Totals; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                column(TotalNetAmount; TotalAmount)
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATBaseLCY; TotalVATBaseLCY)
                {
                }
                column(TotalAmountIncludingVAT; TotalAmountInclVAT)
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATAmount; TotalAmountVAT)
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalVATAmountLCY; TotalVATAmountLCY)
                {
                }
                column(TotalInvoiceDiscountAmount; TotalInvDiscAmount)
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalPaymentDiscountOnVAT; TotalPaymentDiscOnVAT)
                {
                }
                column(TotalVATAmountText; VATAmountLine.VATAmountText)
                {
                }
                column(TotalExcludingVATText; TotalExclVATText)
                {
                }
                column(TotalIncludingVATText; TotalInclVATText)
                {
                }
                column(TotalSubTotal; TotalSubTotal)
                {
                    AutoFormatExpression = Header."Currency Code";
                    AutoFormatType = 1;
                }
                column(TotalSubTotalMinusInvoiceDiscount; TotalSubTotal + TotalInvDiscAmount)
                {
                }
                column(TotalText; TotalText)
                {
                }
                column(AmountSubjectToSalesTax; VATAmountLine.GetAmtSubjectToSalesTax)
                {
                }
                column(AmountSubjectToSalesTaxLbl; AmtSubjecttoSalesTaxLbl)
                {
                }
                column(AmountExemptFromSalesTax; VATAmountLine.GetAmtExemptFromSalesTax)
                {
                }
                column(AmountExemptFromSalesTaxLbl; AmtExemptfromSalesTaxLbl)
                {
                }
            }

            trigger OnAfterGetRecord();
            var
                CurrencyExchangeRate: Record "Currency Exchange Rate";
                ArchiveManagement: Codeunit ArchiveManagement;
                SalesPost: Codeunit "Sales-Post";
                SalesLine:record "Sales Line";
            begin
                FirstLineHasBeenOutput := false;
                CLEAR(Line);
                CLEAR(SalesPost);
                VATAmountLine.DELETEALL;
                Line.DELETEALL;
                SalesPost.GetSalesLines(Header, Line, 0);
                if "Tax Area Code" = '' then begin
                    Line.CalcVATAmountLines(0, Header, Line, VATAmountLine);
                    Line.UpdateVATOnLines(0, Header, Line, VATAmountLine)
                end else
                    Line.CalcSalesTaxLines(Header, Line);

                if not CurrReport.PREVIEW then
                    CODEUNIT.RUN(CODEUNIT::"Sales-Printed", Header);

                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                CALCFIELDS("Work Description");
                ShowWorkDescription := "Work Description".HASVALUE;

                FormatAddr.GetCompanyAddr("Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
                FormatAddr.SalesHeaderBillTo(CustAddr, Header);
                ShowShippingAddr := FormatAddr.SalesHeaderShipTo(ShipToAddr, CustAddr, Header);

                if not Cust.GET("Bill-to Customer No.") then
                    CLEAR(Cust);

                if "Currency Code" <> '' then begin
                    CurrencyExchangeRate.FindCurrency("Posting Date", "Currency Code", 1);
                    CalculatedExchRate :=
                      ROUND(1 / "Currency Factor" * CurrencyExchangeRate."Exchange Rate Amount", 0.000001);
                    ExchangeRateText := STRSUBSTNO(ExchangeRateTxt, CalculatedExchRate, CurrencyExchangeRate."Exchange Rate Amount");
                end;

                FormatDocumentFields(Header);

                if not CurrReport.PREVIEW and
                   (CurrReport.USEREQUESTPAGE and ArchiveDocument or
                    not CurrReport.USEREQUESTPAGE and SalesSetup."Archive Quotes and Orders")
                then
                    ArchiveManagement.StoreSalesDocument(Header, LogInteraction);

                if LogInteraction and not CurrReport.PREVIEW then begin
                    CALCFIELDS("No. of Archived Versions");
                    if "Bill-to Contact No." <> '' then
                        SegManagement.LogDocument(
                          3, "No.", "Doc. No. Occurrence",
                          "No. of Archived Versions", DATABASE::Contact, "Bill-to Contact No."
                          , "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.")
                    else
                        SegManagement.LogDocument(
                          3, "No.", "Doc. No. Occurrence",
                          "No. of Archived Versions", DATABASE::Customer, "Bill-to Customer No.",
                          "Salesperson Code", "Campaign No.", "Posting Description", "Opportunity No.");
                end;

                TotalSubTotal := 0;
                TotalInvDiscAmount := 0;
                TotalAmount := 0;
                TotalAmountVAT := 0;
                TotalAmountInclVAT := 0;
                TotalPaymentDiscOnVAT := 0;
//Sbr-Jo
                IF("Promised Delivery Date" <> 0D) THEN
                  SBRPlannedDeliveryDate := Format(date2dmy("Promised Delivery Date", 2)) + '/' + Format(date2dmy("Promised Delivery Date", 1)) + '/' + Format(date2dmy("Promised Delivery Date", 3));
                IF "Requested Delivery Date" <> 0D THEN
                  SBRRequestedDeliveryDate := Format(date2dmy("Requested Delivery Date", 2)) + '/' + Format(date2dmy("Requested Delivery Date", 1)) + '/' + Format(date2dmy("Requested Delivery Date", 3));
                SalesLine.Reset;
                TotalWatts := 0;
                SalesLine.SetRange("Document No.", "No.");
                SalesLine.SetRange("Document Type", "Document Type");
                IF SalesLine.FindSet THEN
                    repeat
                        TotalWatts := TotalWatts + (SalesLine.Watts * SalesLine.Quantity);
                    until SalesLine.Next = 0; //End Sbr-jo
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    CaptionML = ENU = 'Options',
                                ESM = 'Opciones',
                                FRC = 'Options',
                                ENC = 'Options';
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionML = ENU = 'Log Interaction',
                                    ESM = 'Log interacción',
                                    FRC = 'Journal interaction',
                                    ENC = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTipML = ENU = 'Specifies if you want to record the related interactions with the involved contact person in the Interaction Log Entry table.',
                                    ESM = 'Especifica si desea registrar las interacciones relacionadas con la persona de contacto implicada en la tabla Mov. log de interacción.',
                                    FRC = 'Spécifie si vous souhaitez enregistrer les interactions associées avec la personne de contact impliquée dans la table Écriture du journal d''interaction.',
                                    ENC = 'Specifies if you want to record the related interactions with the involved contact person in the Interaction Log Entry table.';
                    }
                    field(DisplayAsmInformation; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        CaptionML = ENU = 'Show Assembly Components',
                                    ESM = 'Mostrar componentes del ensamblado',
                                    FRC = 'Afficher les composantes d''assemblage',
                                    ENC = 'Show Assembly Components';
                        ToolTipML = ENU = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.',
                                    ESM = 'Especifica si desea que el informe incluya información sobre componentes que se utilizaron en pedidos de ensamblado vinculados que suministraron el producto de venta.',
                                    FRC = 'Spécifie si vous souhaitez que le rapport contienne des informations sur les composantes qui ont été utilisées dans des ordres d''assemblage liés qui ont fourni le ou les articles vendus.',
                                    ENC = 'Specifies if you want the report to include information about components that were used in linked assembly orders that supplied the item(s) being sold.';
                    }
                    field(ArchiveDocument; ArchiveDocument)
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionML = ENU = 'Archive Document',
                                    ESM = 'Archivar documento',
                                    FRC = 'Archiver document',
                                    ENC = 'Archive Document';
                        ToolTipML = ENU = 'Specifies if the document is archived after you print it.',
                                    ESM = 'Especifica si el documento se archiva después de imprimirlo.',
                                    FRC = 'Indique si le document est archivé après son impression.',
                                    ENC = 'Specifies if the document is archived after you print it.';

                        trigger OnValidate();
                        begin
                            if not ArchiveDocument then
                                LogInteraction := false;
                        end;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit();
        begin
            LogInteractionEnable := true;
            ArchiveDocument := SalesSetup."Archive Quotes and Orders";
        end;

        trigger OnOpenPage();
        begin
            InitLogInteraction;
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;
        CompanyInfo.GET;
        SalesSetup.GET;
        CompanyInfo.VerifyAndSetPaymentInfo;
    end;

    trigger OnPreReport();
    begin
        if Header.GETFILTERS = '' then
            ERROR(NoFilterSetErr);

        if not CurrReport.USEREQUESTPAGE then
            InitLogInteraction;

        CompanyLogoPosition := SalesSetup."Logo Position on Documents";
    end;

    var
        SalesConfirmationLbl: TextConst ENU = 'Order Confirmation', ESM = 'Confirmación pedido', FRC = 'Confirmation de commande', ENC = 'Order Confirmation';
        SalespersonLbl: TextConst ENU = 'Sales person', ESM = 'Vendedor', FRC = 'Vendeur', ENC = 'Sales person';
        CompanyInfoBankAccNoLbl: TextConst ENU = 'Account No.', ESM = 'Nº cuenta', FRC = 'N° de compte', ENC = 'Account No.';
        CompanyInfoBankNameLbl: TextConst ENU = 'Bank', ESM = 'Banco', FRC = 'Banque', ENC = 'Bank';
        CompanyInfoGiroNoLbl: TextConst ENU = 'Giro No.', ESM = 'Nº giro postal', FRC = 'N° CCP', ENC = 'Giro No.';
        CompanyInfoPhoneNoLbl: TextConst ENU = 'Phone No.', ESM = 'Nº teléfono', FRC = 'N° téléphone', ENC = 'Phone No.';
        CopyLbl: TextConst ENU = 'Copy', ESM = 'Copiar', FRC = 'Copier', ENC = 'Copy';
        EMailLbl: TextConst ENU = 'Email', ESM = 'Correo electrónico', FRC = 'Courriel', ENC = 'Email';
        HomePageLbl: TextConst ENU = 'Home Page', ESM = 'Página Web', FRC = 'Page d''accueil', ENC = 'Home Page';
        InvDiscBaseAmtLbl: TextConst ENU = 'Invoice Discount Base Amount', ESM = 'Importe base descuento factura', FRC = 'Montant de base d''escompte de la facture', ENC = 'Invoice Discount Base Amount';
        InvDiscountAmtLbl: TextConst ENU = 'Invoice Discount', ESM = 'Descuento factura', FRC = 'Escompte de la facture', ENC = 'Invoice Discount';
        InvNoLbl: TextConst ENU = 'Order No.', ESM = 'Nº pedido', FRC = 'N° commande', ENC = 'Order No.';
        LineAmtAfterInvDiscLbl: TextConst ENU = 'Payment Discount on VAT', ESM = 'Descuento P.P. sobre IVA', FRC = 'Escompte de paiement sur TVA', ENC = 'Payment Discount on Tax';
        LocalCurrencyLbl: TextConst ENU = 'Local Currency', ESM = 'Divisa local', FRC = 'Devise locale', ENC = 'Local Currency';
        PageLbl: TextConst ENU = 'Page', ESM = 'Pág.', FRC = 'Page', ENC = 'Page';
        PaymentTermsDescLbl: TextConst ENU = 'Payment Terms', ESM = 'Términos pago', FRC = 'Modalités de paiement', ENC = 'Payment Terms';
        PaymentMethodDescLbl: TextConst ENU = 'Payment Method', ESM = 'Forma pago', FRC = 'Mode de règlement', ENC = 'Payment Method';
        PostedShipmentDateLbl: TextConst ENU = 'Shipment Date', ESM = 'Fecha envío', FRC = 'Date de livraison', ENC = 'Shipment Date';
        SalesInvLineDiscLbl: TextConst ENU = 'Discount %', ESM = '% Descuento', FRC = '% escompte', ENC = 'Discount %';
        ShipmentLbl: TextConst ENU = 'Shipment', ESM = 'Envío', FRC = 'Livraison', ENC = 'Shipment';
        ShiptoAddrLbl: TextConst ENU = 'Ship-to Address', ESM = 'Dirección de envío', FRC = 'Adresse de livraison', ENC = 'Ship-to Address';
        ShptMethodDescLbl: TextConst ENU = 'Shipment Method', ESM = 'Método de envío', FRC = 'Méthode de livraison', ENC = 'Shipment Method';
        SubtotalLbl: TextConst ENU = 'Subtotal', ESM = 'Subtotal', FRC = 'Sous-total', ENC = 'Subtotal';
        TotalLbl: TextConst ENU = 'Total', ESM = 'Total', FRC = 'Total', ENC = 'Total';
        VATAmtSpecificationLbl: TextConst ENU = 'Tax Amount Specification', ESM = 'Especificación importe IVA', FRC = 'Spécification du montant de TVA', ENC = 'Tax Amount Specification';
        VATAmtLbl: TextConst ENU = 'Tax Amount', ESM = 'Importe IVA', FRC = 'Montant TVA', ENC = 'Tax Amount';
        VATAmountLCYLbl: TextConst ENU = 'Tax Amount ($)', ESM = 'Importe IVA ($)', FRC = 'Montant TVA $', ENC = 'Tax Amount ($)';
        VATBaseLbl: TextConst ENU = 'Tax Base', ESM = 'Base IVA', FRC = 'Base de TVA', ENC = 'Tax Base';
        VATBaseLCYLbl: TextConst ENU = 'Tax Base ($)', ESM = 'Base IVA ($)', FRC = 'Base TVA ($)', ENC = 'Tax Base ($)';
        VATClausesLbl: TextConst ENU = 'Tax Clause', ESM = 'Cláusula de IVA', FRC = 'Clause TVA', ENC = 'Tax Clause';
        VATIdentifierLbl: TextConst ENU = 'Tax Identifier', ESM = 'Identific. IVA', FRC = 'Identificateur de TVA', ENC = 'Tax Identifier';
        VATPercentageLbl: TextConst ENU = 'Tax %', ESM = '% IVA', FRC = '% TVA', ENC = 'Tax %';
        GLSetup: Record "General Ledger Setup";
        ShipmentMethod: Record "Shipment Method";
        PaymentTerms: Record "Payment Terms";
        PaymentMethod: Record "Payment Method";
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        CompanyInfo: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        Cust: Record Customer;
        RespCenter: Record "Responsibility Center";
        Language: Record Language;
        VATClause: Record "VAT Clause";
        AsmHeader: Record "Assembly Header";
        TempBlobWorkDescription: Record TempBlob;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        CustAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        SalesPersonText: Text[30];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        LineDiscountPctText: Text;
        FormattedVATPct: Text;
        FormattedUnitPrice: Text;
        FormattedQuantity: Text;
        FormattedLineAmount: Text;
        MoreLines: Boolean;
        CopyText: Text[30];
        ShowShippingAddr: Boolean;
        ArchiveDocument: Boolean;
        LogInteraction: Boolean;
        TotalSubTotal: Decimal;
        TotalAmount: Decimal;
        TotalAmountInclVAT: Decimal;
        TotalAmountVAT: Decimal;
        TotalInvDiscAmount: Decimal;
        TotalPaymentDiscOnVAT: Decimal;
        TransHeaderAmount: Decimal;
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        AsmInfoExistsForLine: Boolean;
        CompanyLogoPosition: Integer;
        FirstLineHasBeenOutput: Boolean;
        CalculatedExchRate: Decimal;
        ExchangeRateText: Text;
        ExchangeRateTxt: TextConst Comment = '%1 and %2 are both amounts.', ENU = 'Exchange rate: %1/%2', ESM = 'Tipo cambio: %1/%2', FRC = 'Taux de change : %1/%2', ENC = 'Exchange rate: %1/%2';
        VATBaseLCY: Decimal;
        VATAmountLCY: Decimal;
        TotalVATBaseLCY: Decimal;
        TotalVATAmountLCY: Decimal;
        PrevLineAmount: Decimal;
        NoFilterSetErr: TextConst ENU = 'You must specify one or more filters to avoid accidently printing all documents.', ESM = 'Debe especificar uno o más filtros para evitar que se impriman accidentalmente todos los documentos.', FRC = 'Vous devez spécifier un ou plusieurs filtres pour éviter d''imprimer accidentellement tous les documents.', ENC = 'You must specify one or more filters to avoid accidently printing all documents.';
        GreetingLbl: TextConst ENU = 'Hello', ESM = 'Hola', FRC = 'Bonjour', ENC = 'Hello';
        ClosingLbl: TextConst ENU = 'Sincerely', ESM = 'Un saludo,', FRC = 'Cordialement', ENC = 'Sincerely';
        PmtDiscTxt: TextConst Comment = '%1 Discount Due Date %2 = value of Payment Discount % ', ENU = 'If we receive the payment before %1, you are eligible for a 2% payment discount.', ESM = 'Si el pago se recibe antes del %1, tiene derecho a un descuento de pronto pago del 2 %.', FRC = 'Si nous recevons le paiement avant le %1, vous pouvez bénéficier d''un escompte de paiement de 2 %.', ENC = 'If we receive the payment before %1, you are eligible for a 2% payment discount.';
        BodyLbl: TextConst ENU = 'Thank you for your business. Your order confirmation is attached to this message.', ESM = 'Gracias por confiar en nosotros. Su confirmación de pedido está adjunta a este mensaje.', FRC = 'Merci de votre collaboration. Votre confirmation de commande est jointe à ce message.', ENC = 'Thank you for your business. Your order confirmation is attached to this message.';
        PmtDiscText: Text;
        ShowWorkDescription: Boolean;
        WorkDescriptionLine: Text;
        AmtSubjecttoSalesTaxLbl: TextConst ENU = 'Amount Subject to Sales Tax', ESM = 'Importe sujeto a impuestos de ventas', FRC = 'Montant assujetti à la taxe de vente', ENC = 'Amount Subject to Sales Tax';
        AmtExemptfromSalesTaxLbl: TextConst ENU = 'Amount Exempt from Sales Tax', ESM = 'Importe exento de impuestos de ventas', FRC = 'Montant exonéré de la taxe de vente', ENC = 'Amount Exempt from Sales Tax';
        PONumberLbl: TextConst ENU = 'P.O. Number', ESM = 'Número orden compra', FRC = 'N° de bon de commande', ENC = 'P.O. Number';
        TotalTaxLbl: TextConst ENU = 'Total Tax', ESM = 'Total impto.', FRC = 'Taxe totale', ENC = 'Total Tax';
        UnitLbl: TextConst ENU = 'Unit', ESM = 'Unidad', FRC = 'Unité', ENC = 'Unit';
        UnitPriceLbl: TextConst ENU = 'Unit Price', ESM = 'Precio unitario', FRC = 'Prix unitaire', ENC = 'Unit Price';
        LineAmountLbl: TextConst ENU = 'Line Amount', ESM = 'Importe línea', FRC = 'Montant ligne', ENC = 'Line Amount';
        SalespersonLbl2: TextConst ENU = 'Salesperson', ESM = 'Vendedor', FRC = 'Représentant', ENC = 'Salesperson';
        TotalWatts: Decimal; //Sbr-Jo
        ExtensionFunctions: Codeunit ExtensionFunctions;//Sbr-Jo
        SBRPlannedDeliveryDate: Text [50]; //Sbr-Jo M4307
        SBRRequestedDeliveryDate:Text[50]; //Sbr-Jo M4307
        SBRFormattedShipmentDate_Line:Text[50]; //Sbr-Jo M4307
        SBRFormattedPlannedDeliveryDate_Line:Text[50]; //Sbr-Jo M4307
        SBRFormattedRequestedDeliveryDate_Line:Text[50];//Sbr-Jo M4307

    local procedure InitLogInteraction();
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(3) <> '';
    end;

    local procedure DocumentCaption(): Text[250];
    begin
        exit(SalesConfirmationLbl);
    end;

    [Scope('Personalization')]
    procedure InitializeRequest(NewLogInteraction: Boolean; DisplayAsmInfo: Boolean);
    begin
        LogInteraction := NewLogInteraction;
        DisplayAssemblyInformation := DisplayAsmInfo;
    end;

    local procedure FormatDocumentFields(SalesHeader: Record "Sales Header");
    begin
        with SalesHeader do begin
            FormatDocument.SetTotalLabels("Currency Code", TotalText, TotalInclVATText, TotalExclVATText);
            FormatDocument.SetSalesPerson(SalespersonPurchaser, "Salesperson Code", SalesPersonText);
            FormatDocument.SetPaymentTerms(PaymentTerms, "Payment Terms Code", "Language Code");
            FormatDocument.SetPaymentMethod(PaymentMethod, "Payment Method Code");
            FormatDocument.SetShipmentMethod(ShipmentMethod, "Shipment Method Code", "Language Code");
        end;
    end;

    local procedure GetUOMText(UOMCode: Code[10]): Text[10];
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.GET(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    local procedure CreateReportTotalLines();
    var
        TempSalesTaxAmountLine: Record "Sales Tax Amount Line" temporary;
        TaxArea: Record "Tax Area";
    begin
        ReportTotalsLine.DELETEALL;
        if Header."Tax Area Code" <> '' then
            if TaxArea.GET(Header."Tax Area Code") then;
        if (Header."Tax Area Code" = '') or (TaxArea."Country/Region" = TaxArea."Country/Region"::US) then begin
            CreateUSReportTotalLines;
            exit;
        end;

        if (TotalInvDiscAmount <> 0) or (TotalAmountVAT <> 0) then
            ReportTotalsLine.Add(SubtotalLbl, TotalSubTotal, true, false, false);
        if TotalInvDiscAmount <> 0 then begin
            ReportTotalsLine.Add(InvDiscountAmtLbl, TotalInvDiscAmount, false, false, false);
            if TotalAmountVAT <> 0 then
                ReportTotalsLine.Add(TotalExclVATText, TotalAmount, true, false, false);
        end;
        if TotalAmountVAT <> 0 then begin
            GetTaxSummarizedLines(TempSalesTaxAmountLine);
            TempSalesTaxAmountLine.SETCURRENTKEY("Print Order");
            TempSalesTaxAmountLine.ASCENDING(true);
            if TempSalesTaxAmountLine.FINDSET then
                repeat
                    ReportTotalsLine.Add(TempSalesTaxAmountLine."Print Description", TempSalesTaxAmountLine."Tax Amount", false, true, false);
                until TempSalesTaxAmountLine.NEXT = 0;
        end;
    end;

    local procedure CreateUSReportTotalLines();
    begin
        ReportTotalsLine.DELETEALL;
        ReportTotalsLine.Add(SubtotalLbl, TotalSubTotal, true, false, false);
        ReportTotalsLine.Add(InvDiscountAmtLbl, TotalInvDiscAmount, false, false, false);
        ReportTotalsLine.Add(TotalTaxLbl, TotalAmountVAT, false, true, false);
    end;

    local procedure GetTaxSummarizedLines(var TempSalesTaxAmountLine: Record "Sales Tax Amount Line" temporary);
    var
        TaxArea: Record "Tax Area";
        SalesTaxCalculate: Codeunit "Sales Tax Calculate";
    begin
        if not TaxArea.GET(Header."Tax Area Code") then
            exit;

        SalesTaxCalculate.StartSalesTaxCalculation;
        Line.SETRANGE("Document Type", Header."Document Type");
        Line.SETRANGE("Document No.", Header."No.");
        Line.SETFILTER(Type, '>0');
        Line.SETFILTER(Quantity, '<>0');
        if Line.FIND('-') then
            repeat
                if not TaxArea."Use External Tax Engine" then
                    SalesTaxCalculate.AddSalesLine(Line);
            until Line.NEXT = 0;
        TempSalesTaxAmountLine.DELETEALL;
        if TaxArea."Use External Tax Engine" then
            SalesTaxCalculate.CallExternalTaxEngineForSales(Header, true)
        else
            SalesTaxCalculate.EndSalesTaxCalculation(Header."Posting Date");

        SalesTaxCalculate.GetSalesTaxAmountLineTable(TempSalesTaxAmountLine);
        SalesTaxCalculate.GetSummarizedSalesTaxTable(TempSalesTaxAmountLine);
    end;
}

