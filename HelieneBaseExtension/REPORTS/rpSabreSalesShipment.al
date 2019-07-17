report 50106 "SBR Sales Shipment"
{
    // version NAVNA11.00

    DefaultLayout = RDLC;
    RDLCLayout = './REPORTS/SBR Sales Shipment.rdlc';
    CaptionML = ENU = 'Sales Shipment',
                ESM = 'Remisión de venta',
                FRC = 'Livraison de vente',
                ENC = 'Sales Shipment';

    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = SORTING ("No.");
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", "Sell-to Customer No.", "Bill-to Customer No.", "Ship-to Code", "No. Printed";
            RequestFilterHeadingML = ENU = 'Sales Shipment',
                                     ESM = 'Remisión de venta',
                                     FRC = 'Livraison de vente',
                                     ENC = 'Sales Shipment';
            column(No_SalesShptHeader; "No.")
            {
            }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = FIELD ("No.");
                DataItemTableView = SORTING ("Document No.", "Line No.");
                dataitem(SalesLineComments; "Sales Comment Line")
                {
                    DataItemLink = "No." = FIELD ("Document No."), "Document Line No." = FIELD ("Line No.");
                    DataItemTableView = SORTING ("Document Type", "No.", "Document Line No.", "Line No.") WHERE ("Document Type" = CONST (Shipment), "Print On Shipment" = CONST (true));

                    trigger OnAfterGetRecord();
                    begin
                        InsertTempLine(Comment, 10);
                    end;
                }

                trigger OnAfterGetRecord();
                begin
                    TempSalesShipmentLine := "Sales Shipment Line";
                    TempSalesShipmentLine.INSERT;
                    TempSalesShipmentLineAsm := "Sales Shipment Line";
                    TempSalesShipmentLineAsm.INSERT;
                    HighestLineNo := "Line No.";
                end;

                trigger OnPreDataItem();
                begin
                    TempSalesShipmentLine.RESET;
                    TempSalesShipmentLine.DELETEALL;
                    TempSalesShipmentLineAsm.RESET;
                    TempSalesShipmentLineAsm.DELETEALL;
                end;
            }
            dataitem("Sales Comment Line"; "Sales Comment Line")
            {
                DataItemLink = "No." = FIELD ("No.");
                DataItemTableView = SORTING ("Document Type", "No.", "Document Line No.", "Line No.") WHERE ("Document Type" = CONST (Shipment), "Print On Shipment" = CONST (true), "Document Line No." = CONST (0));

                trigger OnAfterGetRecord();
                begin
                    InsertTempLine(Comment, 1000);
                end;

                trigger OnPreDataItem();
                begin
                    with TempSalesShipmentLine do begin
                        INIT;
                        "Document No." := "Sales Shipment Header"."No.";
                        "Line No." := HighestLineNo + 1000;
                        HighestLineNo := "Line No.";
                    end;
                    TempSalesShipmentLine.INSERT;
                end;
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING (Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                    column(CompanyInfo2Picture; CompanyInfo2.Picture)
                    {
                    }
                    column(CompanyInfo1Picture; CompanyInfo1.Picture)
                    {
                    }
                    column(CompanyInfoPicture; CompanyInfo3.Picture)
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
                    column(CopyTxt; CopyTxt)
                    {
                    }
                    column(BillToAddress1; BillToAddress[1])
                    {
                    }
                    column(BillToAddress2; BillToAddress[2])
                    {
                    }
                    column(BillToAddress3; BillToAddress[3])
                    {
                    }
                    column(BillToAddress4; BillToAddress[4])
                    {
                    }
                    column(BillToAddress5; BillToAddress[5])
                    {
                    }
                    column(BillToAddress6; BillToAddress[6])
                    {
                    }
                    column(BillToAddress7; BillToAddress[7])
                    {
                    }
                    column(ShipToAddress1; ShipToAddress[1])
                    {
                    }
                    column(ShipToAddress2; ShipToAddress[2])
                    {
                    }
                    column(ShipToAddress3; ShipToAddress[3])
                    {
                    }
                    column(ShipToAddress4; ShipToAddress[4])
                    {
                    }
                    column(ShipToAddress5; ShipToAddress[5])
                    {
                    }
                    column(ShipToAddress6; ShipToAddress[6])
                    {
                    }
                    column(ShipToAddress7; ShipToAddress[7])
                    {
                    }
                    column(BilltoCustNo_SalesShptHeader; "Sales Shipment Header"."Bill-to Customer No.")
                    {
                    }
                    column(ExtDocNo_SalesShptHeader; "Sales Shipment Header"."External Document No.")
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(ShptDate_SalesShptHeader; "Sales Shipment Header"."Shipment Date")
                    {
                    }
                    column(FormattedShptDate_SalesShptHeader; Format(Date2DMY("Sales Shipment Header"."Shipment Date", 2)) + '/' + Format(Date2DMY("Sales Shipment Header"."Shipment Date", 1)) + '/' + Format(Date2DMY("Sales Shipment Header"."Shipment Date", 3))) { }//Sbr-Jo 3928
                    column(CompanyAddress7; CompanyAddress[7])
                    {
                    }
                    column(CompanyAddress8; CompanyAddress[8])
                    {
                    }
                    column(BillToAddress8; BillToAddress[8])
                    {
                    }
                    column(ShipToAddress8; ShipToAddress[8])
                    {
                    }
                    column(ShipmentMethodDesc; ShipmentMethod.Description)
                    {
                    }
                    column(OrderDate_SalesShptHeader; "Sales Shipment Header"."Order Date")
                    {
                    }
                    column(FormattedOrderDate_SalesShptHeader; Format(Date2DMY("Sales Shipment Header"."Order Date", 2)) + '/' + Format(Date2DMY("Sales Shipment Header"."Order Date", 1)) + '/' + Format(Date2DMY("Sales Shipment Header"."Order Date", 3))) { }//Sbr-Jo 3928
                    column(OrderNo_SalesShptHeader; "Sales Shipment Header"."Order No.")
                    {
                    }
                    column(PackageTrackingNoText; PackageTrackingNoText)
                    {
                    }
                    column(ShippingAgentCodeText; ShippingAgentCodeText)
                    {
                    }
                    column(ShippingAgentCodeLabel; ShippingAgentCodeLabel)
                    {
                    }
                    column(PackageTrackingNoLabel; PackageTrackingNoLabel)
                    {
                    }
                    column(TaxRegNo; TaxRegNo)
                    {
                    }
                    column(TaxRegLabel; TaxRegLabel)
                    {
                    }
                    column(CopyNo; CopyNo)
                    {
                    }
                    column(PageLoopNumber; Number)
                    {
                    }
                    column(BillCaption; BillCaptionLbl)
                    {
                    }
                    column(ToCaption; ToCaptionLbl)
                    {
                    }
                    column(CustomerIDCaption; CustomerIDCaptionLbl)
                    {
                    }
                    column(PONumberCaption; PONumberCaptionLbl)
                    {
                    }
                    column(SalesPersonCaption; SalesPersonCaptionLbl)
                    {
                    }
                    column(ShipCaption; ShipCaptionLbl)
                    {
                    }
                    column(ShipmentCaption; ShipmentCaptionLbl)
                    {
                    }
                    column(ShipmentNumberCaption; ShipmentNumberCaptionLbl)
                    {
                    }
                    column(ShipmentDateCaption; ShipmentDateCaptionLbl)
                    {
                    }
                    column(PageCaption; PageCaptionLbl)
                    {
                    }
                    column(ShipViaCaption; ShipViaCaptionLbl)
                    {
                    }
                    column(PODateCaption; PODateCaptionLbl)
                    {
                    }
                    column(OurOrderNoCaption; OurOrderNoCaptionLbl)
                    {
                    }
                    dataitem(SalesShptLine; "Integer")
                    {
                        DataItemTableView = SORTING (Number);
                        column(SalesShptLineNumber; Number)
                        {
                        }
                        column(TempSalesShptLineNo; TempSalesShipmentLine."No.")
                        {
                        }
                        column(TempSalesShptLineUOM; TempSalesShipmentLine."Unit of Measure")
                        {
                        }
                        column(TempSalesShptLineQy; TempSalesShipmentLine.Quantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(OrderedQuantity; OrderedQuantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(BackOrderedQuantity; BackOrderedQuantity)
                        {
                            DecimalPlaces = 0 : 5;
                        }
                        column(TempSalesShptLineDesc; TempSalesShipmentLine.Description + ' ' + TempSalesShipmentLine."Description 2")
                        {
                        }
                        column(PackageTrackingText; PackageTrackingText)
                        {
                        }
                        column(AsmHeaderExists; AsmHeaderExists)
                        {
                        }
                        column(PrintFooter; PrintFooter)
                        {
                        }
                        column(ItemNoCaption; ItemNoCaptionLbl)
                        {
                        }
                        column(UnitCaption; UnitCaptionLbl)
                        {
                        }
                        column(DescriptionCaption; DescriptionCaptionLbl)
                        {
                        }
                        column(ShippedCaption; ShippedCaptionLbl)
                        {
                        }
                        column(OrderedCaption; OrderedCaptionLbl)
                        {
                        }
                        column(BackOrderedCaption; BackOrderedCaptionLbl)
                        {
                        }
                        column(TruckNo; TempSalesShipmentLine."Truck No.") { }//SBR-Jo
                        dataitem(AsmLoop; "Integer")
                        {
                            DataItemTableView = SORTING (Number);
                            column(PostedAsmLineItemNo; BlanksForIndent + PostedAsmLine."No.")
                            {
                            }
                            column(PostedAsmLineDescription; BlanksForIndent + PostedAsmLine.Description)
                            {
                            }
                            column(PostedAsmLineQuantity; PostedAsmLine.Quantity)
                            {
                                DecimalPlaces = 0 : 5;
                            }
                            column(PostedAsmLineUOMCode; GetUnitOfMeasureDescr(PostedAsmLine."Unit of Measure Code"))
                            {
                            }

                            trigger OnAfterGetRecord();
                            begin
                                if Number = 1 then
                                    PostedAsmLine.FINDSET
                                else
                                    PostedAsmLine.NEXT;
                            end;

                            trigger OnPreDataItem();
                            begin
                                if not DisplayAssemblyInformation then
                                    CurrReport.BREAK;
                                if not AsmHeaderExists then
                                    CurrReport.BREAK;
                                PostedAsmLine.SETRANGE("Document No.", PostedAsmHeader."No.");
                                SETRANGE(Number, 1, PostedAsmLine.COUNT);
                            end;
                        }

                        trigger OnAfterGetRecord();
                        var
                            SalesShipmentLine: Record "Sales Shipment Line";
                        begin
                            OnLineNumber := OnLineNumber + 1;

                            with TempSalesShipmentLine do begin
                                if OnLineNumber = 1 then
                                    FIND('-')
                                else
                                    NEXT;

                                OrderedQuantity := 0;
                                BackOrderedQuantity := 0;
                                if "Order No." = '' then
                                    OrderedQuantity := Quantity
                                else
                                    if OrderLine.GET(1, "Order No.", "Order Line No.") then begin
                                        OrderedQuantity := OrderLine.Quantity;
                                        BackOrderedQuantity := OrderLine."Outstanding Quantity";
                                    end else begin
                                        ReceiptLine.SETCURRENTKEY("Order No.", "Order Line No.");
                                        ReceiptLine.SETRANGE("Order No.", "Order No.");
                                        ReceiptLine.SETRANGE("Order Line No.", "Order Line No.");
                                        ReceiptLine.FIND('-');
                                        repeat
                                            OrderedQuantity := OrderedQuantity + ReceiptLine.Quantity;
                                        until 0 = ReceiptLine.NEXT;
                                    end;

                                if Type = 0 then begin
                                    OrderedQuantity := 0;
                                    BackOrderedQuantity := 0;
                                    "No." := '';
                                    "Unit of Measure" := '';
                                    Quantity := 0;
                                end else
                                    if Type = Type::"G/L Account" then
                                        "No." := '';

                                PackageTrackingText := '';
                                if ("Package Tracking No." <> "Sales Shipment Header"."Package Tracking No.") and
                                   ("Package Tracking No." <> '') and PrintPackageTrackingNos
                                then
                                    PackageTrackingText := Text002 + ' ' + "Package Tracking No.";

                                if DisplayAssemblyInformation then
                                    if TempSalesShipmentLineAsm.GET("Document No.", "Line No.") then begin
                                        SalesShipmentLine.GET("Document No.", "Line No.");
                                        AsmHeaderExists := SalesShipmentLine.AsmToShipmentExists(PostedAsmHeader);
                                    end;
                            end;

                            if OnLineNumber = NumberOfLines then
                                PrintFooter := true;
                        end;

                        trigger OnPreDataItem();
                        begin
                            NumberOfLines := TempSalesShipmentLine.COUNT;
                            SETRANGE(Number, 1, NumberOfLines);
                            OnLineNumber := 0;
                            PrintFooter := false;
                        end;
                    }
                }

                trigger OnAfterGetRecord();
                begin
                    CurrReport.PAGENO := 1;
                    if CopyNo = NoLoops then begin
                        if not CurrReport.PREVIEW then
                            SalesShipmentPrinted.RUN("Sales Shipment Header");
                        CurrReport.BREAK;
                    end;
                    CopyNo := CopyNo + 1;
                    if CopyNo = 1 then // Original
                        CLEAR(CopyTxt)
                    else
                        CopyTxt := Text000;
                end;

                trigger OnPreDataItem();
                begin
                    NoLoops := 1 + ABS(NoCopies);
                    if NoLoops <= 0 then
                        NoLoops := 1;
                    CopyNo := 0;
                end;
            }

            trigger OnAfterGetRecord();
            begin
                if PrintCompany then
                    if RespCenter.GET("Responsibility Center") then begin
                        FormatAddress.RespCenter(CompanyAddress, RespCenter);
                        CompanyInformation."Phone No." := RespCenter."Phone No.";
                        CompanyInformation."Fax No." := RespCenter."Fax No.";
                    end;
                CurrReport.LANGUAGE := Language.GetLanguageID("Language Code");

                if "Salesperson Code" = '' then
                    CLEAR(SalesPurchPerson)
                else
                    SalesPurchPerson.GET("Salesperson Code");

                if "Shipment Method Code" = '' then
                    CLEAR(ShipmentMethod)
                else
                    ShipmentMethod.GET("Shipment Method Code");

                if "Sell-to Customer No." = '' then begin
                    "Bill-to Name" := Text009;
                    "Ship-to Name" := Text009;
                end;
                if not Cust.GET("Sell-to Customer No.") then
                    CLEAR(Cust);

                FormatAddress.SalesShptBillTo(BillToAddress, BillToAddress, "Sales Shipment Header");
                FormatAddress.SalesShptShipTo(ShipToAddress, "Sales Shipment Header");

                ShippingAgentCodeLabel := '';
                ShippingAgentCodeText := '';
                PackageTrackingNoLabel := '';
                PackageTrackingNoText := '';
                if PrintPackageTrackingNos then begin
                    ShippingAgentCodeLabel := Text003;
                    ShippingAgentCodeText := "Sales Shipment Header"."Shipping Agent Code";
                    PackageTrackingNoLabel := Text001;
                    PackageTrackingNoText := "Sales Shipment Header"."Package Tracking No.";
                end;
                if LogInteraction then
                    if not CurrReport.PREVIEW then
                        SegManagement.LogDocument(
                          5, "No.", 0, 0, DATABASE::Customer, "Sell-to Customer No.",
                          "Salesperson Code", "Campaign No.", "Posting Description", '');
                TaxRegNo := '';
                TaxRegLabel := '';
                if "Tax Area Code" <> '' then begin
                    TaxArea.GET("Tax Area Code");
                    case TaxArea."Country/Region" of
                        TaxArea."Country/Region"::US:
                            ;
                        TaxArea."Country/Region"::CA:
                            begin
                                TaxRegNo := CompanyInformation."VAT Registration No.";
                                TaxRegLabel := CompanyInformation.FIELDCAPTION("VAT Registration No.");
                            end;
                    end;
                end;
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
                    field(NoCopies; NoCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionML = ENU = 'Number of Copies',
                                    ESM = 'Número de copias',
                                    FRC = 'Nombre de copies',
                                    ENC = 'Number of Copies';
                        ToolTipML = ENU = 'Specifies the number of copies of each document (in addition to the original) that you want to print.',
                                    ESM = 'Especifica el número de copias de cada documento (además del original) que desea imprimir.',
                                    FRC = 'Spécifie le nombre de copies de chaque document (en plus de l''original) que vous souhaitez imprimer.',
                                    ENC = 'Specifies the number of copies of each document (in addition to the original) that you want to print.';
                    }
                    field(PrintCompanyAddress; PrintCompany)
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionML = ENU = 'Print Company Address',
                                    ESM = 'Imprimir dir. empresa',
                                    FRC = 'Imprimer l''adresse de la compagnie',
                                    ENC = 'Print Company Address';
                        ToolTipML = ENU = 'Specifies if your company address is printed at the top of the sheet, because you do not use pre-printed paper. Leave this check box blank to omit your company''s address.',
                                    ESM = 'Especifica si en la parte superior de la hoja se debe imprimir la dirección de la empresa porque no usa papel preimpreso. Deje la casilla en blanco para omitir la dirección de la empresa.',
                                    FRC = 'Spécifie si l''adresse de votre compagnie est imprimée en haut de la feuille, car vous n''utilisez pas de papier préimprimé. Décochez cette case pour ne pas imprimer l''adresse de votre compagnie.',
                                    ENC = 'Specifies if your company address is printed at the top of the sheet, because you do not use pre-printed paper. Leave this check box blank to omit your company''s address.';
                    }
                    field(PrintPackageTrackingNos; PrintPackageTrackingNos)
                    {
                        ApplicationArea = Basic, Suite;
                        CaptionML = ENU = 'Print Package Tracking Nos.',
                                    ESM = 'Impr. nros. seguimiento bulto',
                                    FRC = 'Imprimer n° de traçabilité',
                                    ENC = 'Print Package Tracking Nos.';
                        ToolTipML = ENU = 'Specifies if you want the individual package tracking numbers to be printed on each line.',
                                    ESM = 'Especifica si desea que los números de seguimiento de bulto individuales se impriman en cada línea.',
                                    FRC = 'Spécifie si vous souhaitez que les numéros de traçabilité individuels soient imprimés sur chaque ligne.',
                                    ENC = 'Specifies if you want the individual package tracking numbers to be printed on each line.';
                    }
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
                    field(DisplayAsmInfo; DisplayAssemblyInformation)
                    {
                        ApplicationArea = Assembly;
                        CaptionML = ENU = 'Show Assembly Components',
                                    ESM = 'Mostrar componentes del ensamblado',
                                    FRC = 'Afficher les composantes d''assemblage',
                                    ENC = 'Show Assembly Components';
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
        CompanyInfo.GET;
        SalesSetup.GET;

        case SalesSetup."Logo Position on Documents" of
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                begin
                    CompanyInfo3.GET;
                    CompanyInfo3.CALCFIELDS(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo1.GET;
                    CompanyInfo1.CALCFIELDS(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo2.GET;
                    CompanyInfo2.CALCFIELDS(Picture);
                end;
        end;
    end;

    trigger OnPreReport();
    begin
        if not CurrReport.USEREQUESTPAGE then
            InitLogInteraction;

        CompanyInformation.GET;
        SalesSetup.GET;

        case SalesSetup."Logo Position on Documents" of
            SalesSetup."Logo Position on Documents"::"No Logo":
                ;
            SalesSetup."Logo Position on Documents"::Left:
                CompanyInformation.CALCFIELDS(Picture);
            SalesSetup."Logo Position on Documents"::Center:
                begin
                    CompanyInfo1.GET;
                    CompanyInfo1.CALCFIELDS(Picture);
                end;
            SalesSetup."Logo Position on Documents"::Right:
                begin
                    CompanyInfo2.GET;
                    CompanyInfo2.CALCFIELDS(Picture);
                end;
        end;

        if PrintCompany then
            FormatAddress.Company(CompanyAddress, CompanyInformation)
        else
            CLEAR(CompanyAddress);
    end;

    var
        OrderedQuantity: Decimal;
        BackOrderedQuantity: Decimal;
        ShipmentMethod: Record "Shipment Method";
        ReceiptLine: Record "Sales Shipment Line";
        OrderLine: Record "Sales Line";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        CompanyInformation: Record "Company Information";
        CompanyInfo1: Record "Company Information";
        CompanyInfo2: Record "Company Information";
        CompanyInfo3: Record "Company Information";
        CompanyInfo: Record "Company Information";
        SalesSetup: Record "Sales & Receivables Setup";
        TempSalesShipmentLine: Record "Sales Shipment Line" temporary;
        TempSalesShipmentLineAsm: Record "Sales Shipment Line" temporary;
        RespCenter: Record "Responsibility Center";
        Language: Record Language;
        TaxArea: Record "Tax Area";
        Cust: Record Customer;
        PostedAsmHeader: Record "Posted Assembly Header";
        PostedAsmLine: Record "Posted Assembly Line";
        SalesShipmentPrinted: Codeunit "Sales Shpt.-Printed";
        FormatAddress: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        CompanyAddress: array[8] of Text[50];
        BillToAddress: array[8] of Text[50];
        ShipToAddress: array[8] of Text[50];
        CopyTxt: Text;
        PrintCompany: Boolean;
        PrintFooter: Boolean;
        NoCopies: Integer;
        NoLoops: Integer;
        CopyNo: Integer;
        NumberOfLines: Integer;
        OnLineNumber: Integer;
        HighestLineNo: Integer;
        PackageTrackingText: Text;
        PrintPackageTrackingNos: Boolean;
        PackageTrackingNoText: Text;
        PackageTrackingNoLabel: Text;
        ShippingAgentCodeText: Text;
        ShippingAgentCodeLabel: Text;
        LogInteraction: Boolean;
        Text000: TextConst ENU = 'COPY', ESM = 'COPIA', FRC = 'COPIER', ENC = 'COPY';
        Text001: TextConst ENU = 'Tracking No.', ESM = 'Nº seguim.', FRC = 'N° de traçabilité', ENC = 'Tracking No.';
        Text002: TextConst ENU = 'Specific Tracking No.', ESM = 'Nº seguim. específico', FRC = 'N° de traçabilité spécifique', ENC = 'Specific Tracking No.';
        Text003: TextConst ENU = 'Shipping Agent', ESM = 'Transportista', FRC = 'Agent de livraison', ENC = 'Shipping Agent';
        TaxRegNo: Text;
        TaxRegLabel: Text;
        Text009: TextConst ENU = 'VOID SHIPMENT', ESM = 'ANULAR ENV´O', FRC = 'ANNULER LIVRAISON', ENC = 'VOID SHIPMENT';
        [InDataSet]
        LogInteractionEnable: Boolean;
        DisplayAssemblyInformation: Boolean;
        AsmHeaderExists: Boolean;
        BillCaptionLbl: TextConst ENU = 'Bill', ESM = 'Facturar', FRC = 'Facturer', ENC = 'Bill';
        ToCaptionLbl: TextConst ENU = 'To:', ESM = 'Para:', FRC = '‡ :', ENC = 'To:';
        CustomerIDCaptionLbl: TextConst ENU = 'Customer ID', ESM = 'Id. cliente', FRC = 'Code de client', ENC = 'Customer ID';
        PONumberCaptionLbl: TextConst ENU = 'P.O. Number', ESM = 'Número pedido compra', FRC = 'N° de bon de commande', ENC = 'P.O. Number';
        SalesPersonCaptionLbl: TextConst ENU = 'SalesPerson', ESM = 'Vendedor', FRC = 'Représentant', ENC = 'SalesPerson';
        ShipCaptionLbl: TextConst ENU = 'Ship', ESM = 'Enviar', FRC = 'Livrer', ENC = 'Ship';
        ShipmentCaptionLbl: TextConst ENU = 'SHIPMENT', ESM = 'ENV´O', FRC = 'LIVRAISON', ENC = 'SHIPMENT';
        ShipmentNumberCaptionLbl: TextConst ENU = 'Shipment Number:', ESM = 'Número envío:', FRC = 'Numéro de livraison :', ENC = 'Shipment Number:';
        ShipmentDateCaptionLbl: TextConst ENU = 'Shipment Date:', ESM = 'Fecha envío:', FRC = 'Date de livraison :', ENC = 'Shipment Date:';
        PageCaptionLbl: TextConst ENU = 'Page:', ESM = 'Pág.:', FRC = 'Page :', ENC = 'Page:';
        ShipViaCaptionLbl: TextConst ENU = 'Ship Via', ESM = 'Envío a través de', FRC = 'Livrer par', ENC = 'Ship Via';
        PODateCaptionLbl: TextConst ENU = 'P.O. Date', ESM = 'Fecha pedido compra', FRC = 'Date du bon de commande', ENC = 'P.O. Date';
        OurOrderNoCaptionLbl: TextConst ENU = 'Our Order No.', ESM = 'Nuestro pedido N°', FRC = 'Notre n° de commande', ENC = 'Our Order No.';
        ItemNoCaptionLbl: TextConst ENU = 'Item No.', ESM = 'Nº producto', FRC = 'N° d''article', ENC = 'Item No.';
        UnitCaptionLbl: TextConst ENU = 'Unit', ESM = 'Unidad', FRC = 'Unité', ENC = 'Unit';
        DescriptionCaptionLbl: TextConst ENU = 'Description', ESM = 'Descripción', FRC = 'Description', ENC = 'Description';
        ShippedCaptionLbl: TextConst ENU = 'Shipped', ESM = 'Enviado', FRC = 'Livré', ENC = 'Shipped';
        OrderedCaptionLbl: TextConst ENU = 'Ordered', ESM = 'Pedido', FRC = 'Commandé', ENC = 'Ordered';
        BackOrderedCaptionLbl: TextConst ENU = 'Back Ordered', ESM = 'Pedido pendiente', FRC = 'Commandé en retard', ENC = 'Back Ordered';

    [Scope('Personalization')]
    procedure InitLogInteraction();
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(5) <> '';
    end;

    [Scope('Personalization')]
    procedure GetUnitOfMeasureDescr(UOMCode: Code[10]): Text[10];
    var
        UnitOfMeasure: Record "Unit of Measure";
    begin
        if not UnitOfMeasure.GET(UOMCode) then
            exit(UOMCode);
        exit(UnitOfMeasure.Description);
    end;

    [Scope('Personalization')]
    procedure BlanksForIndent(): Text[10];
    begin
        exit(PADSTR('', 2, ' '));
    end;

    local procedure InsertTempLine(Comment: Text[80]; IncrNo: Integer);
    begin
        with TempSalesShipmentLine do begin
            INIT;
            "Document No." := "Sales Shipment Header"."No.";
            "Line No." := HighestLineNo + IncrNo;
            HighestLineNo := "Line No.";
        end;
        FormatDocument.ParseComment(Comment, TempSalesShipmentLine.Description, TempSalesShipmentLine."Description 2");
        TempSalesShipmentLine.INSERT;
    end;
}

