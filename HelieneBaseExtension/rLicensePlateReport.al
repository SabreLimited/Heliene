report 59114 "License Plate Report"
{
    //Sbr-Jo M3846 Added BarcodeNo.
    dataset
    {
        dataitem(LicensePlateHeader; "License Plate Header")
        {
            RequestFilterFields = "No.";
            dataitem("LicensePlateLine"; "License Plate Line")
            {
                DataItemLink = "License Plate No." = FIELD ("No.");

                column(LPL_No; "Line No.") { }
                column(LPL_Item; "Item No.") { }
                column(LPL_Variant; "Variant Code") { }
                column(LPL_Quantity; "Quantity") { }
                column(LPL_Serial; "Serial No.") { }
                column(LPL_Lot; "Lot No.") { }
                column(LPL_Barcode; "Barcode") { }
                column(LPL_UOM; "Unit of Measure Code") { }
                column(LPL_ExpirationDate; "Expiration Date") { }
                column(LPL_FormattedExpirationDate; ExtensionFunctions.getFormattedDate("Expiration Date")) { }
                column(LPL_Description; "Description") { }
                column(LPL_Description2; "Description 2") { }
                column(LPL_LPStatus; "LP Status") { }
                column(LPL_ConsumptionStatus; "Consumption Status") { }
                column(LPL_ScannedQty; "Scanned Quantity") { }
                column(LPL_ScannedUOM; "Scanned UOM") { }
            }
            column("LPH_BarcodeNo"; '*%LP%' + LicensePlateHeader."No." + '*') { }
            column("LPH_No"; LicensePlateHeader."No.") { }
            column("LPH_Description"; LicensePlateHeader."Description") { }
            column("LPH_Status"; LicensePlateHeader."Status") { }
            column("LPH_InsuranceAmountLCY"; LicensePlateHeader."Insurance Amount (LCY)") { }
            column("LPH_PermissionRequired"; LicensePlateHeader."Permission Required") { }
            column("LPH_TemplateCode"; LicensePlateHeader."Template Code") { }
            column("LPH_HasCarrierLabel"; LicensePlateHeader."Has Carrier Label") { }
            column("LPH_CreatedBy"; LicensePlateHeader."Created By") { }
            column("LPH_CreatedOn"; LicensePlateHeader."Created On") { }
            column(LPH_FormattedCreatedOn; ExtensionFunctions.getFormattedDate(LicensePlateHeader."Created On")) { }
            column("LPH_LastModifiedBy"; LicensePlateHeader."Last Modified By") { }
            column("LPH_LastModifiedOn"; LicensePlateHeader."Last Modified On") { }
            column(LPH_FormattedLastModifiedOn; ExtensionFunctions.getFormattedDate(LicensePlateHeader."Last Modified On")) { }
            column("LPH_TotalLineUsageQty"; LicensePlateHeader."Total Line Usage Qty.") { }
            column("LPH_ItemQuantityCount"; LicensePlateHeader."Item Quantity Count") { }
            column("LPH_LineCount"; LicensePlateHeader."Line Count") { }
            column("LPH_UnbuildonReceipt"; LicensePlateHeader."Unbuild on Receipt") { }
            column("LPH_ShipmentLength"; LicensePlateHeader."Shipment Length") { }
            column("LPH_ShipmentWidth"; LicensePlateHeader."Shipment Width") { }
            column("LPH_ShipmentHeight"; LicensePlateHeader."Shipment Height") { }
            column("LPH_ShptDimUnitofMeasure"; LicensePlateHeader."Shpt. Dim. Unit of Measure") { }
            column("LPH_PackageCarrierLabel"; LicensePlateHeader."Package Carrier Label") { }
            column("LPH_PackageOrderID"; LicensePlateHeader."Package Order ID") { }
            column("LPH_PackageTrackerID"; LicensePlateHeader."Package Tracker ID") { }
            column("LPH_SourceDocument"; LicensePlateHeader."Source Document") { }
            column("LPH_SourceNo"; LicensePlateHeader."Source No.") { }
            column("LPH_SourceCompanyName"; LicensePlateHeader."Source Company Name") { }
            column("LPH_ShippedSourceDocument"; LicensePlateHeader."Shipped Source Document") { }
            column("LPH_ShippedSourceNo"; LicensePlateHeader."Shipped Source No.") { }
            column("LPH_ShippedCompanyName"; LicensePlateHeader."Shipped Company Name") { }
            column("LPH_ShipmentNo"; LicensePlateHeader."Shipment No.") { }
            column("LPH_CustomsNo"; LicensePlateHeader."Customs No.") { }
            column("LPH_LocationCode"; LicensePlateHeader."Location Code") { }
            column("LPH_BinCode"; LicensePlateHeader."Bin Code") { }
            column("LPH_ShippedTransactionDateTime"; LicensePlateHeader."Shipped Transaction DateTime") { }
            column("LPH_FormattedShpTransDT"; ExtensionFunctions.getFormattedDate(DT2Date(LicensePlateHeader."Shipped Transaction DateTime"))) { }
            column("LPH_ShipmentDate"; LicensePlateHeader."Shipment Date") { }
            column("LPH_ShipmentTrackingNumber"; LicensePlateHeader."Shipment Tracking Number") { }
            column("LPH_ShipmentNetWeight"; LicensePlateHeader."Shipment Net Weight") { }
            column("LPH_ShipmentGrossWeight"; LicensePlateHeader."Shipment Gross Weight") { }
            column("LPH_CurrentNetWeight"; LicensePlateHeader."Current Net Weight") { }
            column("LPH_CurrentGrossWeight"; LicensePlateHeader."Current Gross Weight") { }
            column("LPH_MaximumWeight"; LicensePlateHeader."Maximum Weight") { }
            column("LPH_MinimumWeight"; LicensePlateHeader."Minimum Weight") { }
            column("LPH_Length"; LicensePlateHeader."Length") { }
            column("LPH_Width"; LicensePlateHeader."Width") { }
            column("LPH_Height"; LicensePlateHeader."Height") { }
            column("LPH_CurrentCubage"; LicensePlateHeader."Current Cubage") { }
            column("LPH_MaximumCubage"; LicensePlateHeader."Maximum Cubage") { }
            column("LPH_MinimumCubage"; LicensePlateHeader."Minimum Cubage") { }
            column("LPH_ShipmentCubage"; LicensePlateHeader."Shipment Cubage") { }
            column("LPH_CurrentItemCount"; LicensePlateHeader."Current Item Count") { }
            column("LPH_ShippedItemCount"; LicensePlateHeader."Shipped Item Count") { }
            column("LPH_EDIStatus"; LicensePlateHeader."EDI Status") { }
            column("LPH_EDISentDate"; LicensePlateHeader."EDI Sent Date") { }
            column(LPH_FormattedEDISentDate; ExtensionFunctions.getFormattedDate(DT2Date(LicensePlateHeader."EDI Sent Date"))) { }
            column("LPH_Locked"; LicensePlateHeader."Locked") { }
            column("LPH_DimUnitofMeasure"; LicensePlateHeader."Dim. Unit of Measure") { }
            column("LPH_CubageUnitofMeasure"; LicensePlateHeader."Cubage Unit of Measure") { }
            column("LPH_WeightUnitofMeasure"; LicensePlateHeader."Weight Unit of Measure") { }
            column("LPH_PackageTrackingNumber"; LicensePlateHeader."Package Tracking Number") { }
            column("LPH_CreatedbyPDA"; LicensePlateHeader."Created by PDA") { }
            column("LPH_LastModifiedbyPDA"; LicensePlateHeader."Last Modified by PDA") { }
            column("LPH_ProcessingState"; LicensePlateHeader."Processing State") { }


        }
    }

    var
        ExtensionFunctions: Codeunit ExtensionFunctions; //Sbr-Jo M3928


}