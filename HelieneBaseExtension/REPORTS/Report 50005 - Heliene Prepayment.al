report 59105 "Heliene Prepayment Ext"
{
    // version NAVW111.00.00.21836,NAVNA11.00.00.21836
    //SBR-Jo M3928
    DefaultLayout = RDLC;
    RDLCLayout = './Heliene Prepayment.rdlc';
    CaptionML = ENU = 'Sales Document - Test',
                ESM = 'Documento ventas - Prueba',
                FRC = 'Document de vente - Test',
                ENC = 'Sales Document - Test';

    dataset
    {
        dataitem("Sales Header"; "Sales Header")
        {
            DataItemTableView = WHERE ("Document Type" = FILTER (<> Quote));
            RequestFilterFields = "Document Type", "No.";
            RequestFilterHeadingML = ENU = 'Sales Document',
                                     ESM = 'Documento de venta',
                                     FRC = 'Document vente',
                                     ENC = 'Sales Document';
            column(USERID; USERID)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(FormattedTODAY; ExtensionFunctions.getFormattedDate(TODAY)) { }//Sbr-Jo M3928
            column(TIME; TIME)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(STRSUBSTNO_Text014_SalesHeaderFilter_; STRSUBSTNO(Text014, SalesHeaderFilter))
            {
            }
            column(COMPANYNAME; COMPANYPROPERTY.DISPLAYNAME)
            {
            }
            column(Summarize; Summarize)
            {
            }
            column(Sales_Header__Due_Date_; FORMAT("Due Date"))
            {
            }
            column(FormattedSales_Header_Due_Date_; ExtensionFunctions.getFormattedDate("Due Date")) { }//Sbr-Jo M3928
            column(Sales_Header__Shipment_Method_Code_; "Shipment Method Code")
            {
            }
            column(Salesperson_Code____________Salesperson_Name; "Salesperson Code" + ' - ' + Salesperson.Name)
            {
            }
            column(Sales_Header__Sell_to_Contact_; "Sell-to Contact")
            {
            }
            column(Sales_Header__Posting_Date_; FORMAT("Posting Date"))
            {
            }
            column(FormattedSales_Header_Posting_Date_; ExtensionFunctions.getFormattedDate("Posting Date")) { }//Sbr-Jo M3928
            column(Sales_Header__Payment_Terms_Code_; "Payment Terms Code")
            {
            }
            column(Sales_Header__Sell_to_Address_; "Sell-to Address")
            {
            }
            column(Sell_to_City____________Sell_to_County___________Sell_to_Post_Code_; "Sell-to City" + ', ' + "Sell-to County" + ' ' + "Sell-to Post Code")
            {
            }
            column(Sell_to_Customer_No______________Sell_to_Customer_Name_; "Sell-to Customer No." + ' - ' + "Sell-to Customer Name")
            {
            }
            column(Sales_Header__Posting_Description_; "Posting Description")
            {
            }
            column(Sales_Header__Document_Date_; FORMAT("Document Date"))
            {
            }
            column(FormattedSales_Header_Document_Date_; ExtensionFunctions.getFormattedDate("Document Date")) { }//Sbr-Jo M3928
            column(Sales_Header_Status; Status)
            {
            }
            column(Sales_Header_No_; "No.")
            {
            }
            column(Sales_Header__Currency_Code_; "Currency Code")
            {
            }
            column(InvoiceAmount; InvoiceAmount)
            {
            }
            column(SalesHeader__External_Document_No__; SalesHeader."External Document No.")
            {
            }
            column(Sales_Header_Document_Type; "Document Type")
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Sales_Document___TestCaption; Sales_Document___TestCaptionLbl)
            {
            }
            column(Document_No_Caption; Document_No_CaptionLbl)
            {
            }
            column(Invoice_Amount_Excl__TaxCaption; Invoice_Amount_Excl__TaxCaptionLbl)
            {
            }
            column(Customer_InformationCaption; Customer_InformationCaptionLbl)
            {
            }
            column(SellerCaption; SellerCaptionLbl)
            {
            }
            column(ContactCaption; ContactCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Due_DateCaption; Due_DateCaptionLbl)
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
            {
            }
            column(Doc__DateCaption; Doc__DateCaptionLbl)
            {
            }
            column(ShipmentCaption; ShipmentCaptionLbl)
            {
            }
            column(TermsCaption; TermsCaptionLbl)
            {
            }
            column(StatusCaption; StatusCaptionLbl)
            {
            }
            column(External_Doc__No_Caption; External_Doc__No_CaptionLbl)
            {
            }

            column("TotalWattage"; "TotalWattage") { }//Sbr-Jo M3821

            column(SalesHeader_Prepayment_Invoice_No; PrepaymentNo) { }//Sbr-Jo M3821
            column(SalesHeader_PrepaymentDue; PrepaymentDue) { }
            column(SalesHeader_PrepaymentTax; PrepaymentTax) { }
            column(SalesHeader_PrepaymentTotalDue; PrepaymentTotalDue) { }
            column(SalesHeader_Something; CurrReport.PageNo()) { }//End Sbr-Jo M3821
            dataitem(SalesPersonRec; "Salesperson/Purchaser")
            {
                DataItemLink = Code = FIELD ("Salesperson Code");
                column(SalespersonCode; Code) { }
                column(SalespersonName; Name) { }
                column(SalespersonCommission; "Commission %") { }
                column(SalespersonEmail; "E-Mail") { }
                column(SalespersonPhone; "Phone No.") { }
                column(SalespersonNextTaskDate; ExtensionFunctions.getFormattedDate(SalesPersonRec."Next Task Date")) { }
            }
            dataitem(PageCounter; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                column(FORMAT_TODAY_0_4__Control1029001; FORMAT(TODAY, 0, 4))
                {
                }
                column(TIME_Control1029002; TIME)
                {
                }
                column(CompanyInformation_Name_Control1029003; COMPANYPROPERTY.DISPLAYNAME)
                {
                }
                column(CurrReport_PAGENO_Control1029005; CurrReport.PAGENO)
                {
                }
                column(USERID_Control1029006; USERID)
                {
                }
                column(SalesTax; SalesTax)
                {
                }
                column(STRSUBSTNO_Text014_SalesHeaderFilter__Control7; STRSUBSTNO(Text014, SalesHeaderFilter))
                {
                }
                column(SalesHeaderFilter; SalesHeaderFilter)
                {
                }
                column(ShipInvText; ShipInvText)
                {
                }
                column(ReceiveInvText; ReceiveInvText)
                {
                }
                column(Sales_Header___Sell_to_Customer_No__; "Sales Header"."Sell-to Customer No.")
                {
                }
                column(ShipToAddr_8_; ShipToAddr[8])
                {
                }
                column(ShipToAddr_7_; ShipToAddr[7])
                {
                }
                column(ShipToAddr_6_; ShipToAddr[6])
                {
                }
                column(ShipToAddr_5_; ShipToAddr[5])
                {
                }
                column(ShipToAddr_4_; ShipToAddr[4])
                {
                }
                column(ShipToAddr_3_; ShipToAddr[3])
                {
                }
                column(ShipToAddr_2_; ShipToAddr[2])
                {
                }
                column(ShipToAddr_1_; ShipToAddr[1])
                {
                }
                column(SellToAddr_8_; SellToAddr[8])
                {
                }
                column(SellToAddr_7_; SellToAddr[7])
                {
                }
                column(SellToAddr_6_; SellToAddr[6])
                {
                }
                column(SellToAddr_5_; SellToAddr[5])
                {
                }
                column(SellToAddr_4_; SellToAddr[4])
                {
                }
                column(SellToAddr_3_; SellToAddr[3])
                {
                }
                column(SellToAddr_2_; SellToAddr[2])
                {
                }
                column(SellToAddr_1_; SellToAddr[1])
                {
                }
                column(Sales_Header___Ship_to_Code_; "Sales Header"."Ship-to Code")
                {
                }
                column(FORMAT__Sales_Header___Document_Type____________Sales_Header___No__; FORMAT("Sales Header"."Document Type") + ' ' + "Sales Header"."No.")
                {
                }
                column(ShipReceiveOnNextPostReq; ShipReceiveOnNextPostReq)
                {
                }
                column(ShowCostAssignment; ShowCostAssignment)
                {
                }
                column(InvOnNextPostReq; InvOnNextPostReq)
                {
                }
                column(Sales_Header___VAT_Base_Discount___; "Sales Header"."VAT Base Discount %")
                {
                }
                column(SalesDocumentType; FORMAT("Sales Header"."Document Type", 0, 2))
                {
                }
                column(BillToAddr_8_; BillToAddr[8])
                {
                }
                column(BillToAddr_7_; BillToAddr[7])
                {
                }
                column(BillToAddr_6_; BillToAddr[6])
                {
                }
                column(BillToAddr_5_; BillToAddr[5])
                {
                }
                column(BillToAddr_4_; BillToAddr[4])
                {
                }
                column(BillToAddr_3_; BillToAddr[3])
                {
                }
                column(BillToAddr_2_; BillToAddr[2])
                {
                }
                column(BillToAddr_1_; BillToAddr[1])
                {
                }
                column(Sales_Header___Bill_to_Customer_No__; "Sales Header"."Bill-to Customer No.")
                {
                }
                column(Sales_Header___Salesperson_Code_; "Sales Header"."Salesperson Code")
                {
                }
                column(Sales_Header___Your_Reference_; "Sales Header"."Your Reference")
                {
                }
                column(Sales_Header___Customer_Posting_Group_; "Sales Header"."Customer Posting Group")
                {
                }
                column(Sales_Header___Posting_Date_; FORMAT("Sales Header"."Posting Date"))
                {
                }
                column(Sales_Header___Document_Date_; FORMAT("Sales Header"."Document Date"))
                {
                }
                column(Sales_Header___Prices_Including_VAT_; "Sales Header"."Prices Including VAT")
                {
                }
                column(SalesHdrPricesIncludingVATFmt; FORMAT("Sales Header"."Prices Including VAT"))
                {
                }
                column(Sales_Header___Payment_Terms_Code_; "Sales Header"."Payment Terms Code")
                {
                }
                column(Sales_Header___Payment_Discount___; "Sales Header"."Payment Discount %")
                {
                }
                column(Sales_Header___Due_Date_; FORMAT("Sales Header"."Due Date"))
                {
                }
                column(Sales_Header___Customer_Disc__Group_; "Sales Header"."Customer Disc. Group")
                {
                }
                column(Sales_Header___Pmt__Discount_Date_; FORMAT("Sales Header"."Pmt. Discount Date"))
                {
                }
                column(Sales_Header___Invoice_Disc__Code_; "Sales Header"."Invoice Disc. Code")
                {
                }
                column(Sales_Header___Shipment_Method_Code_; "Sales Header"."Shipment Method Code")
                {
                }
                column(Sales_Header___Payment_Method_Code_; "Sales Header"."Payment Method Code")
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control104; "Sales Header"."Customer Posting Group")
                {
                }
                column(Sales_Header___Posting_Date__Control105; FORMAT("Sales Header"."Posting Date"))
                {
                }
                column(Sales_Header___Document_Date__Control106; FORMAT("Sales Header"."Document Date"))
                {
                }
                column(Sales_Header___Order_Date_; FORMAT("Sales Header"."Order Date"))
                {
                }
                column(FormattedSales_Header_Order_Date; ExtensionFunctions.getFormattedDate("Sales Header"."Order Date")) { }//Sbr-Jo M3928
                column(Sales_Header___Shipment_Date_; FORMAT("Sales Header"."Shipment Date"))
                {
                }
                column(FormattedSales_Header_Shipment_Date; ExtensionFunctions.getFormattedDate("Sales Header"."Shipment Date")) { }//Sbr-Jo M3928
                column(Sales_Header___Prices_Including_VAT__Control194; "Sales Header"."Prices Including VAT")
                {
                }
                column(Sales_Header___Payment_Terms_Code__Control18; "Sales Header"."Payment Terms Code")
                {
                }
                column(Sales_Header___Due_Date__Control19; FORMAT("Sales Header"."Due Date"))
                {
                }
                column(FormattedSales_Header_Due_Date; ExtensionFunctions.getFormattedDate("Sales Header"."Due Date")) { }//Sbr-Jo M3928
                column(Sales_Header___Pmt__Discount_Date__Control22; FORMAT("Sales Header"."Pmt. Discount Date"))
                {
                }
                column(Sales_Header___Payment_Discount____Control23; "Sales Header"."Payment Discount %")
                {
                }
                column(Sales_Header___Payment_Method_Code__Control26; "Sales Header"."Payment Method Code")
                {
                }
                column(Sales_Header___Shipment_Method_Code__Control37; "Sales Header"."Shipment Method Code")
                {
                }
                column(Sales_Header___Customer_Disc__Group__Control100; "Sales Header"."Customer Disc. Group")
                {
                }
                column(Sales_Header___Invoice_Disc__Code__Control102; "Sales Header"."Invoice Disc. Code")
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control130; "Sales Header"."Customer Posting Group")
                {
                }
                column(Sales_Header___Posting_Date__Control131; FORMAT("Sales Header"."Posting Date"))
                {
                }
                column(Sales_Header___Document_Date__Control132; FORMAT("Sales Header"."Document Date"))
                {
                }
                column(Sales_Header___Prices_Including_VAT__Control196; "Sales Header"."Prices Including VAT")
                {
                }
                column(Sales_Header___Applies_to_Doc__Type_; "Sales Header"."Applies-to Doc. Type")
                {
                }
                column(Sales_Header___Applies_to_Doc__No__; "Sales Header"."Applies-to Doc. No.")
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control136; "Sales Header"."Customer Posting Group")
                {
                }
                column(Sales_Header___Posting_Date__Control137; FORMAT("Sales Header"."Posting Date"))
                {
                }
                column(FormattedSales_Header_Posting_Date; ExtensionFunctions.getFormattedDate("Sales Header"."Posting Date")) { }//Sbr-Jo M3928
                column(Sales_Header___Document_Date__Control138; FORMAT("Sales Header"."Document Date"))
                {
                }
                column(FormattedSales_Header_Document_Date; ExtensionFunctions.getFormattedDate("Sales Header"."Document Date")) { }//Sbr-Jo M3928
                column(Sales_Header___Prices_Including_VAT__Control198; "Sales Header"."Prices Including VAT")
                {
                }
                column(SalesHeader_TotalWattage; SalesHeader.TotalWattage) { } //Sbr-Jo M3821

                column(PageCounter_Number; Number)
                {
                }
                column(Sales_Document___TestCaption_Control1; Sales_Document___TestCaption_Control1Lbl)
                {
                }
                column(CurrReport_PAGENO_Control1029005Caption; CurrReport_PAGENO_Control1029005CaptionLbl)
                {
                }
                column(Sales_Header___Sell_to_Customer_No__Caption; "Sales Header".FIELDCAPTION("Sell-to Customer No."))
                {
                }
                column(Ship_toCaption; Ship_toCaptionLbl)
                {
                }
                column(Sell_toCaption; Sell_toCaptionLbl)
                {
                }
                column(Sales_Header___Ship_to_Code_Caption; "Sales Header".FIELDCAPTION("Ship-to Code"))
                {
                }
                column(Bill_toCaption; Bill_toCaptionLbl)
                {
                }
                column(Sales_Header___Bill_to_Customer_No__Caption; "Sales Header".FIELDCAPTION("Bill-to Customer No."))
                {
                }
                column(Sales_Header___Salesperson_Code_Caption; "Sales Header".FIELDCAPTION("Salesperson Code"))
                {
                }
                column(Sales_Header___Your_Reference_Caption; "Sales Header".FIELDCAPTION("Your Reference"))
                {
                }
                column(Sales_Header___Customer_Posting_Group_Caption; "Sales Header".FIELDCAPTION("Customer Posting Group"))
                {
                }
                column(Sales_Header___Posting_Date_Caption; Sales_Header___Posting_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Document_Date_Caption; Sales_Header___Document_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Prices_Including_VAT_Caption; "Sales Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                column(Sales_Header___Payment_Terms_Code_Caption; "Sales Header".FIELDCAPTION("Payment Terms Code"))
                {
                }
                column(Sales_Header___Payment_Discount___Caption; "Sales Header".FIELDCAPTION("Payment Discount %"))
                {
                }
                column(Sales_Header___Due_Date_Caption; Sales_Header___Due_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Customer_Disc__Group_Caption; "Sales Header".FIELDCAPTION("Customer Disc. Group"))
                {
                }
                column(Sales_Header___Pmt__Discount_Date_Caption; Sales_Header___Pmt__Discount_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Invoice_Disc__Code_Caption; "Sales Header".FIELDCAPTION("Invoice Disc. Code"))
                {
                }
                column(Sales_Header___Shipment_Method_Code_Caption; "Sales Header".FIELDCAPTION("Shipment Method Code"))
                {
                }
                column(Sales_Header___Payment_Method_Code_Caption; "Sales Header".FIELDCAPTION("Payment Method Code"))
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control104Caption; "Sales Header".FIELDCAPTION("Customer Posting Group"))
                {
                }
                column(Sales_Header___Posting_Date__Control105Caption; Sales_Header___Posting_Date__Control105CaptionLbl)
                {
                }
                column(Sales_Header___Document_Date__Control106Caption; Sales_Header___Document_Date__Control106CaptionLbl)
                {
                }
                column(Sales_Header___Order_Date_Caption; Sales_Header___Order_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Shipment_Date_Caption; Sales_Header___Shipment_Date_CaptionLbl)
                {
                }
                column(Sales_Header___Prices_Including_VAT__Control194Caption; "Sales Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                column(Sales_Header___Payment_Terms_Code__Control18Caption; "Sales Header".FIELDCAPTION("Payment Terms Code"))
                {
                }
                column(Sales_Header___Payment_Discount____Control23Caption; "Sales Header".FIELDCAPTION("Payment Discount %"))
                {
                }
                column(Sales_Header___Due_Date__Control19Caption; Sales_Header___Due_Date__Control19CaptionLbl)
                {
                }
                column(Sales_Header___Pmt__Discount_Date__Control22Caption; Sales_Header___Pmt__Discount_Date__Control22CaptionLbl)
                {
                }
                column(Sales_Header___Shipment_Method_Code__Control37Caption; "Sales Header".FIELDCAPTION("Shipment Method Code"))
                {
                }
                column(Sales_Header___Payment_Method_Code__Control26Caption; "Sales Header".FIELDCAPTION("Payment Method Code"))
                {
                }
                column(Sales_Header___Customer_Disc__Group__Control100Caption; "Sales Header".FIELDCAPTION("Customer Disc. Group"))
                {
                }
                column(Sales_Header___Invoice_Disc__Code__Control102Caption; "Sales Header".FIELDCAPTION("Invoice Disc. Code"))
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control130Caption; "Sales Header".FIELDCAPTION("Customer Posting Group"))
                {
                }
                column(Sales_Header___Posting_Date__Control131Caption; Sales_Header___Posting_Date__Control131CaptionLbl)
                {
                }
                column(Sales_Header___Document_Date__Control132Caption; Sales_Header___Document_Date__Control132CaptionLbl)
                {
                }
                column(Sales_Header___Prices_Including_VAT__Control196Caption; "Sales Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                column(Sales_Header___Applies_to_Doc__Type_Caption; "Sales Header".FIELDCAPTION("Applies-to Doc. Type"))
                {
                }
                column(Sales_Header___Applies_to_Doc__No__Caption; "Sales Header".FIELDCAPTION("Applies-to Doc. No."))
                {
                }
                column(Sales_Header___Customer_Posting_Group__Control136Caption; "Sales Header".FIELDCAPTION("Customer Posting Group"))
                {
                }
                column(Sales_Header___Posting_Date__Control137Caption; Sales_Header___Posting_Date__Control137CaptionLbl)
                {
                }
                column(Sales_Header___Document_Date__Control138Caption; Sales_Header___Document_Date__Control138CaptionLbl)
                {
                }
                column(Sales_Header___Prices_Including_VAT__Control198Caption; "Sales Header".FIELDCAPTION("Prices Including VAT"))
                {
                }
                dataitem(DimensionLoop1; "Integer")
                {
                    DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                    column(DimText; DimText)
                    {
                    }
                    column(DimensionLoop1_Number; Number)
                    {
                    }
                    column(DimText_Control162; DimText)
                    {
                    }
                    column(Header_DimensionsCaption; Header_DimensionsCaptionLbl)
                    {
                    }

                    trigger OnAfterGetRecord();
                    begin
                        if Number = 1 then begin
                            if not DimSetEntry1.FINDSET then
                                CurrReport.BREAK;
                        end else
                            if not Continue then
                                CurrReport.BREAK;

                        DimText := '';
                        Continue := false;
                        repeat
                            OldDimText := DimText;
                            if DimText = '' then
                                DimText := STRSUBSTNO('%1 - %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                            else
                                DimText :=
                                  STRSUBSTNO(
                                    '%1; %2 - %3', DimText, DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                            if STRLEN(DimText) > MAXSTRLEN(OldDimText) then begin
                                DimText := OldDimText;
                                Continue := true;
                                exit;
                            end;
                        until DimSetEntry1.NEXT = 0;
                    end;

                    trigger OnPreDataItem();
                    begin
                        if not ShowDim then
                            CurrReport.BREAK;
                    end;
                }
                dataitem(HeaderErrorCounter; "Integer")
                {
                    DataItemTableView = SORTING (Number);
                    column(ErrorText_Number_; ErrorText[Number])
                    {
                    }
                    column(HeaderErrorCounter_Number; Number)
                    {
                    }
                    column(ErrorText_Number_Caption; ErrorText_Number_CaptionLbl)
                    {
                    }

                    trigger OnPostDataItem();
                    begin
                        ErrorCounter := 0;
                    end;

                    trigger OnPreDataItem();
                    begin
                        SETRANGE(Number, 1, ErrorCounter);
                    end;
                }
                dataitem(CopyLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number);
                    MaxIteration = 1;
                    dataitem("Sales Line"; "Sales Line")
                    {
                        DataItemLink = "Document Type" = FIELD ("Document Type"), "Document No." = FIELD ("No.");
                        DataItemLinkReference = "Sales Header";
                        DataItemTableView = SORTING ("Document Type", "Document No.", "Line No.");
                        column(Sales_Line_Document_Type; "Document Type")
                        {
                        }
                        column(Sales_Line_Document_No_; "Document No.")
                        {
                        }
                        column(Sales_Line_Line_No_; "Line No.")
                        {
                        }

                        trigger OnPreDataItem();
                        begin
                            if FIND('+') then
                                OrigMaxLineNo := "Line No.";
                            CurrReport.BREAK;
                        end;
                    }
                    dataitem(RoundLoop; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(QtyToHandleCaption; QtyToHandleCaption)
                        {
                        }
                        column(Sales_Line__Type; "Sales Line".Type)
                        {
                        }
                        column(Sales_Line___No__; "Sales Line"."No.")
                        {
                        }
                        column(Sales_Line__Description; "Sales Line".Description)
                        {
                        }
                        column(Sales_Line__Quantity; "Sales Line".Quantity)
                        {
                        }
                        column(QtyToHandle; QtyToHandle)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(Sales_Line___Qty__to_Invoice_; "Sales Line"."Qty. to Invoice")
                        {
                        }
                        column(Sales_Line___Unit_Price_; "Sales Line"."Unit Price")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 2;
                        }
                        column(Sales_Line___Line_Discount___; "Sales Line"."Line Discount %")
                        {
                        }
                        column(Sales_Line___Line_Amount_; "Sales Line"."Line Amount")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Sales_Line___Allow_Invoice_Disc__; "Sales Line"."Allow Invoice Disc.")
                        {
                        }
                        column(Sales_Line___VAT_Identifier_; "Sales Line"."VAT Identifier")
                        {
                        }
                        column(SalesLineAllowInvoiceDiscFmt; FORMAT("Sales Line"."Allow Invoice Disc."))
                        {
                        }
                        column(RoundLoop_RoundLoop_Number; Number)
                        {
                        }
                        column(Sales_Line___Inv__Discount_Amount_; "Sales Line"."Inv. Discount Amount")
                        {
                        }
                        column(SalesLine_PricePerWatt; SalesLine.PricePerWatt) { }//Sbr-Jo M3821
                        column(SalesLine_CostPerWatt; SalesLine.CostPerWatt) { }
                        column(SalesLine_Watts; SalesLine.Watts) { }
                        column(SalesLine_TotalWatts; SalesLine."SBR Total Watts") { } //End Sbr-Jo M3821
                        column(TempVATAmount; TempVATAmount)
                        {
                        }
                        column(TempSalesLine__Inv__Discount_Amount_; -TempSalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TempSalesLine__Line_Amount_; TempSalesLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SumLineAmount; SumLineAmount)
                        {
                        }
                        column(SumInvDiscountAmount; SumInvDiscountAmount)
                        {
                        }
                        column(TotalText; TotalText)
                        {
                        }
                        column(TempSalesLine__Line_Amount_____Sales_Line___Inv__Discount_Amount_; TempSalesLine."Line Amount" - TempSalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText; TotalExclVATText)
                        {
                        }
                        column(TempSalesLine__Line_Amount____TempSalesLine__Inv__Discount_Amount_; TempSalesLine."Line Amount" - TempSalesLine."Inv. Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmount; VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TempSalesLine__Line_Amount____TempSalesLine__Inv__Discount_Amount____VATAmount; TempSalesLine."Line Amount" - TempSalesLine."Inv. Discount Amount" + VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText; TotalInclVATText)
                        {
                        }
                        column(VATDiscountAmount; -VATDiscountAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalInclVATText_Control191; TotalInclVATText)
                        {
                        }
                        column(VATAmountLine_VATAmountText; VATAmountLine.VATAmountText)
                        {
                        }
                        column(VATBaseAmount___VATAmount; VATBaseAmount + VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmount_Control188; VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(TotalExclVATText_Control186; TotalExclVATText)
                        {
                        }
                        column(VATBaseAmount; VATBaseAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Sales_Line___No__Caption; "Sales Line".FIELDCAPTION("No."))
                        {
                        }
                        column(Sales_Line__DescriptionCaption; "Sales Line".FIELDCAPTION(Description))
                        {
                        }
                        column(Sales_Line___Qty__to_Invoice_Caption; "Sales Line".FIELDCAPTION("Qty. to Invoice"))
                        {
                        }
                        column(Unit_PriceCaption; Unit_PriceCaptionLbl)
                        {
                        }
                        column(Sales_Line___Line_Discount___Caption; Sales_Line___Line_Discount___CaptionLbl)
                        {
                        }
                        column(Sales_Line___Allow_Invoice_Disc__Caption; "Sales Line".FIELDCAPTION("Allow Invoice Disc."))
                        {
                        }
                        column(Sales_Line___VAT_Identifier_Caption; "Sales Line".FIELDCAPTION("VAT Identifier"))
                        {
                        }
                        column(AmountCaption; AmountCaptionLbl)
                        {
                        }
                        column(Sales_Line__TypeCaption; "Sales Line".FIELDCAPTION(Type))
                        {
                        }
                        column(Sales_Line__QuantityCaption; "Sales Line".FIELDCAPTION(Quantity))
                        {
                        }
                        column(TempSalesLine__Inv__Discount_Amount_Caption; TempSalesLine__Inv__Discount_Amount_CaptionLbl)
                        {
                        }
                        column(SubtotalCaption; SubtotalCaptionLbl)
                        {
                        }
                        column(VATDiscountAmountCaption; VATDiscountAmountCaptionLbl)
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING (Number) WHERE (Number = FILTER (1 ..));
                            column(DimText_Control159; DimText)
                            {
                            }
                            column(DimensionLoop2_Number; Number)
                            {
                            }
                            column(DimText_Control161; DimText)
                            {
                            }
                            column(Line_DimensionsCaption; Line_DimensionsCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord();
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.FINDSET then
                                        CurrReport.BREAK;
                                end else
                                    if not Continue then
                                        CurrReport.BREAK;

                                DimText := '';
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := STRSUBSTNO('%1 - %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          STRSUBSTNO(
                                            '%1; %2 - %3', DimText, DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if STRLEN(DimText) > MAXSTRLEN(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.NEXT = 0;
                            end;

                            trigger OnPostDataItem();
                            begin
                                SumLineAmount := SumLineAmount + TempSalesLine."Line Amount";
                                SumInvDiscountAmount := SumInvDiscountAmount + TempSalesLine."Inv. Discount Amount";
                            end;

                            trigger OnPreDataItem();
                            begin
                                if not ShowDim then
                                    CurrReport.BREAK;
                            end;
                        }
                        dataitem(LineErrorCounter; "Integer")
                        {
                            DataItemTableView = SORTING (Number);
                            column(ErrorText_Number__Control97; ErrorText[Number])
                            {
                            }
                            column(LineErrorCounter_Number; Number)
                            {
                            }
                            column(ErrorText_Number__Control97Caption; ErrorText_Number__Control97CaptionLbl)
                            {
                            }

                            trigger OnPostDataItem();
                            begin
                                ErrorCounter := 0;
                            end;

                            trigger OnPreDataItem();
                            begin
                                SETRANGE(Number, 1, ErrorCounter);
                            end;
                        }

                        trigger OnAfterGetRecord();
                        var
                            TableID: array[10] of Integer;
                            No: array[10] of Code[20];
                            Fraction: Decimal;
                        begin
                            if Number = 1 then
                                TempSalesLine.FIND('-')
                            else
                                TempSalesLine.NEXT;
                            "Sales Line" := TempSalesLine;

                            with "Sales Line" do begin
                                if SalesTax and not HeaderTaxArea."Use External Tax Engine" then
                                    SalesTaxCalculate.AddSalesLine("Sales Line");

                                if not "Sales Header"."Prices Including VAT" and
                                   ("VAT Calculation Type" = "VAT Calculation Type"::"Full VAT")
                                then
                                    TempSalesLine."Line Amount" := 0;

                                DimSetEntry2.SETRANGE("Dimension Set ID", "Dimension Set ID");
                                DimMgt.GetDimensionSet(TempDimSetEntry, "Dimension Set ID");

                                if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]
                                then begin
                                    if "Document Type" = "Document Type"::"Credit Memo" then begin
                                        if ("Return Qty. to Receive" <> Quantity) and ("Return Receipt No." = '') then
                                            AddError(STRSUBSTNO(Text015, FIELDCAPTION("Return Qty. to Receive"), Quantity));
                                        if "Qty. to Invoice" <> Quantity then
                                            AddError(STRSUBSTNO(Text015, FIELDCAPTION("Qty. to Invoice"), Quantity));
                                    end;
                                    if "Qty. to Ship" <> 0 then
                                        AddError(STRSUBSTNO(Text043, FIELDCAPTION("Qty. to Ship")));
                                end else begin
                                    if "Document Type" = "Document Type"::Invoice then begin
                                        if ("Qty. to Ship" <> Quantity) and ("Shipment No." = '') then
                                            AddError(STRSUBSTNO(Text015, FIELDCAPTION("Qty. to Ship"), Quantity));
                                        if "Qty. to Invoice" <> Quantity then
                                            AddError(STRSUBSTNO(Text015, FIELDCAPTION("Qty. to Invoice"), Quantity));
                                    end;
                                    if "Return Qty. to Receive" <> 0 then
                                        AddError(STRSUBSTNO(Text043, FIELDCAPTION("Return Qty. to Receive")));
                                end;

                                if not "Sales Header".Ship then
                                    "Qty. to Ship" := 0;
                                if not "Sales Header".Receive then
                                    "Return Qty. to Receive" := 0;

                                if ("Document Type" = "Document Type"::Invoice) and ("Shipment No." <> '') then begin
                                    "Quantity Shipped" := Quantity;
                                    "Qty. to Ship" := 0;
                                end;

                                if ("Document Type" = "Document Type"::"Credit Memo") and ("Return Receipt No." <> '') then begin
                                    "Return Qty. Received" := Quantity;
                                    "Return Qty. to Receive" := 0;
                                end;

                                if "Sales Header".Invoice then begin
                                    if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then
                                        MaxQtyToBeInvoiced := "Return Qty. to Receive" + "Return Qty. Received" - "Quantity Invoiced"
                                    else
                                        MaxQtyToBeInvoiced := "Qty. to Ship" + "Quantity Shipped" - "Quantity Invoiced";
                                    if ABS("Qty. to Invoice") > ABS(MaxQtyToBeInvoiced) then
                                        "Qty. to Invoice" := MaxQtyToBeInvoiced;
                                end else
                                    "Qty. to Invoice" := 0;

                                if "Gen. Prod. Posting Group" <> '' then begin
                                    if ("Sales Header"."Document Type" in
                                        ["Sales Header"."Document Type"::"Return Order",
                                         "Sales Header"."Document Type"::"Credit Memo"]) and
                                       ("Sales Header"."Applies-to Doc. Type" = "Sales Header"."Applies-to Doc. Type"::Invoice) and
                                       ("Sales Header"."Applies-to Doc. No." <> '')
                                    then begin
                                        CustLedgEntry.SETCURRENTKEY("Document No.");
                                        CustLedgEntry.SETRANGE("Customer No.", "Sales Header"."Bill-to Customer No.");
                                        CustLedgEntry.SETRANGE("Document Type", CustLedgEntry."Document Type"::Invoice);
                                        CustLedgEntry.SETRANGE("Document No.", "Sales Header"."Applies-to Doc. No.");
                                        if (not CustLedgEntry.FINDLAST) and (not ApplNoError) then begin
                                            ApplNoError := true;
                                            AddError(
                                              STRSUBSTNO(
                                                Text016,
                                                "Sales Header".FIELDCAPTION("Applies-to Doc. No."), "Sales Header"."Applies-to Doc. No."));
                                        end;
                                    end;

                                    if not VATPostingSetup.GET("VAT Bus. Posting Group", "VAT Prod. Posting Group") then
                                        AddError(
                                          STRSUBSTNO(
                                            Text017,
                                            VATPostingSetup.TABLECAPTION, "VAT Bus. Posting Group", "VAT Prod. Posting Group"));
                                    if VATPostingSetup."VAT Calculation Type" = VATPostingSetup."VAT Calculation Type"::"Reverse Charge VAT" then
                                        if ("Sales Header"."VAT Registration No." = '') and (not VATNoError) then begin
                                            VATNoError := true;
                                            AddError(
                                              STRSUBSTNO(
                                                Text035, "Sales Header".FIELDCAPTION("VAT Registration No.")));
                                        end;
                                end;

                                if Quantity <> 0 then begin
                                    if "No." = '' then
                                        AddError(STRSUBSTNO(Text019, Type, FIELDCAPTION("No.")));
                                    if Type = 0 then
                                        AddError(STRSUBSTNO(Text006, FIELDCAPTION(Type)));
                                end else
                                    if Amount <> 0 then
                                        AddError(
                                          STRSUBSTNO(Text020, FIELDCAPTION(Amount), FIELDCAPTION(Quantity)));

                                if "Drop Shipment" then begin
                                    if Type <> Type::Item then
                                        AddError(Text021);
                                    if ("Qty. to Ship" <> 0) and ("Purch. Order Line No." = 0) then begin
                                        AddError(STRSUBSTNO(Text022, "Line No."));
                                        AddError(Text023);
                                    end;
                                end;

                                SalesLine := "Sales Line";
                                if not ("Document Type" in
                                        ["Document Type"::"Return Order", "Document Type"::"Credit Memo"])
                                then begin
                                    SalesLine."Qty. to Ship" := -SalesLine."Qty. to Ship";
                                    SalesLine."Qty. to Invoice" := -SalesLine."Qty. to Invoice";
                                end;

                                RemQtyToBeInvoiced := SalesLine."Qty. to Invoice";

                                case "Document Type" of
                                    "Document Type"::"Return Order", "Document Type"::"Credit Memo":
                                        CheckRcptLines("Sales Line");
                                    "Document Type"::Order, "Document Type"::Invoice:
                                        CheckShptLines("Sales Line");
                                end;

                                if (Type >= Type::"G/L Account") and ("Qty. to Invoice" <> 0) then begin
                                    if GLSetup."VAT in Use" then
                                        if not GenPostingSetup.GET("Gen. Bus. Posting Group", "Gen. Prod. Posting Group") then
                                            AddError(
                                              STRSUBSTNO(
                                                Text017,
                                                GenPostingSetup.TABLECAPTION, "Gen. Bus. Posting Group", "Gen. Prod. Posting Group"));
                                    if not VATPostingSetup.GET("VAT Bus. Posting Group", "VAT Prod. Posting Group") then
                                        AddError(
                                          STRSUBSTNO(
                                            Text017,
                                            VATPostingSetup.TABLECAPTION, "VAT Bus. Posting Group", "VAT Prod. Posting Group"));
                                end;

                                if "Prepayment %" > 0 then
                                    if not "Prepayment Line" and (Quantity > 0) then begin
                                        Fraction := ("Qty. to Invoice" + "Quantity Invoiced") / Quantity;
                                        if Fraction > 1 then
                                            Fraction := 1;

                                        case true of
                                            (Fraction * "Line Amount" < "Prepmt Amt to Deduct") and
                                          ("Prepmt Amt to Deduct" <> 0):
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text053,
                                                    FIELDCAPTION("Prepmt Amt to Deduct"),
                                                    ROUND(Fraction * "Line Amount", GLSetup."Amount Rounding Precision")));
                                            (1 - Fraction) * "Line Amount" <
                                          "Prepmt. Amt. Inv." - "Prepmt Amt Deducted" - "Prepmt Amt to Deduct":
                                                AddError(
                                                  STRSUBSTNO(
                                                    Text054,
                                                    FIELDCAPTION("Prepmt Amt to Deduct"),
                                                    ROUND(
                                                      "Prepmt. Amt. Inv." - "Prepmt Amt Deducted" - (1 - Fraction) * "Line Amount",
                                                      GLSetup."Amount Rounding Precision")));
                                        end;
                                    end;
                                if not "Prepayment Line" and ("Prepmt. Line Amount" > 0) then
                                    if "Prepmt. Line Amount" > "Prepmt. Amt. Inv." then
                                        AddError(STRSUBSTNO(Text046, FIELDCAPTION("Prepmt. Line Amount")));

                                CheckType("Sales Line");

                                if "Line No." > OrigMaxLineNo then begin
                                    AddDimToTempLine("Sales Line", TempDimSetEntry);
                                    if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                                        AddError(DimMgt.GetDimCombErr);
                                    if not DimMgt.CheckDimValuePosting(TableID, No, "Dimension Set ID") then
                                        AddError(DimMgt.GetDimValuePostingErr);
                                end else begin
                                    if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                                        AddError(DimMgt.GetDimCombErr);

                                    TableID[1] := DimMgt.TypeToTableID3(Type);
                                    No[1] := "No.";
                                    TableID[2] := DATABASE::Job;
                                    No[2] := "Job No.";
                                    if not DimMgt.CheckDimValuePosting(TableID, No, "Dimension Set ID") then
                                        AddError(DimMgt.GetDimValuePostingErr);
                                end;
                            end;
                            totAmount := totAmount + "Sales Line"."Line Amount";

                            if Number = TempSalesLine.COUNT then begin
                                TempVATAmount := VATAmount;
                                if SalesTax then begin
                                    if not SalesTaxCalculationOverridden then begin
                                        if HeaderTaxArea."Use External Tax Engine" then
                                            SalesTaxCalculate.CallExternalTaxEngineForSales("Sales Header", true)
                                        else
                                            SalesTaxCalculate.EndSalesTaxCalculation("Sales Header"."Posting Date");
                                        SalesTaxCalculate.GetSalesTaxAmountLineTable(SalesTaxAmountLine);
                                    end;
                                    VATAmount := SalesTaxAmountLine.GetTotalTaxAmountFCY;
                                    VATBaseAmount := SalesTaxAmountLine.GetTotalTaxBase;
                                end;

                                if SalesTax then
                                    TaxText := SalesTaxAmountLine.TaxAmountText
                                else
                                    TaxText := VATAmountLine.VATAmountText;
                            end;
                        end;

                        trigger OnPreDataItem();
                        begin
                            VATNoError := false;
                            ApplNoError := false;
                            CurrReport.CREATETOTALS(TempSalesLine."Line Amount", TempSalesLine."Inv. Discount Amount");

                            MoreLines := TempSalesLine.FIND('+');
                            while MoreLines and (TempSalesLine.Description = '') and (TempSalesLine."Description 2" = '') and
                                  (TempSalesLine."No." = '') and (TempSalesLine.Quantity = 0) and
                                  (TempSalesLine.Amount = 0)
                            do
                                MoreLines := TempSalesLine.NEXT(-1) <> 0;
                            if not MoreLines then
                                CurrReport.BREAK;
                            TempSalesLine.SETRANGE("Line No.", 0, TempSalesLine."Line No.");
                            SETRANGE(Number, 1, TempSalesLine.COUNT);

                            SumLineAmount := 0;
                            SumInvDiscountAmount := 0;
                        end;
                    }
                    dataitem(VATCounter; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(VATAmountLine__VAT_Amount_; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base_; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount_; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount_; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount_; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control150; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control151; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT___; VATAmountLine."VAT %")
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(VATAmountLine__VAT_Identifier_; VATAmountLine."VAT Identifier")
                        {
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control173; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control171; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount__Control169; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control175; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control176; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control177; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control178; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount__Control179; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Amount__Control181; VATAmountLine."VAT Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__VAT_Base__Control182; VATAmountLine."VAT Base")
                        {
                            AutoFormatExpression = "Sales Line"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control183; VATAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control184; VATAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATAmountLine__Line_Amount__Control185; VATAmountLine."Line Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(VATCounter_Number; Number)
                        {
                        }
                        column(VATAmountLine__VAT_Amount__Control150Caption; VATAmountLine__VAT_Amount__Control150CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Base__Control151Caption; VATAmountLine__VAT_Base__Control151CaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT___Caption; VATAmountLine__VAT___CaptionLbl)
                        {
                        }
                        column(VAT_Amount_SpecificationCaption; VAT_Amount_SpecificationCaptionLbl)
                        {
                        }
                        column(VATAmountLine__VAT_Identifier_Caption; VATAmountLine__VAT_Identifier_CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Invoice_Discount_Amount__Control173Caption; VATAmountLine__Invoice_Discount_Amount__Control173CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Inv__Disc__Base_Amount__Control171Caption; VATAmountLine__Inv__Disc__Base_Amount__Control171CaptionLbl)
                        {
                        }
                        column(VATAmountLine__Line_Amount__Control169Caption; VATAmountLine__Line_Amount__Control169CaptionLbl)
                        {
                        }
                        column(ContinuedCaption; ContinuedCaptionLbl)
                        {
                        }
                        column(ContinuedCaption_Control155; ContinuedCaption_Control155Lbl)
                        {
                        }
                        column(TotalCaption; TotalCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            VATAmountLine.GetLine(Number);
                        end;

                        trigger OnPreDataItem();
                        begin
                            SETRANGE(Number, 1, VATAmountLine.COUNT);
                            CurrReport.CREATETOTALS(
                              VATAmountLine."VAT Base", VATAmountLine."VAT Amount", VATAmountLine."Amount Including VAT",
                              VATAmountLine."Line Amount", VATAmountLine."Inv. Disc. Base Amount",
                              VATAmountLine."Invoice Discount Amount");
                        end;
                    }
                    dataitem(SalesTaxCounter; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(SalesHeader__Currency_Code_; "Sales Header"."Currency Code")
                        {
                        }
                        column(SalesTaxAmountLine__Tax_Amount_; SalesTaxAmountLine."Tax Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesTaxAmountLine__Tax_Amount__Control1020000; SalesTaxAmountLine."Tax Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesTaxAmountLine__Tax_Area_Code_for_Key_; SalesTaxAmountLine."Tax Area Code for Key")
                        {
                            AutoFormatType = 1;
                        }
                        column(SalesTaxAmountLine__Tax_Base_Amount_; SalesTaxAmountLine."Tax Base Amount")
                        {
                            AutoFormatType = 1;
                        }
                        column(SalesTaxAmountLine__Inv__Disc__Base_Amount_; SalesTaxAmountLine."Inv. Disc. Base Amount")
                        {
                            AutoFormatType = 1;
                        }
                        column(SalesTaxAmountLine__Invoice_Discount_Amount_; SalesTaxAmountLine."Invoice Discount Amount")
                        {
                            AutoFormatType = 1;
                        }
                        column(SalesTaxAmountLine__Tax___; SalesTaxAmountLine."Tax %")
                        {
                            AutoFormatType = 1;
                        }
                        column(SalesTaxAmountLine__Tax_Amount__Control1020011; SalesTaxAmountLine."Tax Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesTaxAmountLine__Tax_Amount__Control1020022; SalesTaxAmountLine."Tax Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesTaxAmountLine__Tax_Amount__Control1020014; SalesTaxAmountLine."Tax Amount")
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(SalesTaxAmountLine__Tax_Amount____ExchangeFactor; VATAmount)
                        {
                            AutoFormatExpression = "Sales Header"."Currency Code";
                            AutoFormatType = 1;
                        }
                        column(Total______Sales_Header___Currency_Code_; 'Total ' + "Sales Header"."Currency Code")
                        {
                        }
                        column(ExchangeFactor; ExchangeFactor)
                        {
                        }
                        column(SalesTaxCounter_Number; Number)
                        {
                        }
                        column(SalesTaxAmountLine__Tax_Area_Code_for_Key_Caption; SalesTaxAmountLine__Tax_Area_Code_for_Key_CaptionLbl)
                        {
                        }
                        column(SalesTaxAmountLine__Tax_Base_Amount_Caption; SalesTaxAmountLine__Tax_Base_Amount_CaptionLbl)
                        {
                        }
                        column(SalesTaxAmountLine__Tax_Amount__Control1020000Caption; SalesTaxAmountLine__Tax_Amount__Control1020000CaptionLbl)
                        {
                        }
                        column(SalesTaxAmountLine__Inv__Disc__Base_Amount_Caption; SalesTaxAmountLine__Inv__Disc__Base_Amount_CaptionLbl)
                        {
                        }
                        column(SalesTaxAmountLine__Invoice_Discount_Amount_Caption; SalesTaxAmountLine__Invoice_Discount_Amount_CaptionLbl)
                        {
                        }
                        column(SalesTaxAmountLine__Tax___Caption; SalesTaxAmountLine__Tax___CaptionLbl)
                        {
                        }
                        column(Sales_Tax_AmountsCaption; Sales_Tax_AmountsCaptionLbl)
                        {
                        }
                        column(ContinuedCaption_Control1020002; ContinuedCaption_Control1020002Lbl)
                        {
                        }
                        column(ContinuedCaption_Control1020007; ContinuedCaption_Control1020007Lbl)
                        {
                        }
                        column(TotalCaption_Control1020021; TotalCaption_Control1020021Lbl)
                        {
                        }
                        column(TotalCaption_Control1020012; TotalCaption_Control1020012Lbl)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            if Number = 1 then
                                SalesTaxAmountLine.FIND('-')
                            else
                                SalesTaxAmountLine.NEXT;

                            if SalesTaxCountry = SalesTaxCountry::CA then
                                SalesTaxAmountLine."Tax Amount" := ROUND(SalesTaxAmountLine."Tax Amount", GLSetup."Amount Rounding Precision")
                            else begin
                                SalesTaxAmountLine."Tax Amount" += RemSalesTaxAmt;
                                RemSalesTaxAmt :=
                                  SalesTaxAmountLine."Tax Amount" - ROUND(
                                    SalesTaxAmountLine."Tax Amount", GLSetup."Amount Rounding Precision");
                                SalesTaxAmountLine."Tax Amount" := ROUND(SalesTaxAmountLine."Tax Amount", GLSetup."Amount Rounding Precision");
                            end;
                        end;

                        trigger OnPreDataItem();
                        begin
                            if not SalesTax then
                                CurrReport.BREAK;

                            SETRANGE(Number, 1, SalesTaxAmountLine.COUNT);
                            SalesTaxAmountLine.RESET;
                            CurrReport.CREATETOTALS(
                              SalesTaxAmountLine."Tax Amount", SalesTaxAmountLine."Amount Including Tax",
                              SalesTaxAmountLine."Line Amount", SalesTaxAmountLine."Inv. Disc. Base Amount",
                              SalesTaxAmountLine."Invoice Discount Amount");
                            RemSalesTaxAmt := 0;
                        end;
                    }
                    dataitem("Item Charge Assignment (Sales)"; "Item Charge Assignment (Sales)")
                    {
                        DataItemLink = "Document Type" = FIELD ("Document Type"), "Document No." = FIELD ("Document No.");
                        DataItemLinkReference = "Sales Line";
                        DataItemTableView = SORTING ("Document Type", "Document No.", "Document Line No.", "Line No.");
                        column(Item_Charge_Assignment__Sales___Qty__to_Assign_; "Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Amount_to_Assign_; "Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Item_Charge_No__; "Item Charge No.")
                        {
                        }
                        column(SalesLine2_Description; SalesLine2.Description)
                        {
                        }
                        column(SalesLine2_Quantity; SalesLine2.Quantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(Item_Charge_Assignment__Sales___Item_No__; "Item No.")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Qty__to_Assign__Control209; "Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Unit_Cost_; "Unit Cost")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Amount_to_Assign__Control216; "Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Qty__to_Assign__Control221; "Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Amount_to_Assign__Control222; "Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Qty__to_Assign__Control224; "Qty. to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Amount_to_Assign__Control225; "Amount to Assign")
                        {
                        }
                        column(Item_Charge_Assignment__Sales__Document_Type; "Document Type")
                        {
                        }
                        column(Item_Charge_Assignment__Sales__Document_No_; "Document No.")
                        {
                        }
                        column(Item_Charge_Assignment__Sales__Document_Line_No_; "Document Line No.")
                        {
                        }
                        column(Item_Charge_Assignment__Sales__Line_No_; "Line No.")
                        {
                        }
                        column(Item_Charge_SpecificationCaption; Item_Charge_SpecificationCaptionLbl)
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Item_Charge_No__Caption; FIELDCAPTION("Item Charge No."))
                        {
                        }
                        column(SalesLine2_DescriptionCaption; SalesLine2_DescriptionCaptionLbl)
                        {
                        }
                        column(SalesLine2_QuantityCaption; SalesLine2_QuantityCaptionLbl)
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Item_No__Caption; FIELDCAPTION("Item No."))
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Qty__to_Assign__Control209Caption; FIELDCAPTION("Qty. to Assign"))
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Unit_Cost_Caption; FIELDCAPTION("Unit Cost"))
                        {
                        }
                        column(Item_Charge_Assignment__Sales___Amount_to_Assign__Control216Caption; FIELDCAPTION("Amount to Assign"))
                        {
                        }
                        column(ContinuedCaption_Control210; ContinuedCaption_Control210Lbl)
                        {
                        }
                        column(TotalCaption_Control220; TotalCaption_Control220Lbl)
                        {
                        }
                        column(ContinuedCaption_Control223; ContinuedCaption_Control223Lbl)
                        {
                        }

                        trigger OnAfterGetRecord();
                        begin
                            if SalesLine2.GET("Document Type", "Document No.", "Document Line No.") then;
                        end;

                        trigger OnPreDataItem();
                        begin
                            if not ShowCostAssignment then
                                CurrReport.BREAK;
                            CurrReport.CREATETOTALS("Amount to Assign", "Qty. to Assign");
                        end;
                    }

                    trigger OnAfterGetRecord();
                    begin
                        CLEAR(TempSalesLine);
                        CLEAR(SalesPost);
                        VATAmountLine.DELETEALL;
                        TempSalesLine.DELETEALL;
                        SalesPost.GetSalesLines("Sales Header", TempSalesLine, 1);
                        TempSalesLine.CalcVATAmountLines(0, "Sales Header", TempSalesLine, VATAmountLine);
                        TempSalesLine.UpdateVATOnLines(0, "Sales Header", TempSalesLine, VATAmountLine);
                        VATAmount := VATAmountLine.GetTotalVATAmount;
                        VATBaseAmount := VATAmountLine.GetTotalVATBase;
                        VATDiscountAmount :=
                          VATAmountLine.GetTotalVATDiscount("Sales Header"."Currency Code", "Sales Header"."Prices Including VAT");
                        if SalesTax then begin
                            SalesTaxAmountLine.DELETEALL;
                            OnBeforeCalculateSalesTax("Sales Header", SalesTaxAmountLine, SalesTaxCalculationOverridden);
                            SalesTaxCalculate.StartSalesTaxCalculation;
                        end;
                    end;
                }
            }

            trigger OnAfterGetRecord();
            var
                TableID: array[10] of Integer;
                No: array[10] of Code[20];
                SalesInvoice: Record "Sales Invoice Header";
            begin
                DimSetEntry1.SETRANGE("Dimension Set ID", "Dimension Set ID");

                FormatAddr.SalesHeaderSellTo(SellToAddr, "Sales Header");
                FormatAddr.SalesHeaderBillTo(BillToAddr, "Sales Header");
                FormatAddr.SalesHeaderShipTo(ShipToAddr, ShipToAddr, "Sales Header");
                if "Currency Code" = '' then begin
                    GLSetup.TESTFIELD("LCY Code");
                    TotalText := STRSUBSTNO(Text004, GLSetup."LCY Code");
                    TotalExclVATText := STRSUBSTNO(Text033, GLSetup."LCY Code");
                    TotalInclVATText := STRSUBSTNO(Text005, GLSetup."LCY Code");
                    ExchangeFactor := 1;
                end else begin
                    TotalText := STRSUBSTNO(Text004, "Currency Code");
                    TotalExclVATText := STRSUBSTNO(Text033, "Currency Code");
                    TotalInclVATText := STRSUBSTNO(Text005, "Currency Code");
                    ExchangeFactor := "Currency Factor";
                end;

                Invoice := InvOnNextPostReq;
                Ship := ShipReceiveOnNextPostReq;
                Receive := ShipReceiveOnNextPostReq;

                SalesTax := "Tax Area Code" <> '';
                if SalesTax then begin
                    HeaderTaxArea.GET("Tax Area Code");
                    SalesTaxCountry := HeaderTaxArea."Country/Region";
                end else
                    SalesTaxCountry := SalesTaxCountry::NoTax;

                VerifySellToCust("Sales Header");
                VerifyBillToCust("Sales Header");

                SalesSetup.GET;

                VerifyPostingDate("Sales Header");

                if "Document Date" <> 0D then
                    if "Document Date" <> NORMALDATE("Document Date") then
                        AddError(STRSUBSTNO(Text009, FIELDCAPTION("Document Date")));

                case "Document Type" of
                    "Document Type"::Order:
                        Receive := false;
                    "Document Type"::Invoice:
                        begin
                            Ship := true;
                            Invoice := true;
                            Receive := false;
                        end;
                    "Document Type"::"Return Order":
                        Ship := false;
                    "Document Type"::"Credit Memo":
                        begin
                            Ship := false;
                            Invoice := true;
                            Receive := true;
                        end;
                end;

                if not (Ship or Invoice or Receive) then
                    AddError(
                      STRSUBSTNO(
                        Text034,
                        FIELDCAPTION(Ship), FIELDCAPTION(Invoice), FIELDCAPTION(Receive)));

                if Invoice then begin
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document Type", "Document Type");
                    SalesLine.SETRANGE("Document No.", "No.");
                    SalesLine.SETFILTER(Quantity, '<>0');
                    if "Document Type" in ["Document Type"::Order, "Document Type"::"Return Order"] then
                        SalesLine.SETFILTER("Qty. to Invoice", '<>0');
                    Invoice := SalesLine.FIND('-');
                    if Invoice and (not Ship) and ("Document Type" = "Document Type"::Order) then begin
                        Invoice := false;
                        repeat
                            Invoice := (SalesLine."Quantity Shipped" - SalesLine."Quantity Invoiced") <> 0;
                        until Invoice or (SalesLine.NEXT = 0);
                    end else
                        if Invoice and (not Receive) and ("Document Type" = "Document Type"::"Return Order") then begin
                            Invoice := false;
                            repeat
                                Invoice := (SalesLine."Return Qty. Received" - SalesLine."Quantity Invoiced") <> 0;
                            until Invoice or (SalesLine.NEXT = 0);
                        end;
                end;

                if Ship then begin
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document Type", "Document Type");
                    SalesLine.SETRANGE("Document No.", "No.");
                    SalesLine.SETFILTER(Quantity, '<>0');
                    if "Document Type" = "Document Type"::Order then
                        SalesLine.SETFILTER("Qty. to Ship", '<>0');
                    SalesLine.SETRANGE("Shipment No.", '');
                    Ship := SalesLine.FIND('-');
                end;
                if Receive then begin
                    SalesLine.RESET;
                    SalesLine.SETRANGE("Document Type", "Document Type");
                    SalesLine.SETRANGE("Document No.", "No.");
                    SalesLine.SETFILTER(Quantity, '<>0');
                    if "Document Type" = "Document Type"::"Return Order" then
                        SalesLine.SETFILTER("Return Qty. to Receive", '<>0');
                    SalesLine.SETRANGE("Return Receipt No.", '');
                    Receive := SalesLine.FIND('-');
                end;

                if not (Ship or Invoice or Receive) then
                    AddError(Text012);

                if Invoice then
                    if not ("Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"]) then
                        if "Due Date" = 0D then
                            AddError(STRSUBSTNO(Text006, FIELDCAPTION("Due Date")));

                if Ship and ("Shipping No." = '') then // Order,Invoice
                    if ("Document Type" = "Document Type"::Order) or
                       (("Document Type" = "Document Type"::Invoice) and SalesSetup."Shipment on Invoice")
                    then
                        if "Shipping No. Series" = '' then
                            AddError(
                              STRSUBSTNO(
                                Text006,
                                FIELDCAPTION("Shipping No. Series")));

                if Receive and ("Return Receipt No." = '') then // Return Order,Credit Memo
                    if ("Document Type" = "Document Type"::"Return Order") or
                       (("Document Type" = "Document Type"::"Credit Memo") and SalesSetup."Return Receipt on Credit Memo")
                    then
                        if "Return Receipt No. Series" = '' then
                            AddError(
                              STRSUBSTNO(
                                Text006,
                                FIELDCAPTION("Return Receipt No. Series")));

                if Invoice and ("Posting No." = '') then
                    if "Document Type" in ["Document Type"::Order, "Document Type"::"Return Order"] then
                        if "Posting No. Series" = '' then
                            AddError(
                              STRSUBSTNO(
                                Text006,
                                FIELDCAPTION("Posting No. Series")));

                SalesLine.RESET;
                SalesLine.SETRANGE("Document Type", "Document Type");
                SalesLine.SETRANGE("Document No.", "No.");
                SalesLine.SETFILTER("Purch. Order Line No.", '<>0');
                if Ship then
                    if SalesLine.FIND('-') then
                        repeat
                            if PurchOrderHeader."No." <> SalesLine."Purchase Order No." then begin
                                PurchOrderHeader.GET(PurchOrderHeader."Document Type"::Order, SalesLine."Purchase Order No.");
                                if PurchOrderHeader."Pay-to Vendor No." = '' then
                                    AddError(
                                      STRSUBSTNO(
                                        Text013,
                                        PurchOrderHeader.FIELDCAPTION("Pay-to Vendor No.")));
                                if PurchOrderHeader."Receiving No." = '' then
                                    if PurchOrderHeader."Receiving No. Series" = '' then
                                        AddError(
                                          STRSUBSTNO(
                                            Text013,
                                            PurchOrderHeader.FIELDCAPTION("Receiving No. Series")));
                            end;
                        until SalesLine.NEXT = 0;

                if "Document Type" in ["Document Type"::Order, "Document Type"::Invoice] then
                    if SalesSetup."Ext. Doc. No. Mandatory" and ("External Document No." = '') then
                        AddError(STRSUBSTNO(Text006, FIELDCAPTION("External Document No.")));

                if not DimMgt.CheckDimIDComb("Dimension Set ID") then
                    AddError(DimMgt.GetDimCombErr);

                TableID[1] := DATABASE::Customer;
                No[1] := "Bill-to Customer No.";
                TableID[3] := DATABASE::"Salesperson/Purchaser";
                No[3] := "Salesperson Code";
                TableID[4] := DATABASE::Campaign;
                No[4] := "Campaign No.";
                TableID[5] := DATABASE::"Responsibility Center";
                No[5] := "Responsibility Center";
                if not DimMgt.CheckDimValuePosting(TableID, No, "Dimension Set ID") then
                    AddError(DimMgt.GetDimValuePostingErr);

                SalesLine.RESET;
                SalesLine.SETRANGE("Document Type", "Document Type");
                SalesLine.SETRANGE("Document No.", "No.");
                InvoiceAmount := 0;
                if SalesLine.FINDSET then
                    repeat
                        InvoiceAmount += SalesLine."Outstanding Amount";
                    until SalesLine.NEXT = 0;
                if Salesperson.GET("Salesperson Code") then;

                //Sbr-Jo
                PrepaymentNo := '';
                SalesInvoice.RESET;
                SalesInvoice.SetRange("Prepayment Order No.", "No.");
                IF SalesInvoice.FindFirst() then begin
                    PrepaymentNo := SalesInvoice."No.";
                    PrepaymentDue := SalesInvoice.Amount;
                    PrepaymentTax := SalesInvoice."Amount Including VAT" - SalesInvoice.Amount;
                    PrepaymentTotalDue := SalesInvoice."Amount Including VAT";
                end;
                //End Sbr-Jo
            end;

            trigger OnPreDataItem();
            begin
                SalesHeader.COPY("Sales Header");
                SalesHeader.FILTERGROUP := 2;
                SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::Order);
                if SalesHeader.FINDFIRST then begin
                    case true of
                        ShipReceiveOnNextPostReq and InvOnNextPostReq:
                            ShipInvText := Text000;
                        ShipReceiveOnNextPostReq:
                            ShipInvText := Text001;
                        InvOnNextPostReq:
                            ShipInvText := Text002;
                    end;
                    ShipInvText := STRSUBSTNO(Text003, ShipInvText);
                end;
                SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::"Return Order");
                if SalesHeader.FINDFIRST then begin
                    case true of
                        ShipReceiveOnNextPostReq and InvOnNextPostReq:
                            ReceiveInvText := Text018;
                        ShipReceiveOnNextPostReq:
                            ReceiveInvText := Text031;
                        InvOnNextPostReq:
                            ReceiveInvText := Text002;
                    end;
                    ReceiveInvText := STRSUBSTNO(Text032, ReceiveInvText);
                end;
                CurrReport.NEWPAGEPERRECORD := not Summarize;
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
                    group("Order/Return Order Posting")
                    {
                        CaptionML = ENU = 'Order/Return Order Posting',
                                    ESM = 'Pedido/Devolución regis.',
                                    FRC = 'Report commande/retour',
                                    ENC = 'Order/Return Order Posting';
                        field(ShipReceiveOnNextPostReq; ShipReceiveOnNextPostReq)
                        {
                            ApplicationArea = Advanced;
                            CaptionML = ENU = 'Ship/Receive',
                                        ESM = 'Enviar/Recibir',
                                        FRC = 'Livrer/Réceptionner',
                                        ENC = 'Ship/Receive';
                            ToolTipML = ENU = 'Specifies whether you want to post the documents that are being tested as shipped/received, as invoiced or as shipped/received and invoiced. Select the check box next to each option that you want to select.',
                                        ESM = 'Especifica si desea registrar los documentos ya comprobados como enviados/recibidos, como facturados o como enviados/facturados. Seleccione la casilla de verificación junto a cada opción que desee seleccionar.',
                                        FRC = 'Spécifie si vous souhaitez reporter les documents en cours de test comme étant livrés/reçus, facturés ou livrés/reçus et facturés. Activez la case à cocher en regard de l''option désirée.',
                                        ENC = 'Specifies whether you want to post the documents that are being tested as shipped/received, as invoiced or as shipped/received and invoiced. Select the check box next to each option that you want to select.';

                            trigger OnValidate();
                            begin
                                if not ShipReceiveOnNextPostReq then
                                    InvOnNextPostReq := true;
                            end;
                        }
                        field(InvOnNextPostReq; InvOnNextPostReq)
                        {
                            ApplicationArea = Advanced;
                            CaptionML = ENU = 'Invoice',
                                        ESM = 'Factura',
                                        FRC = 'Facture',
                                        ENC = 'Invoice';
                            ToolTipML = ENU = 'Specifies invoices to test before you post them, to check whether there are any posting dates missing, etc.',
                                        ESM = 'Especifica las facturas que se van a probar antes de registrarlas, para comprobar si faltan fechas de registro, etc.',
                                        FRC = 'Spécifie les factures à tester avant leur report pour vérifier si des dates de report sont manquantes, etc.',
                                        ENC = 'Specifies invoices to test before you post them, to check whether there are any posting dates missing, etc.';

                            trigger OnValidate();
                            begin
                                if not InvOnNextPostReq then
                                    ShipReceiveOnNextPostReq := true;
                            end;
                        }
                    }
                    field(ShowDim; ShowDim)
                    {
                        ApplicationArea = Dimensions;
                        CaptionML = ENU = 'Show Dimensions',
                                    ESM = 'Mostrar dimensiones',
                                    FRC = 'Afficher dimensions',
                                    ENC = 'Show Dimensions';
                        ToolTipML = ENU = 'Specifies if you want dimensions information for the journal lines that you want to include in the report.',
                                    ESM = 'Especifica si desea que se incluya en el informe la información de dimensiones de las líneas del diario.',
                                    FRC = 'Spécifie si vous souhaitez inclure dans le rapport des informations sur les dimensions pour les lignes journal souhaitées.',
                                    ENC = 'Specifies if you want dimensions information for the journal lines that you want to include in the report.';
                    }
                    field(ShowItemChargeAssignment; ShowCostAssignment)
                    {
                        ApplicationArea = Advanced;
                        CaptionML = ENU = 'Show Item Charge Assgnt.',
                                    ESM = 'Mostrar asig. cargos prod.',
                                    FRC = 'Afficher affect. frais annexes',
                                    ENC = 'Show Item Charge Assgnt.';
                        ToolTipML = ENU = 'Specifies if you want the test report to show the item charges that have been assigned to the sales document.',
                                    ESM = 'Especifica si desea que el informe de prueba muestre los cargos de producto asignados al documento de venta.',
                                    FRC = 'Spécifie si vous souhaitez que le rapport de test affiche les frais annexes affectés au document vente.',
                                    ENC = 'Specifies if you want the test report to show the item charges that have been assigned to the sales document.';
                    }
                    field(Summarize; Summarize)
                    {
                        CaptionML = ENU = 'Summary',
                                    ESM = 'Resumen',
                                    FRC = 'Sommaire',
                                    ENC = 'Summary';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
            if not ShipReceiveOnNextPostReq and not InvOnNextPostReq then begin
                ShipReceiveOnNextPostReq := true;
                InvOnNextPostReq := true;
            end;
        end;
    }

    labels
    {
    }

    trigger OnInitReport();
    begin
        GLSetup.GET;
    end;

    trigger OnPreReport();
    begin
        SalesHeaderFilter := "Sales Header".GETFILTERS;
    end;

    var
        Text000: TextConst ENU = 'Ship and Invoice', ESM = 'Enviar y facturar', FRC = 'Livrer et facturer', ENC = 'Ship and Invoice';
        Text001: TextConst ENU = 'Ship', ESM = 'Envío', FRC = 'Livrer', ENC = 'Ship';
        Text002: TextConst ENU = 'Invoice', ESM = 'Facturar', FRC = 'Facture', ENC = 'Invoice';
        Text003: TextConst ENU = 'Order Posting: %1', ESM = 'Registro pedido: %1', FRC = 'Commande report: %1', ENC = 'Order Posting: %1';
        Text004: TextConst ENU = 'Total %1', ESM = 'Total %1', FRC = 'Total %1', ENC = 'Total %1';
        Text005: TextConst ENU = 'Total %1 Incl. Tax', ESM = 'Total %1 con IVA', FRC = 'Total %1 incluant TVA', ENC = 'Total %1 Incl. Tax';
        Text006: TextConst ENU = '%1 must be specified.', ESM = 'Se debe indicar %1.', FRC = '%1 doit être spécifié.', ENC = '%1 must be specified.';
        Text007: TextConst ENU = '%1 must be %2 for %3 %4.', ESM = '%1 debe ser %2 para %3 %4.', FRC = '%1 doit être %2 pour %3 %4.', ENC = '%1 must be %2 for %3 %4.';
        Text008: TextConst ENU = '%1 %2 does not exist.', ESM = 'No existe %1 %2.', FRC = '%1 %2 n''existe pas.', ENC = '%1 %2 does not exist.';
        Text009: TextConst ENU = '%1 must not be a closing date.', ESM = '%1 no debe ser una fecha de cierre.', FRC = '%1 ne doit pas être une date de fermeture.', ENC = '%1 must not be a closing date.';
        Text010: TextConst ENU = '%1 is not within your allowed range of posting dates.', ESM = '%1 no se encuentra en su rango permitido de fechas de registro.', FRC = '%1 n''est pas à l''intérieur des dates de report permises.', ENC = '%1 is not within your allowed range of posting dates.';
        Text012: TextConst ENU = 'There is nothing to post.', ESM = 'No hay nada que registrar.', FRC = 'Il n''y a rien à reporter.', ENC = 'There is nothing to post.';
        Text013: TextConst ENU = '%1 must be entered on the purchase order header.', ESM = 'En la cabecera de compra se debe indicar %1.', FRC = '%1 doit être entrée sur l''en-tête des bons de commande.', ENC = '%1 must be entered on the purchase order header.';
        Text014: TextConst ENU = 'Sales Document: %1', ESM = 'Documento ventas: %1', FRC = 'Document ventes: %1', ENC = 'Sales Document: %1';
        Text015: TextConst ENU = '%1 must be %2.', ESM = '%1 debe ser %2.', FRC = '%1 doit être %2.', ENC = '%1 must be %2.';
        Text016: TextConst ENU = '%1 %2 does not exist on customer entries.', ESM = '%1 %2 no existe en los movs. cliente.', FRC = '%1 %2 n''existe pas sur les écritures client.', ENC = '%1 %2 does not exist on customer entries.';
        Text017: TextConst ENU = '%1 %2 %3 does not exist.', ESM = 'No existe %1 %2 %3.', FRC = '%1 %2 %3 n''existe pas.', ENC = '%1 %2 %3 does not exist.';
        Text018: TextConst ENU = 'Receive and Credit Memo', ESM = 'Recibir y abonar', FRC = 'Réceptionner et créer note de crédit', ENC = 'Receive and Credit Memo';
        Text019: TextConst ENU = '%1 %2 must be specified.', ESM = 'Se debe indicar %1 %2.', FRC = '%1 %2 doit être spécifié.', ENC = '%1 %2 must be specified.';
        Text020: TextConst ENU = '%1 must be 0 when %2 is 0.', ESM = '%1 debe ser 0 cuando %2 es 0.', FRC = '%1 doit être 0 lorsque %2 est 0.', ENC = '%1 must be 0 when %2 is 0.';
        Text021: TextConst ENU = 'Drop shipments are only possible for items.', ESM = 'Envío directo sólo es posible para productos.', FRC = 'Les livraisons directes sont possible que pour les articles.', ENC = 'Drop shipments are only possible for items.';
        Text022: TextConst ENU = 'You cannot ship sales order line %1 because the line is marked', ESM = 'No se puede enviar la línea %1 del pedido de venta porque está marcada', FRC = 'Vous ne pouvez livrer la ligne bordereau de ventes %1 parce que la ligne est marquée', ENC = 'You cannot ship sales order line %1 because the line is marked';
        Text023: TextConst ENU = 'as a drop shipment and is not yet associated with a purchase order.', ESM = 'como envío directo y todavía no está asociado a un pedido de compra.', FRC = 'comme une livraison directe et n''est pas encore associée à un bon de commande.', ENC = 'as a drop shipment and is not yet associated with a purchase order.';
        Text024: TextConst ENU = 'The %1 on the shipment is not the same as the %1 on the sales header.', ESM = 'En el envío %1 no es el mismo que %1 en la cabecera de ventas.', FRC = 'Le %1 sur la livraison n''est pas le même que le %1 sur l''en-tête de ventes.', ENC = 'The %1 on the shipment is not the same as the %1 on the sales header.';
        Text025: TextConst ENU = 'Line %1 of the return receipt %2, which you are attempting to invoice, has already been invoiced.', ESM = 'Lín. %1 de la recep. dev %2, que esta intentando facturar, ya se ha facturado.', FRC = 'La ligne %1 de la réception retour %2, que vous essayez de facturer, a déjà été facturée.', ENC = 'Line %1 of the return receipt %2, which you are attempting to invoice, has already been invoiced.';
        Text026: TextConst ENU = 'Line %1 of the shipment %2, which you are attempting to invoice, has already been invoiced.', ESM = 'Línea %1 del envío %2, que está intentando facturar, ha sido ya facturado.', FRC = 'La ligne %1 de la livraison %2 que vous essayez de facturer a déjà été facturée.', ENC = 'Line %1 of the shipment %2, which you are attempting to invoice, has already been invoiced.';
        Text027: TextConst ENU = '%1 must have the same sign as the shipments.', ESM = '%1 debe tener el mismo signo que los envíos.', FRC = '%1 doit avoir le même signe que les livraisons.', ENC = '%1 must have the same sign as the shipments.';
        Text031: TextConst ENU = 'Receive', ESM = 'Recepción', FRC = 'Recevoir', ENC = 'Receive';
        Text032: TextConst ENU = 'Return Order Posting: %1', ESM = 'Registrando devolución: %1', FRC = 'Report retour : %1', ENC = 'Return Order Posting: %1';
        Text033: TextConst ENU = 'Total %1 Excl. Tax', ESM = 'Total %1 sin IVA', FRC = 'Total %1 excluant TVA', ENC = 'Total %1 Excl. Tax';
        Text034: TextConst ENU = 'Enter "Yes" in %1 and/or %2 and/or %3.', ESM = 'Introduzca "Sí" en %1 y/ó %2 y/ó %3.', FRC = 'Entrez "Oui" dans %1 et/ou %2 et/ou %3.', ENC = 'Enter "Yes" in %1 and/or %2 and/or %3.';
        Text035: TextConst ENU = 'You must enter the customer''s %1.', ESM = 'Debe introducir el %1 del cliente.', FRC = 'Vous devez entrer le %1 du client.', ENC = 'You must enter the customer''s %1.';
        Text036: TextConst ENU = 'The quantity you are attempting to invoice is greater than the quantity in shipment %1.', ESM = 'La cdad. que está intentando facturar es mayor que la cdad. en remisión de venta %1.', FRC = 'La quantité facturée est supérieure à la quantité livrée %1.', ENC = 'The quantity you are attempting to invoice is greater than the quantity in shipment %1.';
        Text037: TextConst ENU = 'The quantity you are attempting to invoice is greater than the quantity in return receipt %1.', ESM = 'La cdad. que esta intentando facturar es mayor que la cantidad en la recep. devol. %1.', FRC = 'La quantité facturée est supérieure à la quantité de la réception retour %1.', ENC = 'The quantity you are attempting to invoice is greater than the quantity in return receipt %1.';
        Text038: TextConst ENU = 'The %1 on the return receipt is not the same as the %1 on the sales header.', ESM = 'El %1 en la recep. devol. no es el mismo que el %1 en la cabecera de vtas.', FRC = 'Le %1 du document réception retour n''est pas le même que le %1 de l''en-tête vente.', ENC = 'The %1 on the return receipt is not the same as the %1 on the sales header.';
        Text039: TextConst ENU = '%1 must have the same sign as the return receipt.', ESM = '%1 debe tener el mismo signo que la recep. devol.', FRC = 'La %1 doit avoir le même signe que sur le document réception retour.', ENC = '%1 must have the same sign as the return receipt.';
        SalesSetup: Record "Sales & Receivables Setup";
        GLSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
        Cust: Record Customer;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        SalesLine2: Record "Sales Line";
        TempSalesLine: Record "Sales Line" temporary;
        GLAcc: Record "G/L Account";
        Item: Record Item;
        Res: Record Resource;
        SaleShptLine: Record "Sales Shipment Line";
        ReturnRcptLine: Record "Return Receipt Line";
        PurchOrderHeader: Record "Purchase Header";
        GenPostingSetup: Record "General Posting Setup";
        VATPostingSetup: Record "VAT Posting Setup";
        CustLedgEntry: Record "Cust. Ledger Entry";
        VATAmountLine: Record "VAT Amount Line" temporary;
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        SalesTaxAmountLine: Record "Sales Tax Amount Line" temporary;
        FA: Record "Fixed Asset";
        FADeprBook: Record "FA Depreciation Book";
        InvtPeriod: Record "Inventory Period";
        HeaderTaxArea: Record "Tax Area";
        FormatAddr: Codeunit "Format Address";
        DimMgt: Codeunit DimensionManagement;
        SalesTaxCalculate: Codeunit "Sales Tax Calculate";
        SalesPost: Codeunit "Sales-Post";
        SalesHeaderFilter: Text;
        SellToAddr: array[8] of Text[50];
        BillToAddr: array[8] of Text[50];
        ShipToAddr: array[8] of Text[50];
        TotalText: Text[50];
        TotalExclVATText: Text[50];
        TotalInclVATText: Text[50];
        ShipInvText: Text[50];
        ReceiveInvText: Text[50];
        DimText: Text[120];
        OldDimText: Text[75];
        ErrorText: array[99] of Text[250];
        QtyToHandleCaption: Text[30];
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        MaxQtyToBeInvoiced: Decimal;
        RemQtyToBeInvoiced: Decimal;
        QtyToBeInvoiced: Decimal;
        VATAmount: Decimal;
        VATBaseAmount: Decimal;
        VATDiscountAmount: Decimal;
        QtyToHandle: Decimal;
        ErrorCounter: Integer;
        OrigMaxLineNo: Integer;
        InvOnNextPostReq: Boolean;
        ShipReceiveOnNextPostReq: Boolean;
        VATNoError: Boolean;
        ApplNoError: Boolean;
        ShowDim: Boolean;
        Continue: Boolean;
        ShowCostAssignment: Boolean;
        Text043: TextConst ENU = '%1 must be zero.', ESM = '%1 debe ser cero.', FRC = '%1 doit être égal à zéro.', ENC = '%1 must be zero.';
        Text045: TextConst ENU = '%1 must not be %2 for %3 %4.', ESM = '%1 no debe ser %2 para %3 %4.', FRC = '%1 ne doit pas être %2 lorsque %3 %4.', ENC = '%1 must not be %2 for %3 %4.';
        MoreLines: Boolean;
        SalesTax: Boolean;
        ExchangeFactor: Decimal;
        Text046: TextConst ENU = '%1 must be completely preinvoiced before you can ship or invoice the line.', ESM = 'Se debe haber emitido una factura completa de %1 para poder enviar la línea o facturarla.', FRC = '%1 doit faire l''objet d''une facture préalable  complète avant que vous puissiez livrer ou facturer la ligne.', ENC = '%1 must be completely preinvoiced before you can ship or invoice the line.';
        Text053: TextConst ENU = '%1 can at most be %2.', ESM = '%1 puede ser como mucho %2.', FRC = '%1 peut être au plus %2.', ENC = '%1 can at most be %2.';
        Text054: TextConst ENU = '%1 must be at least %2.', ESM = '%1 debe ser al menos %2.', FRC = '%1 doit être au moins %2.', ENC = '%1 must be at least %2.';
        SumLineAmount: Decimal;
        SumInvDiscountAmount: Decimal;
        TaxText: Text[30];
        totAmount: Decimal;
        Summarize: Boolean;
        Salesperson: Record "Salesperson/Purchaser";
        InvoiceAmount: Decimal;
        TempVATAmount: Decimal;
        SalesTaxCountry: Option US,CA,,,,,,,,,,,,NoTax;
        RemSalesTaxAmt: Decimal;
        CurrReport_PAGENOCaptionLbl: TextConst ENU = 'Page', ESM = 'Pág.', FRC = 'Page', ENC = 'Page';
        Sales_Document___TestCaptionLbl: TextConst ENU = 'Sales Document - Test', ESM = 'Documento ventas - Prueba', FRC = 'Document de vente - Test', ENC = 'Sales Document - Test';
        Document_No_CaptionLbl: TextConst ENU = 'Document No.', ESM = 'Nº documento', FRC = 'N° de document', ENC = 'Document No.';
        Invoice_Amount_Excl__TaxCaptionLbl: TextConst ENU = 'Invoice Amount Excl. Tax', ESM = 'Importe de la factura sin impuestos', FRC = 'Montant de la facture hors taxe', ENC = 'Invoice Amount Excl. Tax';
        Customer_InformationCaptionLbl: TextConst ENU = 'Customer Information', ESM = 'Información cliente', FRC = 'Renseignements sur le client', ENC = 'Customer Information';
        SellerCaptionLbl: TextConst ENU = 'Seller', ESM = 'Vendedor', FRC = 'Vendeur', ENC = 'Seller';
        ContactCaptionLbl: TextConst ENU = 'Contact', ESM = 'Contacto', FRC = 'Contact', ENC = 'Contact';
        DescriptionCaptionLbl: TextConst ENU = 'Description', ESM = 'Descripción', FRC = 'Description', ENC = 'Description';
        Due_DateCaptionLbl: TextConst ENU = 'Due Date', ESM = 'Fecha vencimiento', FRC = 'Date d''échéance', ENC = 'Due Date';
        Posting_DateCaptionLbl: TextConst ENU = 'Posting Date', ESM = 'Fecha registro', FRC = 'Date de report', ENC = 'Posting Date';
        Doc__DateCaptionLbl: TextConst ENU = 'Doc. Date', ESM = 'Fecha documento', FRC = 'Date doc.', ENC = 'Doc. Date';
        ShipmentCaptionLbl: TextConst ENU = 'Shipment', ESM = 'Envío', FRC = 'Livraison', ENC = 'Shipment';
        TermsCaptionLbl: TextConst ENU = 'Terms', ESM = 'Términos', FRC = 'Modalités', ENC = 'Terms';
        StatusCaptionLbl: TextConst ENU = 'Status', ESM = 'Estado', FRC = 'État', ENC = 'Status';
        External_Doc__No_CaptionLbl: TextConst ENU = 'External Doc. No.', ESM = 'Nº documento externo', FRC = 'N° de document externe', ENC = 'External Doc. No.';
        Sales_Document___TestCaption_Control1Lbl: TextConst ENU = 'Sales Document - Test', ESM = 'Documento ventas - Prueba', FRC = 'Document de vente - Test', ENC = 'Sales Document - Test';
        CurrReport_PAGENO_Control1029005CaptionLbl: TextConst ENU = 'Page', ESM = 'Pág.', FRC = 'Page', ENC = 'Page';
        Ship_toCaptionLbl: TextConst ENU = 'Ship-to', ESM = 'Dirección envío', FRC = 'Destinataire', ENC = 'Ship-to';
        Sell_toCaptionLbl: TextConst ENU = 'Sell-to', ESM = 'Dirección venta', FRC = 'Débiteur', ENC = 'Sell-to';
        Bill_toCaptionLbl: TextConst ENU = 'Bill-to', ESM = 'Dirección facturación', FRC = 'Facturation', ENC = 'Bill-to';
        Sales_Header___Posting_Date_CaptionLbl: TextConst ENU = 'Posting Date', ESM = 'Fecha registro', FRC = 'Date de report', ENC = 'Posting Date';
        Sales_Header___Document_Date_CaptionLbl: TextConst ENU = 'Document Date', ESM = 'Fecha emisión documento', FRC = 'Date de document', ENC = 'Document Date';
        Sales_Header___Due_Date_CaptionLbl: TextConst ENU = 'Due Date', ESM = 'Fecha vencimiento', FRC = 'Date d''échéance', ENC = 'Due Date';
        Sales_Header___Pmt__Discount_Date_CaptionLbl: TextConst ENU = 'Pmt. Discount Date', ESM = 'Fecha dto. P.P.', FRC = 'Date d''escompte de paiement', ENC = 'Pmt. Discount Date';
        Sales_Header___Posting_Date__Control105CaptionLbl: TextConst ENU = 'Posting Date', ESM = 'Fecha registro', FRC = 'Date de report', ENC = 'Posting Date';
        Sales_Header___Document_Date__Control106CaptionLbl: TextConst ENU = 'Document Date', ESM = 'Fecha emisión documento', FRC = 'Date de document', ENC = 'Document Date';
        Sales_Header___Order_Date_CaptionLbl: TextConst ENU = 'Order Date', ESM = 'Fecha pedido', FRC = 'Date commande', ENC = 'Order Date';
        Sales_Header___Shipment_Date_CaptionLbl: TextConst ENU = 'Shipment Date', ESM = 'Fecha envío', FRC = 'Date de livraison', ENC = 'Shipment Date';
        Sales_Header___Due_Date__Control19CaptionLbl: TextConst ENU = 'Due Date', ESM = 'Fecha vencimiento', FRC = 'Date d''échéance', ENC = 'Due Date';
        Sales_Header___Pmt__Discount_Date__Control22CaptionLbl: TextConst ENU = 'Pmt. Discount Date', ESM = 'Fecha dto. P.P.', FRC = 'Date d''escompte de paiement', ENC = 'Pmt. Discount Date';
        Sales_Header___Posting_Date__Control131CaptionLbl: TextConst ENU = 'Posting Date', ESM = 'Fecha registro', FRC = 'Date de report', ENC = 'Posting Date';
        Sales_Header___Document_Date__Control132CaptionLbl: TextConst ENU = 'Document Date', ESM = 'Fecha emisión documento', FRC = 'Date de document', ENC = 'Document Date';
        Sales_Header___Posting_Date__Control137CaptionLbl: TextConst ENU = 'Posting Date', ESM = 'Fecha registro', FRC = 'Date de report', ENC = 'Posting Date';
        Sales_Header___Document_Date__Control138CaptionLbl: TextConst ENU = 'Document Date', ESM = 'Fecha emisión documento', FRC = 'Date de document', ENC = 'Document Date';
        Header_DimensionsCaptionLbl: TextConst ENU = 'Header Dimensions', ESM = 'Dimensiones cabecera', FRC = 'Dimensions en-tête', ENC = 'Header Dimensions';
        ErrorText_Number_CaptionLbl: TextConst ENU = 'Warning!', ESM = 'Advertencia', FRC = 'Attention!', ENC = 'Warning!';
        Unit_PriceCaptionLbl: TextConst ENU = 'Unit Price', ESM = 'Precio unitario', FRC = 'Prix unitaire', ENC = 'Unit Price';
        Sales_Line___Line_Discount___CaptionLbl: TextConst ENU = 'Line Disc. %', ESM = '% descuento línea', FRC = '% escompte ligne', ENC = 'Line Disc. %';
        AmountCaptionLbl: TextConst ENU = 'Amount', ESM = 'Importe', FRC = 'Montant', ENC = 'Amount';
        TempSalesLine__Inv__Discount_Amount_CaptionLbl: TextConst ENU = 'Inv. Discount Amount', ESM = 'Importe dto. factura', FRC = 'Montant d''escompte sur facture', ENC = 'Inv. Discount Amount';
        SubtotalCaptionLbl: TextConst ENU = 'Subtotal', ESM = 'Subtotal', FRC = 'Sous-total', ENC = 'Subtotal';
        VATDiscountAmountCaptionLbl: TextConst ENU = 'Payment Discount on VAT', ESM = 'Descuento P.P. sobre IVA', FRC = 'Escompte de paiement sur TVA', ENC = 'Payment Discount on Tax';
        Line_DimensionsCaptionLbl: TextConst ENU = 'Line Dimensions', ESM = 'Dimensiones línea', FRC = 'Dimensions de la ligne', ENC = 'Line Dimensions';
        ErrorText_Number__Control97CaptionLbl: TextConst ENU = 'Warning!', ESM = 'Advertencia', FRC = 'Attention!', ENC = 'Warning!';
        VATAmountLine__VAT_Amount__Control150CaptionLbl: TextConst ENU = 'Tax Amount', ESM = 'Importe IVA', FRC = 'Montant de TVA', ENC = 'Tax Amount';
        VATAmountLine__VAT_Base__Control151CaptionLbl: TextConst ENU = 'Tax Base', ESM = 'Base IVA', FRC = 'Base de TVA', ENC = 'Tax Base';
        VATAmountLine__VAT___CaptionLbl: TextConst ENU = 'Tax %', ESM = '% IVA', FRC = '% TVA', ENC = 'Tax %';
        VAT_Amount_SpecificationCaptionLbl: TextConst ENU = 'Tax Amount Specification', ESM = 'Especificación importe IVA', FRC = 'Spécification du montant de TVA', ENC = 'Tax Amount Specification';
        VATAmountLine__VAT_Identifier_CaptionLbl: TextConst ENU = 'Tax Identifier', ESM = 'Identific. IVA', FRC = 'Identificateur de TVA', ENC = 'Tax Identifier';
        VATAmountLine__Invoice_Discount_Amount__Control173CaptionLbl: TextConst ENU = 'Invoice Discount Amount', ESM = 'Importe descuento factura', FRC = 'Montant d''escompte de la facture', ENC = 'Invoice Discount Amount';
        VATAmountLine__Inv__Disc__Base_Amount__Control171CaptionLbl: TextConst ENU = 'Inv. Disc. Base Amount', ESM = 'Base descuento factura', FRC = 'Montant de base d''escompte de facture', ENC = 'Inv. Disc. Base Amount';
        VATAmountLine__Line_Amount__Control169CaptionLbl: TextConst ENU = 'Line Amount', ESM = 'Importe línea', FRC = 'Montant de la ligne', ENC = 'Line Amount';
        ContinuedCaptionLbl: TextConst ENU = 'Continued', ESM = 'Continuación', FRC = 'Suite', ENC = 'Continued';
        ContinuedCaption_Control155Lbl: TextConst ENU = 'Continued', ESM = 'Continuación', FRC = 'Suite', ENC = 'Continued';
        TotalCaptionLbl: TextConst ENU = 'Total', ESM = 'Total', FRC = 'Total', ENC = 'Total';
        SalesTaxAmountLine__Tax_Area_Code_for_Key_CaptionLbl: TextConst ENU = 'Tax Area Code', ESM = 'Cód. área impuesto', FRC = 'Code de région fiscale', ENC = 'Tax Area Code';
        SalesTaxAmountLine__Tax_Base_Amount_CaptionLbl: TextConst ENU = 'Tax Base Amount', ESM = 'Imp. base impos.', FRC = 'Montant de base de la taxe', ENC = 'Tax Base Amount';
        SalesTaxAmountLine__Tax_Amount__Control1020000CaptionLbl: TextConst ENU = 'Tax Amount', ESM = 'Imp. impto.', FRC = 'Montant de la taxe', ENC = 'Tax Amount';
        SalesTaxAmountLine__Inv__Disc__Base_Amount_CaptionLbl: TextConst ENU = 'Inv. Disc. Base Amount', ESM = 'Base descuento factura', FRC = 'Montant de base d''escompte de facture', ENC = 'Inv. Disc. Base Amount';
        SalesTaxAmountLine__Invoice_Discount_Amount_CaptionLbl: TextConst ENU = 'Invoice Discount Amount', ESM = 'Importe descuento factura', FRC = 'Montant d''escompte de la facture', ENC = 'Invoice Discount Amount';
        SalesTaxAmountLine__Tax___CaptionLbl: TextConst ENU = 'Tax %', ESM = '% Impto.', FRC = '% taxe', ENC = 'Tax %';
        Sales_Tax_AmountsCaptionLbl: TextConst ENU = 'Sales Tax Amounts', ESM = 'Importes de impuestos ventas', FRC = 'Montants de taxe de vente', ENC = 'Sales Tax Amounts';
        ContinuedCaption_Control1020002Lbl: TextConst ENU = 'Continued', ESM = 'Continuación', FRC = 'Suite', ENC = 'Continued';
        ContinuedCaption_Control1020007Lbl: TextConst ENU = 'Continued', ESM = 'Continuación', FRC = 'Suite', ENC = 'Continued';
        TotalCaption_Control1020021Lbl: TextConst ENU = 'Total', ESM = 'Total', FRC = 'Total', ENC = 'Total';
        TotalCaption_Control1020012Lbl: TextConst ENU = 'Total', ESM = 'Total', FRC = 'Total', ENC = 'Total';
        Item_Charge_SpecificationCaptionLbl: TextConst ENU = 'Item Charge Specification', ESM = 'Especificación cargos producto', FRC = 'Détail frais annexes', ENC = 'Item Charge Specification';
        SalesLine2_DescriptionCaptionLbl: TextConst ENU = 'Description', ESM = 'Descripción', FRC = 'Description', ENC = 'Description';
        SalesLine2_QuantityCaptionLbl: TextConst ENU = 'Assignable Qty', ESM = 'Cantidad asignable', FRC = 'Qté affectable', ENC = 'Assignable Qty';
        ContinuedCaption_Control210Lbl: TextConst ENU = 'Continued', ESM = 'Continuación', FRC = 'Suite', ENC = 'Continued';
        TotalCaption_Control220Lbl: TextConst ENU = 'Total', ESM = 'Total', FRC = 'Total', ENC = 'Total';
        ContinuedCaption_Control223Lbl: TextConst ENU = 'Continued', ESM = 'Continuación', FRC = 'Suite', ENC = 'Continued';
        SalesTaxCalculationOverridden: Boolean;
        PrepaymentNo: Code[20];//Sbr-Jo
        PrepaymentTax: Decimal;
        PrepaymentTotalDue: Decimal;
        PrepaymentDue: Decimal;
        ExtensionFunctions: Codeunit ExtensionFunctions;//End Sbr-Jo

    local procedure AddError(Text: Text[250]);
    begin
        ErrorCounter := ErrorCounter + 1;
        ErrorText[ErrorCounter] := Text;
    end;

    local procedure CheckShptLines(SalesLine2: Record "Sales Line");
    var
        TempPostedDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        with SalesLine2 do begin
            if ABS(RemQtyToBeInvoiced) > ABS("Qty. to Ship") then begin
                SaleShptLine.RESET;
                case "Document Type" of
                    "Document Type"::Order:
                        begin
                            SaleShptLine.SETCURRENTKEY("Order No.", "Order Line No.");
                            SaleShptLine.SETRANGE("Order No.", "Document No.");
                            SaleShptLine.SETRANGE("Order Line No.", "Line No.");
                        end;
                    "Document Type"::Invoice:
                        begin
                            SaleShptLine.SETRANGE("Document No.", "Shipment No.");
                            SaleShptLine.SETRANGE("Line No.", "Shipment Line No.");
                        end;
                end;

                SaleShptLine.SETFILTER("Qty. Shipped Not Invoiced", '<>0');
                if SaleShptLine.FIND('-') then
                    repeat
                        DimMgt.GetDimensionSet(TempPostedDimSetEntry, SaleShptLine."Dimension Set ID");
                        if not DimMgt.CheckDimIDConsistency(
                             TempDimSetEntry, TempPostedDimSetEntry, DATABASE::"Sales Line", DATABASE::"Sales Shipment Line")
                        then
                            AddError(DimMgt.GetDocDimConsistencyErr);
                        if SaleShptLine."Sell-to Customer No." <> "Sell-to Customer No." then
                            AddError(
                              STRSUBSTNO(
                                Text024,
                                FIELDCAPTION("Sell-to Customer No.")));
                        if SaleShptLine.Type <> Type then
                            AddError(
                              STRSUBSTNO(
                                Text024,
                                FIELDCAPTION(Type)));
                        if SaleShptLine."No." <> "No." then
                            AddError(
                              STRSUBSTNO(
                                Text024,
                                FIELDCAPTION("No.")));
                        if SaleShptLine."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                            AddError(
                              STRSUBSTNO(
                                Text024,
                                FIELDCAPTION("Gen. Bus. Posting Group")));
                        if SaleShptLine."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" then
                            AddError(
                              STRSUBSTNO(
                                Text024,
                                FIELDCAPTION("Gen. Prod. Posting Group")));
                        if SaleShptLine."Location Code" <> "Location Code" then
                            AddError(
                              STRSUBSTNO(
                                Text024,
                                FIELDCAPTION("Location Code")));
                        if SaleShptLine."Job No." <> "Job No." then
                            AddError(
                              STRSUBSTNO(
                                Text024,
                                FIELDCAPTION("Job No.")));

                        if -SalesLine."Qty. to Invoice" * SaleShptLine.Quantity < 0 then
                            AddError(
                              STRSUBSTNO(
                                Text027, FIELDCAPTION("Qty. to Invoice")));

                        QtyToBeInvoiced := RemQtyToBeInvoiced - SalesLine."Qty. to Ship";
                        if ABS(QtyToBeInvoiced) > ABS(SaleShptLine.Quantity - SaleShptLine."Quantity Invoiced") then
                            QtyToBeInvoiced := -(SaleShptLine.Quantity - SaleShptLine."Quantity Invoiced");
                        RemQtyToBeInvoiced := RemQtyToBeInvoiced - QtyToBeInvoiced;
                        SaleShptLine."Quantity Invoiced" := SaleShptLine."Quantity Invoiced" - QtyToBeInvoiced;
                        SaleShptLine."Qty. Shipped Not Invoiced" :=
                          SaleShptLine.Quantity - SaleShptLine."Quantity Invoiced"
                    until (SaleShptLine.NEXT = 0) or (ABS(RemQtyToBeInvoiced) <= ABS("Qty. to Ship"))
                else
                    AddError(
                      STRSUBSTNO(
                        Text026,
                        "Shipment Line No.",
                        "Shipment No."));
            end;

            if ABS(RemQtyToBeInvoiced) > ABS("Qty. to Ship") then
                if "Document Type" = "Document Type"::Invoice then
                    AddError(
                      STRSUBSTNO(
                        Text036,
                        "Shipment No."));
        end;
    end;

    local procedure CheckRcptLines(SalesLine2: Record "Sales Line");
    var
        TempPostedDimSetEntry: Record "Dimension Set Entry" temporary;
    begin
        with SalesLine2 do begin
            if ABS(RemQtyToBeInvoiced) > ABS("Return Qty. to Receive") then begin
                ReturnRcptLine.RESET;
                case "Document Type" of
                    "Document Type"::"Return Order":
                        begin
                            ReturnRcptLine.SETCURRENTKEY("Return Order No.", "Return Order Line No.");
                            ReturnRcptLine.SETRANGE("Return Order No.", "Document No.");
                            ReturnRcptLine.SETRANGE("Return Order Line No.", "Line No.");
                        end;
                    "Document Type"::"Credit Memo":
                        begin
                            ReturnRcptLine.SETRANGE("Document No.", "Return Receipt No.");
                            ReturnRcptLine.SETRANGE("Line No.", "Return Receipt Line No.");
                        end;
                end;

                ReturnRcptLine.SETFILTER("Return Qty. Rcd. Not Invd.", '<>0');
                if ReturnRcptLine.FIND('-') then
                    repeat
                        DimMgt.GetDimensionSet(TempPostedDimSetEntry, ReturnRcptLine."Dimension Set ID");
                        if not DimMgt.CheckDimIDConsistency(
                             TempDimSetEntry, TempPostedDimSetEntry, DATABASE::"Sales Line", DATABASE::"Return Receipt Line")
                        then
                            AddError(DimMgt.GetDocDimConsistencyErr);
                        if ReturnRcptLine."Sell-to Customer No." <> "Sell-to Customer No." then
                            AddError(
                              STRSUBSTNO(
                                Text038,
                                FIELDCAPTION("Sell-to Customer No.")));
                        if ReturnRcptLine.Type <> Type then
                            AddError(
                              STRSUBSTNO(
                                Text038,
                                FIELDCAPTION(Type)));
                        if ReturnRcptLine."No." <> "No." then
                            AddError(
                              STRSUBSTNO(
                                Text038,
                                FIELDCAPTION("No.")));
                        if ReturnRcptLine."Gen. Bus. Posting Group" <> "Gen. Bus. Posting Group" then
                            AddError(
                              STRSUBSTNO(
                                Text038,
                                FIELDCAPTION("Gen. Bus. Posting Group")));
                        if ReturnRcptLine."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" then
                            AddError(
                              STRSUBSTNO(
                                Text038,
                                FIELDCAPTION("Gen. Prod. Posting Group")));
                        if ReturnRcptLine."Location Code" <> "Location Code" then
                            AddError(
                              STRSUBSTNO(
                                Text038,
                                FIELDCAPTION("Location Code")));
                        if ReturnRcptLine."Job No." <> "Job No." then
                            AddError(
                              STRSUBSTNO(
                                Text038,
                                FIELDCAPTION("Job No.")));

                        if SalesLine."Qty. to Invoice" * ReturnRcptLine.Quantity < 0 then
                            AddError(
                              STRSUBSTNO(
                                Text039, FIELDCAPTION("Qty. to Invoice")));
                        QtyToBeInvoiced := RemQtyToBeInvoiced - SalesLine."Return Qty. to Receive";
                        if ABS(QtyToBeInvoiced) > ABS(ReturnRcptLine.Quantity - ReturnRcptLine."Quantity Invoiced") then
                            QtyToBeInvoiced := ReturnRcptLine.Quantity - ReturnRcptLine."Quantity Invoiced";
                        RemQtyToBeInvoiced := RemQtyToBeInvoiced - QtyToBeInvoiced;
                        ReturnRcptLine."Quantity Invoiced" := ReturnRcptLine."Quantity Invoiced" + QtyToBeInvoiced;
                        ReturnRcptLine."Return Qty. Rcd. Not Invd." :=
                          ReturnRcptLine.Quantity - ReturnRcptLine."Quantity Invoiced";
                    until (ReturnRcptLine.NEXT = 0) or (ABS(RemQtyToBeInvoiced) <= ABS("Return Qty. to Receive"))
                else
                    AddError(
                      STRSUBSTNO(
                        Text025,
                        "Return Receipt Line No.",
                        "Return Receipt No."));
            end;

            if ABS(RemQtyToBeInvoiced) > ABS("Return Qty. to Receive") then
                if "Document Type" = "Document Type"::"Credit Memo" then
                    AddError(
                      STRSUBSTNO(
                        Text037,
                        "Return Receipt No."));
        end;
    end;

    local procedure IsInvtPosting(): Boolean;
    var
        SalesLine: Record "Sales Line";
    begin
        with "Sales Header" do begin
            SalesLine.SETRANGE("Document Type", "Document Type");
            SalesLine.SETRANGE("Document No.", "No.");
            SalesLine.SETFILTER(Type, '%1|%2', SalesLine.Type::Item, SalesLine.Type::"Charge (Item)");
            if SalesLine.ISEMPTY then
                exit(false);
            if Ship then begin
                SalesLine.SETFILTER("Qty. to Ship", '<>%1', 0);
                if not SalesLine.ISEMPTY then
                    exit(true);
            end;
            if Receive then begin
                SalesLine.SETFILTER("Return Qty. to Receive", '<>%1', 0);
                if not SalesLine.ISEMPTY then
                    exit(true);
            end;
            if Invoice then begin
                SalesLine.SETFILTER("Qty. to Invoice", '<>%1', 0);
                if not SalesLine.ISEMPTY then
                    exit(true);
            end;
        end;
    end;

    [Scope('Personalization')]
    procedure AddDimToTempLine(SalesLine: Record "Sales Line"; var TempDimSetEntry: Record "Dimension Set Entry");
    var
        SourceCodeSetup: Record "Source Code Setup";
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        SourceCodeSetup.GET;

        with SalesLine do begin
            TableID[1] := DimMgt.TypeToTableID3(Type);
            No[1] := "No.";
            TableID[2] := DATABASE::Job;
            No[2] := "Job No.";
            TableID[3] := DATABASE::"Responsibility Center";
            No[3] := "Responsibility Center";

            "Shortcut Dimension 1 Code" := '';
            "Shortcut Dimension 2 Code" := '';
            "Dimension Set ID" :=
              DimMgt.GetDefaultDimID(TableID, No, SourceCodeSetup.Sales, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code",
                "Dimension Set ID", DATABASE::Customer);
        end;
    end;

    [Scope('Personalization')]
    procedure CheckSummarize();
    begin
        //if Summarize then //SBr-Jo Removed to make compile.
        //CurrReport.Showoutput(false)
    end;

    [Scope('Personalization')]
    procedure InitializeRequest(NewShipReceiveOnNextPostReq: Boolean; NewInvOnNextPostReq: Boolean; NewShowDim: Boolean; NewShowCostAssignment: Boolean; NewSummarize: Boolean);
    begin
        ShipReceiveOnNextPostReq := NewShipReceiveOnNextPostReq;
        InvOnNextPostReq := NewInvOnNextPostReq;
        ShowDim := NewShowDim;
        ShowCostAssignment := NewShowCostAssignment;
        Summarize := NewSummarize;
    end;

    [IntegrationEvent(false, false)]
    [Scope('Personalization')]
    local procedure OnBeforeCalculateSalesTax(var SalesHeaderParm: Record "Sales Header"; var SalesTaxAmountLineParm: Record "Sales Tax Amount Line"; var SalesTaxCalculationOverridden: Boolean);
    begin
    end;

    local procedure CheckType(SalesLine2: Record "Sales Line");
    begin
        with SalesLine2 do
            case Type of
                Type::"G/L Account":
                    begin
                        if ("No." = '') and (Amount = 0) then
                            exit;

                        if "No." <> '' then
                            if GLAcc.GET("No.") then begin
                                if GLAcc.Blocked then
                                    AddError(
                                      STRSUBSTNO(
                                        Text007,
                                        GLAcc.FIELDCAPTION(Blocked), false, GLAcc.TABLECAPTION, "No."));
                                if not GLAcc."Direct Posting" and ("Line No." <= OrigMaxLineNo) then
                                    AddError(
                                      STRSUBSTNO(
                                        Text007,
                                        GLAcc.FIELDCAPTION("Direct Posting"), true, GLAcc.TABLECAPTION, "No."));
                            end else
                                AddError(
                                  STRSUBSTNO(
                                    Text008,
                                    GLAcc.TABLECAPTION, "No."));
                    end;
                Type::Item:
                    begin
                        if ("No." = '') and (Quantity = 0) then
                            exit;

                        if "No." <> '' then
                            if Item.GET("No.") then begin
                                if Item.Blocked then
                                    AddError(
                                      STRSUBSTNO(
                                        Text007,
                                        Item.FIELDCAPTION(Blocked), false, Item.TABLECAPTION, "No."));
                                if Item.Reserve = Item.Reserve::Always then begin
                                    CALCFIELDS("Reserved Quantity");
                                    if "Document Type" in ["Document Type"::"Return Order", "Document Type"::"Credit Memo"] then begin
                                        if (SignedXX(Quantity) < 0) and (ABS("Reserved Quantity") < ABS("Return Qty. to Receive")) then
                                            AddError(
                                              STRSUBSTNO(
                                                Text015,
                                                FIELDCAPTION("Reserved Quantity"), SignedXX("Return Qty. to Receive")));
                                    end else
                                        if (SignedXX(Quantity) < 0) and (ABS("Reserved Quantity") < ABS("Qty. to Ship")) then
                                            AddError(
                                              STRSUBSTNO(
                                                Text015,
                                                FIELDCAPTION("Reserved Quantity"), SignedXX("Qty. to Ship")));
                                end
                            end else
                                AddError(
                                  STRSUBSTNO(
                                    Text008,
                                    Item.TABLECAPTION, "No."));
                    end;
                Type::Resource:
                    begin
                        if ("No." = '') and (Quantity = 0) then
                            exit;

                        if Res.GET("No.") then begin
                            if Res."Privacy Blocked" then
                                AddError(
                                  STRSUBSTNO(
                                    Text007,
                                    Res.FIELDCAPTION("Privacy Blocked"), false, Res.TABLECAPTION, "No."));
                            if Res.Blocked then
                                AddError(
                                  STRSUBSTNO(
                                    Text007,
                                    Res.FIELDCAPTION(Blocked), false, Res.TABLECAPTION, "No."));
                        end else
                            AddError(
                              STRSUBSTNO(
                                Text008,
                                Res.TABLECAPTION, "No."));
                    end;
                Type::"Fixed Asset":
                    begin
                        if ("No." = '') and (Quantity = 0) then
                            exit;
                        if "No." <> '' then
                            if FA.GET("No.") then begin
                                if FA.Blocked then
                                    AddError(
                                      STRSUBSTNO(
                                        Text007,
                                        FA.FIELDCAPTION(Blocked), false, FA.TABLECAPTION, "No."));
                                if FA.Inactive then
                                    AddError(
                                      STRSUBSTNO(
                                        Text007,
                                        FA.FIELDCAPTION(Inactive), false, FA.TABLECAPTION, "No."));
                                if "Depreciation Book Code" = '' then
                                    AddError(STRSUBSTNO(Text006, FIELDCAPTION("Depreciation Book Code")))
                                else
                                    if not FADeprBook.GET("No.", "Depreciation Book Code") then
                                        AddError(
                                          STRSUBSTNO(
                                            Text017,
                                            FADeprBook.TABLECAPTION, "No.", "Depreciation Book Code"));
                            end else
                                AddError(
                                  STRSUBSTNO(
                                    Text008,
                                    FA.TABLECAPTION, "No."));
                    end;
            end;
    end;

    local procedure VerifySellToCust(SalesHeader: Record "Sales Header");
    var
        ShipQtyExist: Boolean;
    begin
        with SalesHeader do begin
            if "Sell-to Customer No." = '' then
                AddError(STRSUBSTNO(Text006, FIELDCAPTION("Sell-to Customer No.")))
            else
                if Cust.GET("Sell-to Customer No.") then begin
                    if (Cust.Blocked = Cust.Blocked::Ship) and Ship then begin
                        SalesLine2.SETRANGE("Document Type", "Document Type");
                        SalesLine2.SETRANGE("Document No.", "No.");
                        SalesLine2.SETFILTER("Qty. to Ship", '>0');
                        if SalesLine2.FINDFIRST then
                            ShipQtyExist := true;
                    end;
                    if Cust."Privacy Blocked" then
                        AddError(Cust.GetPrivacyBlockedGenericErrorText(Cust));
                    if (Cust.Blocked = Cust.Blocked::All) or
                       ((Cust.Blocked = Cust.Blocked::Invoice) and
                        (not ("Document Type" in
                              ["Document Type"::"Credit Memo", "Document Type"::"Return Order"]))) or
                       ShipQtyExist
                    then
                        AddError(
                          STRSUBSTNO(
                            Text045,
                            Cust.FIELDCAPTION(Blocked), Cust.Blocked, Cust.TABLECAPTION, "Sell-to Customer No."))
                end else
                    AddError(
                      STRSUBSTNO(
                        Text008,
                        Cust.TABLECAPTION, "Sell-to Customer No."));
        end;
    end;

    local procedure VerifyBillToCust(SalesHeader: Record "Sales Header");
    begin
        with SalesHeader do
            if "Bill-to Customer No." = '' then
                AddError(STRSUBSTNO(Text006, FIELDCAPTION("Bill-to Customer No.")))
            else begin
                if "Bill-to Customer No." <> "Sell-to Customer No." then
                    if Cust.GET("Bill-to Customer No.") then begin
                        if Cust."Privacy Blocked" then
                            AddError(Cust.GetPrivacyBlockedGenericErrorText(Cust));
                        if (Cust.Blocked = Cust.Blocked::All) or
                           ((Cust.Blocked = Cust.Blocked::Invoice) and
                            ("Document Type" in
                             ["Document Type"::"Credit Memo", "Document Type"::"Return Order"]))
                        then
                            AddError(
                              STRSUBSTNO(
                                Text045,
                                Cust.FIELDCAPTION(Blocked), false, Cust.TABLECAPTION, "Bill-to Customer No."));
                    end else
                        AddError(
                          STRSUBSTNO(
                            Text008,
                            Cust.TABLECAPTION, "Bill-to Customer No."));
            end;
    end;

    local procedure VerifyPostingDate(SalesHeader: Record "Sales Header");
    var
        InvtPeriodEndDate: Date;
    begin
        with SalesHeader do
            if "Posting Date" = 0D then
                AddError(STRSUBSTNO(Text006, FIELDCAPTION("Posting Date")))
            else
                if "Posting Date" <> NORMALDATE("Posting Date") then
                    AddError(STRSUBSTNO(Text009, FIELDCAPTION("Posting Date")))
                else begin
                    if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                        if USERID <> '' then
                            if UserSetup.GET(USERID) then begin
                                AllowPostingFrom := UserSetup."Allow Posting From";
                                AllowPostingTo := UserSetup."Allow Posting To";
                            end;
                        if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                            AllowPostingFrom := GLSetup."Allow Posting From";
                            AllowPostingTo := GLSetup."Allow Posting To";
                        end;
                        if AllowPostingTo = 0D then
                            AllowPostingTo := DMY2DATE(31, 12, 9999);
                    end;
                    if ("Posting Date" < AllowPostingFrom) or ("Posting Date" > AllowPostingTo) then
                        AddError(
                          STRSUBSTNO(
                            Text010, FIELDCAPTION("Posting Date")))
                    else
                        if IsInvtPosting then begin
                            InvtPeriodEndDate := "Posting Date";
                            if not InvtPeriod.IsValidDate(InvtPeriodEndDate) then
                                AddError(
                                  STRSUBSTNO(Text010, FORMAT("Posting Date")))
                        end;
                end;
    end;
}

