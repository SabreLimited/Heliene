report 59113 "ProdOrder - Job Card"
{
    // version NAVW111.00,NAVNA11.00

    DefaultLayout = RDLC;
    RDLCLayout = './ProdOrder - Job Card.rdlc';
    CaptionML = ENU = 'Prod. Order - Job Card',
                ESM = 'Ord. prod. - Ficha trabajo',
                FRC = 'Bon de production - Fiche de projet',
                ENC = 'Prod. Order - Job Card';

    dataset
    {
        dataitem("Production Order"; "Production Order")
        {
            DataItemTableView = SORTING (Status, "No.");
            RequestFilterFields = Status, "No.", "Source Type", "Source No.";
            column(Status_ProdOrder; Status)
            {
            }
            column(No_ProdOrder; "No.")
            {
            }
            column(SBR_SalesHeader; "Production Order"."SBR Sales Order No.") { }//M3959
            column(SBR_Quantity; Quantity) { }//M3959
            column(SBR_TruckNo; TruckNo) { }//M3959

            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING (Number) WHERE (Number = CONST (1));
                column(TodayFormatted; FORMAT(TODAY, 0, 4))
                {
                }
                column(CompanyName; COMPANYPROPERTY.DISPLAYNAME)
                {
                }
                column(ProdOrderTableCaptionFilt; "Production Order".TABLECAPTION + ':' + ProdOrderFilter)
                {
                }
                column(ProdOrderFilter; ProdOrderFilter)
                {
                }
                column(CurrReportPageNoCaption; CurrReportPageNoCaptionLbl)
                {
                }
                column(ProdOrderJobCardCaption; ProdOrderJobCardCaptionLbl)
                {
                }
            }

            dataitem("Prod. Order Line"; "Prod. Order Line")
            {
                DataItemLink = "Prod. Order No." = Field ("No.");
                dataitem("Production BOM Header"; "Production BOM Header")
                {
                    DataItemLink = "No." = FIELD ("Production BOM No.");
                    dataitem("Production BOM Line"; "Production BOM Line")
                    {
                        DataItemLink = "Production BOM No." = FIELD ("No.");
                        dataitem("Production BOM Comment Line"; "Production BOM Comment Line")
                        {
                            DataItemLink = "Production BOM No." = FIELD ("Production BOM No."), "BOM Line No." = FIELD ("Line No.");
                            column(BOMLineNo; "Line No.") { }
                            column(BOMDate; Date) { }
                            column(BOMCode; Code) { }
                            column(BOMComment; Comment) { }
                        }
                    }
                }
                column(SBR_VariantCode; "Prod. Order Line"."Variant Code") { }//M3959
            }
            dataitem("Prod. Order Routing Line"; "Prod. Order Routing Line")
            {
                DataItemLink = Status = FIELD (Status), "Prod. Order No." = FIELD ("No.");
                DataItemTableView = SORTING (Status, "Prod. Order No.", "Routing Reference No.", "Routing No.", "Operation No.");
                column(RtngNo_ProdOrderRtngLine; "Routing No.")
                {
                    IncludeCaption = true;
                }
                column(OPNo_ProdOrderRtngLine; "Operation No.")
                {
                    IncludeCaption = true;
                }
                column(Type_ProdOrderRtngLine; Type)
                {
                    IncludeCaption = true;
                }
                column(No_ProdOrderRtngLine; "No.")
                {
                    IncludeCaption = true;
                }
                column(StrtTim_ProdOrderRtngLine; "Starting Time")
                {
                    IncludeCaption = true;
                }
                column(StrtDt_ProdOrderRtngLine; FORMAT("Starting Date"))
                {
                }
                column(FormattedStrt_DtProdOrderRtngLine; Format(Date2DMY("Starting Date", 2)) + '/' + Format(Date2DMY("Starting Date", 1)) + '/' + Format(Date2DMY("Starting Date", 3))) { } //Sbr-Jo M3928
                column(EndTime_ProdOrderRtngLine; "Ending Time")
                {
                    IncludeCaption = true;
                }
                column(EndDate_ProdOrderRtngLine; FORMAT("Ending Date"))
                {
                }
                column(FormattedEndDate_ProdOrderRtngLine; Format(Date2DMY("Ending Date", 2)) + '/' + Format(Date2DMY("Ending Date", 1)) + '/' + Format(Date2DMY("Ending Date", 3))) { }//Sbr-Jo 3928
                column(ExpCapNd_ProdOrderRtngLine; "Expected Capacity Need")
                {
                }
                column(Desc_ProdOrder; "Production Order".Description)
                {
                }
                column(SourceNo_ProdOrder; "Production Order"."Source No.")
                {
                }
                column(ProdOrdrRtngLineRTUOMCode; CapacityUoM)
                {
                }
                column(PrdOrdNo_ProdOrderRtngLine; "Prod. Order No.")
                {
                    IncludeCaption = true;
                }
                column(ProdOrderRtngLnStrtDtCapt; ProdOrderRtngLnStrtDtCaptLbl)
                {
                }
                column(ProdOrdRtngLnEndDatCapt; ProdOrdRtngLnEndDatCaptLbl)
                {
                }
                column(ProdOrdRtngLnExpcCapNdCpt; ProdOrdRtngLnExpcCapNdCptLbl)
                {
                }
                column(PrecalcTimesCaption; PrecalcTimesCaptionLbl)
                {
                }
                column(ProdOrderSourceNoCapt; ProdOrderSourceNoCaptLbl)
                {
                }
                column(OutputCaption; OutputCaptionLbl)
                {
                }
                column(ScrapCaption; ScrapCaptionLbl)
                {
                }
                column(DateCaption; DateCaptionLbl)
                {
                }
                column(ByCaption; ByCaptionLbl)
                {
                }
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                dataitem("Prod. Order Component"; "Prod. Order Component")
                {
                    DataItemLink = Status = FIELD (Status), "Prod. Order No." = FIELD ("Prod. Order No."), "Routing Link Code" = FIELD ("Routing Link Code");
                    DataItemTableView = SORTING (Status, "Prod. Order No.", "Prod. Order Line No.", "Line No.");
                    column(Position_ProdOrderComp; Position)
                    {
                        IncludeCaption = true;
                    }
                    column(Position2_ProdOrderComp; "Position 2")
                    {
                        IncludeCaption = true;
                    }
                    column(LdTimOffset_ProdOrderComp; "Lead-Time Offset")
                    {
                        IncludeCaption = true;
                    }
                    column(ExpectedQty_ProdOrderComp; "Expected Quantity")
                    {
                        IncludeCaption = true;
                    }
                    column(ItemNo_ProdOrderComp; "Item No.")
                    {
                        IncludeCaption = true;
                    }
                    column(OrderNo_ProdOrderComp; "Prod. Order No.")
                    {
                    }
                    column(MaterialRequirementsCapt; MaterialRequirementsCaptLbl)
                    {
                    }
                }
                dataitem("Routing Comment Line"; "Routing Comment Line")
                {
                    DataItemLink = "Routing No." = FIELD ("Routing No."), "Operation No." = FIELD ("Operation No.");
                    column(RoutingLineNo; "Line No.") { }
                    column(RoutingDate; Date) { }
                    column(FormattedRoutingDate; Format(Date2DMY(Date, 2)) + '/' + Format(Date2DMY(Date, 1)) + '/' + Format(Date2DMY(Date, 3))) { }//Sbr-Jo 3928
                    column(RoutingCode; Code) { }
                    column(RoutingComment; Comment) { }
                }


                trigger OnAfterGetRecord();
                var
                    WorkCenter: Record "Work Center";
                    CalendarMgt: Codeunit CalendarManagement;
                begin
                    WorkCenter.GET("Work Center No.");
                    CapacityUoM := WorkCenter."Unit of Measure Code";
                    "Expected Capacity Need" := "Expected Capacity Need" / CalendarMgt.TimeFactor(CapacityUoM);
                end;
            }
            dataitem("Prod. Order Comment Line"; "Prod. Order Comment Line")
            {
                DataItemLink = Status = FIELD (Status), "Prod. Order No." = FIELD ("No.");
                column(Line_No_; "Line No.") { }
                column(Date; Date) { }
                column(FormattedDate; Format(Date2DMY(Date, 2)) + '/' + Format(Date2DMY(Date, 1)) + '/' + Format(Date2DMY(Date, 3))) { }//Sbr-Jo 3928
                column(Code; Code) { }
                column(Comment; Comment) { }
            }

            trigger OnAfterGetRecord();
            var
                ProdOrderRoutingLine: Record "Prod. Order Routing Line";
                WarehouseShipmentHeader: Record "Warehouse Shipment Header";
            begin
                ProdOrderRoutingLine.SETRANGE(Status, Status);
                ProdOrderRoutingLine.SETRANGE("Prod. Order No.", "No.");
                if not ProdOrderRoutingLine.FINDFIRST then
                    CurrReport.SKIP;
                WarehouseShipmentHeader.SetRange("SBR Sales Header", "SBR Sales Order No.");//M3959
                IF WarehouseShipmentHeader.FindFirst() then
                    TruckNo := FORMAT(WarehouseShipmentHeader."Truck No.");//END M3959
            end;

            trigger OnPreDataItem();
            begin
                ProdOrderFilter := GETFILTERS;
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

    var
        ProdOrderFilter: Text;
        CapacityUoM: Code[10];
        CurrReportPageNoCaptionLbl: TextConst ENU = 'Page', ESM = 'Pág.', FRC = 'Page', ENC = 'Page';
        ProdOrderJobCardCaptionLbl: TextConst ENU = 'Prod. Order - Job Card', ESM = 'Ord. prod. - Ficha trabajo', FRC = 'Bon de production - Fiche de projet', ENC = 'Prod. Order - Job Card';
        ProdOrderRtngLnStrtDtCaptLbl: TextConst ENU = 'Starting Date', ESM = 'Fecha inicial', FRC = 'Date début', ENC = 'Starting Date';
        ProdOrdRtngLnEndDatCaptLbl: TextConst ENU = 'Ending Date', ESM = 'Fecha final', FRC = 'Date fin', ENC = 'Ending Date';
        ProdOrdRtngLnExpcCapNdCptLbl: TextConst ENU = 'Time Needed', ESM = 'Tiempo necesario', FRC = 'Temps nécessaire', ENC = 'Time Needed';
        PrecalcTimesCaptionLbl: TextConst ENU = 'Precalc. Times', ESM = 'Tiempos previo cálculo', FRC = 'Temps théoriques', ENC = 'Precalc. Times';
        ProdOrderSourceNoCaptLbl: TextConst ENU = 'Item No.', ESM = 'Nº producto', FRC = 'N° d''article', ENC = 'Item No.';
        OutputCaptionLbl: TextConst ENU = 'Output', ESM = 'Salida', FRC = 'Sortie', ENC = 'Output';
        ScrapCaptionLbl: TextConst ENU = 'Scrap', ESM = 'Rechazo', FRC = 'Rebut', ENC = 'Scrap';
        DateCaptionLbl: TextConst ENU = 'Date', ESM = 'Fecha', FRC = 'Date', ENC = 'Date';
        ByCaptionLbl: TextConst ENU = 'By', ESM = 'Por', FRC = 'Par', ENC = 'By';
        EmptyStringCaptionLbl: TextConst ENU = '___________', ESM = '___________', FRC = '___________', ENC = '___________';
        MaterialRequirementsCaptLbl: TextConst ENU = 'Material Requirements', ESM = 'Necesidades material', FRC = 'Réquisitions de matériel', ENC = 'Material Requirements';
        TruckNo: Text;//M3959
}

