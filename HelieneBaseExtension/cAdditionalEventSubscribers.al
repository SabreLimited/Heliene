codeunit 59114 AdditionalEventSubscribers
{
    trigger OnRun()
    begin

    end;

    var
        myInt: Integer;

    procedure canTriggerSales(var Rec: Record "Sales Line"): Boolean;
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesHeader.SetRange("No.", Rec."Document No.");
        IF (skipFunc = true) OR ((SalesHeader.FindFirst()) AND (SalesHeader.Status = SalesHeader.Status::Released)) then
            exit(false);
        exit(true)
    end;

    //Sbr-Jo M3913 changed if statement
    procedure canTriggerPurchase(var Rec: Record "Purchase Line"): Boolean;
    var
        PurchHeader: Record "Purchase Header";
    begin
        PurchHeader.SETRANGE("No.", Rec."Document No.");
        IF (skipFunc = true) OR ((PurchHeader.Findfirst()) AND ((PurchHeader.Status = PurchHeader.Status::Released) OR (PurchHeader.Status = PurchHeader.Status::"Pending Approval"))) then
            exit(false);
        exit(true);
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'No.', true, true)] //OnAfterValidate for SalesLine's No SBR-Jo
    local procedure SalesLineOnAfterValidateNo(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer);
    var
        Item: Record "Item";
        SalesHeader: Record "Sales Header";
    begin
        if (canTriggerSales(Rec) <> true) OR (SalesLineExists(Rec) <> true) then
            exit;
        IF (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') AND (Rec."Line No." <> 0) THEN begin
            Item.SETRANGE("No.", Rec."No.");
            IF Item.FINDFIRST then begin
                if (Rec.Watts = 0) AND (Item.Watts <> 0) then
                    Rec."Watts" := Item."Watts";
                if (rec.PricePerWatt = 0) AND (Item.PricePerWatt <> 0) then
                    Rec."PricePerWatt" := Item."PricePerWatt";
                if (rec.CostPerWatt = 0) AND (Item.CostPerWatt <> 0) then
                    Rec."CostPerWatt" := Item."CostPerWatt";
                IF (Rec.PricePerWatt <> 0) AND (Rec.Watts <> 0) then
                    Rec.VALIDATE("Unit Price", Item."Watts" * Item."PricePerWatt");
                Rec.Modify;
            end;
            IF (Rec."Document No." <> '') THEN BEGIN
                SalesHeader.SetRange("No.", Rec."Document No.");
                SalesHeader.SetRange("Document Type", Rec."Document Type");
                IF SalesHeader.FindFirst() THEN
                    UpdateTotalWattage(SalesHeader);
            END;

            Rec.Validate("SBR Total Watts", Rec.Watts * Rec.Quantity);
            Rec.Modify;
        END;
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'PricePerWatt', true, true)] //OnAfterValidate for SalesLine's PricePerWatt SBR-Jo
    local procedure SalesLineOnAfterValidatePricePerWatt(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer);
    var
        Item: Record "Item";
        SalesHeader: Record "Sales Header";
    begin
        if (canTriggerSales(Rec) <> true) OR (SalesLineExists(Rec) <> true) then
            exit;
        IF (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') AND (Rec."Line No." <> 0) THEN begin
            Item.SETRANGE("No.", Rec."No.");
            IF Item.FINDFIRST then begin
                Rec.VALIDATE("Unit Price", Rec."Watts" * Rec."PricePerWatt");
                Rec.Modify;
            end;

        END;
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterInsertEvent', '', true, true)] //OnAfterInsert for SalesLine SBR-Jo
    local procedure SalesLineOnAfterInsert(var Rec: Record "Sales Line");
    var
        Item: Record "Item";
        SalesHeader: Record "Sales Header";
    begin
        if (canTriggerSales(Rec) <> true) then
            exit;
        SalesHeader.RESET;
        IF (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') AND (Rec."Line No." <> 0) THEN begin
            Item.SETRANGE("No.", Rec."No.");
            IF Item.FINDFIRST then begin
                if (Rec.Watts = 0) AND (Item.Watts <> 0) then
                    Rec."Watts" := Item."Watts";
                if (rec.PricePerWatt = 0) AND (Item.PricePerWatt <> 0) then
                    Rec."PricePerWatt" := Item."PricePerWatt";
                if (rec.CostPerWatt = 0) AND (Item.CostPerWatt <> 0) then
                    Rec."CostPerWatt" := Item."CostPerWatt";
                IF (Rec.PricePerWatt <> 0) AND (Rec.Watts <> 0) then
                    Rec.VALIDATE("Unit Price", Rec."Watts" * Rec."PricePerWatt");
                Rec.Modify;
            end;
            IF (Rec."Document No." <> '') THEN BEGIN
                SalesHeader.SetRange("No.", Rec."Document No.");
                SalesHeader.SetRange("Document Type", Rec."Document Type");
                IF SalesHeader.FindFirst() THEN
                    UpdateTotalWattage(SalesHeader);
            END;

            Rec.Validate("SBR Total Watts", Rec.Watts * Rec.Quantity);
            Rec.Modify;
        END;
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'No.', true, true)] //OnAfterValidate for PurchaseLine's No SBR-Jo
    local procedure PurchaseLineOnAfterValidateNo(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; CurrFieldNo: Integer);
    var
        Item: Record "Item";
    begin
        if (canTriggerPurchase(Rec) <> true) OR (PurchLineExists(Rec) <> true) then
            exit;
        IF (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') AND (Rec."Line No." <> 0) THEN begin
            Item.SETRANGE("No.", Rec."No.");
            IF Item.FINDFIRST then begin
                if (Rec.Watts = 0) AND (Item.Watts <> 0) then
                    Rec."Watts" := Item."Watts";
                if (rec.CostPerWatt = 0) AND (Item.CostPerWatt <> 0) then
                    Rec."CostPerWatt" := Item."CostPerWatt";
                if (rec.PricePerWatt = 0) AND (Item.PricePerWatt <> 0) then
                    Rec."PricePerWatt" := Item."PricePerWatt";
                IF (Rec.CostPerWatt <> 0) AND (Rec.Watts <> 0) then
                    Rec.VALIDATE("Direct Unit Cost", Rec."Watts" * Rec."CostPerWatt");
                Rec.Modify;
            end;

        END;
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'CostPerWatt', true, true)] //OnAfterValidate for PurchaseLine's CostPerWatt SBR-Jo
    local procedure PurchaseLineOnAfterValidateCostPerWatt(var Rec: Record "Purchase Line"; var xRec: Record "Purchase Line"; CurrFieldNo: Integer);
    begin
        if (canTriggerPurchase(Rec) <> true) OR (PurchLineExists(Rec) <> true) then
            exit;
        IF (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') AND (Rec."Line No." <> 0) THEN begin
            IF (Rec.CostPerWatt <> 0) AND (Rec.Watts <> 0) then
                Rec.VALIDATE("Direct Unit Cost", Rec."Watts" * Rec."CostPerWatt");
            Rec.Modify;

        END;
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterInsertEvent', '', true, true)] //OnAfterInsert for PurchaseLine  SBR-Jo
    local procedure PurchaseLineOnAfterInsert(var Rec: Record "Purchase Line");
    var
        Item: Record "Item";
    begin
        if (canTriggerPurchase(Rec) <> true) then
            exit;
        IF (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') AND (Rec."Line No." <> 0) THEN begin
            Item.SETRANGE("No.", Rec."No.");
            IF Item.FINDFIRST then begin
                if (Rec.Watts = 0) AND (Item.Watts <> 0) then
                    Rec."Watts" := Item."Watts";
                if (rec.CostPerWatt = 0) AND (Item.CostPerWatt <> 0) then
                    Rec."CostPerWatt" := Item."CostPerWatt";
                if (rec.PricePerWatt = 0) AND (Item.PricePerWatt <> 0) then
                    Rec."PricePerWatt" := Item."PricePerWatt";
                IF (Rec.CostPerWatt <> 0) AND (Rec.Watts <> 0) then
                    Rec.VALIDATE("Direct Unit Cost", Rec."Watts" * Rec."CostPerWatt");
                Rec.Modify;
            end;
        END;
    end;

    [EventSubscriber(ObjectType::Table, 39, 'OnAfterValidateEvent', 'Watts', true, true)] //OnAfterInsert for PurchaseLine  SBR-Jo
    local procedure PurchaseLineOnAfterValidateWatts(var Rec: Record "Purchase Line");
    var
        Item: Record "Item";
    begin
        if (canTriggerPurchase(Rec) <> true) OR (PurchLineExists(Rec) <> true) then
            exit;
        IF (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') AND (Rec."Line No." <> 0) THEN begin
            Item.SETRANGE("No.", Rec."No.");
            IF Item.FINDFIRST then begin
                if (rec.CostPerWatt = 0) AND (Item.CostPerWatt <> 0) then
                    Rec."CostPerWatt" := Item."CostPerWatt";
                if (rec.PricePerWatt = 0) AND (Item.PricePerWatt <> 0) then
                    Rec."PricePerWatt" := Item."PricePerWatt";
                IF (Rec.CostPerWatt <> 0) AND (Rec.Watts <> 0) then
                    Rec.VALIDATE("Direct Unit Cost", Rec."Watts" * Rec."CostPerWatt");
                Rec.Modify;
            end;

        END;
    end;

    local procedure UpdateTotalWattage(var Header: Record "Sales Header");
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        TotalWattage: Decimal;
    begin
        IF skipFunc = true then
            exit;
        TotalWattage := 0;
        SalesHeader.SetRange("No.", Header."No.");
        SalesHeader.SetRange("Document Type", Header."Document Type");
        SalesLine.SetRange("Document No.", Header."No.");
        SalesLine.SetRange("Document Type", Header."Document Type");
        IF SalesHeader.FindFirst() then begin
            IF SalesLine.FINDSET THEN
                REPEAT
                    TotalWattage += (SalesLine."Watts" * salesLine.Quantity);
                UNTIL SalesLine.Next = 0;
            SalesHeader.VALIDATE("TotalWattage", TotalWattage);
            SalesHeader.Modify;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Quantity', true, true)] //OnAfterInsert for PurchaseLine  SBR-Jo
    local procedure SalesLineOnAfterValidateQuantity(var Rec: Record "Sales Line");
    var
        Item: Record "Item";
    begin
        if (canTriggerSales(Rec) <> true) OR (SalesLineExists(Rec) <> true) then
            exit;
        IF (Rec.Type = Rec.Type::Item) AND (Rec."No." <> '') AND (Rec."Line No." <> 0) THEN begin
            Rec.VALIDATE("SBR Total Watts", Rec.Watts * Rec.Quantity);
            Rec.Modify;
        END;
    END;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnBeforePostSalesDoc', '', true, true)]
    local procedure prePost(var SalesHeader: Record "Sales Header");

    begin
        skipFunc := TRUE;
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterPostSalesDoc', '', true, true)]
    local procedure postPost(var SalesHeader: Record "Sales Header");

    begin
        skipFunc := false;
    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePostPurchaseDoc', '', true, true)]
    local procedure prePostPurch(var PurchaseHeader: Record "Purchase Header");

    begin
        skipFunc := TRUE;
    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnAfterPostPurchaseDoc', '', true, true)]
    local procedure postPostPurch(var PurchaseHeader: Record "Purchase Header");

    begin
        skipFunc := false;
    end;

    //M3913 Solution Sbr-Jo
    [EventSubscriber(ObjectType::Page, 50, 'OnBeforeActionEvent', 'SendApprovalRequest', true, true)]
    local procedure preSendPurchaseApproval(var Rec: Record "Purchase Header");
    begin
        skipFunc := true;
    end;

    [EventSubscriber(ObjectType::Page, 50, 'OnAfterActionEvent', 'SendApprovalRequest', true, true)]
    local procedure postSendPurchaseApproval(var Rec: Record "Purchase Header");
    begin
        skipFunc := false;
    end;
    //M3913 Solution Sbr-Jo
    [EventSubscriber(ObjectType::Page, 9307, 'OnBeforeActionEvent', 'SendApprovalRequest', true, true)]
    local procedure preSendPurchaseApprovalList(var Rec: Record "Purchase Header");
    begin
        skipFunc := true;
    end;

    [EventSubscriber(ObjectType::Page, 9307, 'OnAfterActionEvent', 'SendApprovalRequest', true, true)]
    local procedure postSendPurchaseApprovalList(var Rec: Record "Purchase Header");
    begin
        skipFunc := false;
    end;

    [EventSubscriber(ObjectType::Page, 42, 'OnBeforeActionEvent', 'Release', true, true)]
    local procedure SalesOrderonBeforeRelease(var Rec: Record "Sales Header");
    begin
        SalesHeaderVerifyApproval(Rec);
    END;

    [EventSubscriber(ObjectType::Page, 42, 'OnBeforeActionEvent', 'Post', true, true)] //OnAfterInsert for PurchaseLine  SBR-Jo
    local procedure SalesOrderOnBeforeActionPost(var Rec: Record "Sales Header");
    begin
        SalesHeaderVerifyApproval(Rec);
    END;

    [EventSubscriber(ObjectType::Page, 42, 'OnBeforeActionEvent', 'PostandNew', true, true)] //OnAfterInsert for PurchaseLine  SBR-Jo
    local procedure SalesOrderOnBeforeActionPostandNew(var Rec: Record "Sales Header");
    begin
        SalesHeaderVerifyApproval(Rec);
    END;

    [EventSubscriber(ObjectType::Page, 42, 'OnBeforeActionEvent', 'PostandSend', true, true)] //OnAfterInsert for PurchaseLine  SBR-Jo
    local procedure SalesOrderOnBeforeActionPostand(var Rec: Record "Sales Header");
    begin
        SalesHeaderVerifyApproval(Rec);
    END;

    [EventSubscriber(ObjectType::Page, 9305, 'OnBeforeActionEvent', 'Release', true, true)]
    local procedure SOListOnBeforeRelease(var Rec: Record "Sales Header");
    begin
        SalesHeaderVerifyApproval(Rec);
    END;

    [EventSubscriber(ObjectType::Page, 9305, 'OnBeforeActionEvent', 'Post', true, true)]
    local procedure SOListOnBeforeActionPost(var Rec: Record "Sales Header");
    begin
        SalesHeaderVerifyApproval(Rec);
    END;

    [EventSubscriber(ObjectType::Page, 9305, 'OnBeforeActionEvent', 'Post &Batch', true, true)]
    local procedure SOListOnBeforeActionPostandNew(var Rec: Record "Sales Header");
    begin
        SalesHeaderVerifyApproval(Rec);
    END;

    [EventSubscriber(ObjectType::Page, 9305, 'OnBeforeActionEvent', 'PostandSend', true, true)]
    local procedure SOListOnBeforeActionPostand(var Rec: Record "Sales Header");
    begin
        SalesHeaderVerifyApproval(Rec);
    END;

    local procedure SalesHeaderVerifyApproval(Rec: Record "Sales Header");
    begin
        if (Rec."SBR Approval Boolean A" <> true) then
            error('Approval Boolean A is not true');
        if (Rec."SBR Approval Boolean B" <> true) then
            error('Approval Boolean B is not true');
        if (Rec."SBR Approval Boolean C" <> true) then
            error('Approval Boolean C is not true');
    end;

    local procedure PurchLineExists(Rec: Record "Purchase Line") failure: Boolean;
    var
        PurchaseLine: Record "Purchase Line";
    begin
        IF PurchaseLine.GET(Rec."Document Type", Rec."Document No.", Rec."Line No.") then
            exit(TRUE)
        else
            exit(false);
    end;

    local procedure SalesLineExists(Rec: Record "Sales Line") failure: Boolean;
    var
        SalesLine: Record "Sales Line";
    begin
        IF SalesLine.GET(Rec."Document Type", Rec."Document No.", Rec."Line No.") then
            exit(TRUE)
        else
            exit(false);
    end;

    [EventSubscriber(ObjectType::Table, 5107, 'OnBeforeInsertEvent', '', true, true)]
    local procedure SalesHeaderArchiveOnBeforeInsert(Rec: Record "Sales Header Archive"; RunTrigger: Boolean);
    var
        SalesHeader: Record "Sales Header";
        TestErrorCatching: Codeunit testErrorCatching;
    begin
        if SalesHeader.GET(Rec."Document Type", Rec."No.") then
            if (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) then begin
                SalesHeaderRequiredToArchive(SalesHeader);
                //SalesHeader.TestField("SBR Date Req to Archive");
                //SalesHeader.Testfield("SBR Bool Req to Archive");
                //if NOT (SalesHeaderRequiredToArchive(SalesHeader)) then
                //    Error('Date or Bool fields Required to archive have not been set!');
            end;

    end;

    [TryFunction]
    local procedure TryFuncSalesHeaderRequiredToArchive(Rec: Record "Sales Header")
    begin
        //Rec.TestField("SBR Date Req to Archive");//Sbr-Jo Removed at rob's request
        //Rec.Testfield("SBR Bool Req to Archive");
    end;

    local procedure SalesHeaderRequiredToArchive(Rec: Record "Sales Header"): Boolean
    begin
        //Rec.TestField("SBR Date Req to Archive");//Sbr-Jo Removed at rob's request
        //Rec.Testfield("SBR Bool Req to Archive");
    end;

    [EventSubscriber(ObjectType::Table, 5406, 'OnAfterInsertEvent', '', true, true)]
    local procedure ProdOrderLineOnAfterInsert(Rec: Record "Prod. Order Line");
    var
    begin
        updateSLAfterProdOrderLineChange(Rec);
    end;

    [EventSubscriber(ObjectType::Table, 5405, 'OnAfterDeleteEvent', '', true, true)]
    local procedure OnAfterDeleteProdOrder(Rec: Record "Production Order");
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange("Document No.", Rec."SBR Sales Order No.");
        SalesLine.SetRange("Line No.", Rec."SBR Sales Order Line No.");
        IF SalesLine.FindFirst() THEN begin
            SalesLine."SBR Prod Order Line Number" := 0;
            SalesLine."SBR Production Order Quantity" := 0;
            SalesLine."SBR Production Order Finished Qty" := 0;
            SalesLine."SBR Production Order Remaining Qty" := 0;
            SalesLine.Modify;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 5406, 'OnAfterValidateEvent', 'Quantity', true, true)]
    local procedure ProdOrderLineOnAfterValidateQuantity(Rec: Record "Prod. Order Line");
    begin
        updateSLAfterProdOrderLineChange(Rec);
    end;

    [EventSubscriber(ObjectType::Table, 5406, 'OnAfterValidateEvent', 'Remaining Quantity', true, true)]
    local procedure ProdOrderLineOnAfterValidateQuantityRemaining(Rec: Record "Prod. Order Line");
    begin
        updateSLAfterProdOrderLineChange(Rec);
    end;

    [EventSubscriber(ObjectType::Table, 5406, 'OnAfterValidateEvent', 'Finished Quantity', true, true)]
    local procedure ProdOrderLineOnAfterValidateQuantityFinished(Rec: Record "Prod. Order Line");
    begin
        updateSLAfterProdOrderLineChange(Rec);
    end;

    local procedure updateSLAfterProdOrderLineChange(Rec: Record "Prod. Order Line");
    var
        SalesLine: Record "Sales Line";
        ProdHeader: Record "Production Order";
    begin
        if (ProdOrderLineExists(Rec) <> true) then
            exit;
        //Will need to Get first Prod Order Line for order if exists and set several fields
        ProdHeader.SetRange("No.", Rec."Prod. Order No.");
        ProdHeader.SetRange(Status, Rec.Status);
        ProdHeader.SetFilter("SBR Sales Order No.", '<>%1', '');
        IF ProdHeader.FindFirst() THEN begin
            SalesLine.SetRange("Document No.", ProdHeader."SBR Sales Order No.");
            SalesLine.SetRange("Line No.", ProdHeader."SBR Sales Order Line No.");
            IF SalesLine.FindFirst() THEN begin
                SalesLine."SBR Prod Order Line Number" := Rec."Line No.";
                SalesLine."SBR Production Order Quantity" := Rec.Quantity;
                SalesLine."SBR Production Order Finished Qty" := Rec."Finished Quantity";
                SalesLine."SBR Production Order Remaining Qty" := Rec."Remaining Quantity";
                SalesLine.Modify;
            end;
        end;
    end;

    local procedure ProdOrderLineExists(Rec: Record "Prod. Order Line") failure: Boolean;
    var
        ProdOrderLine: Record "Prod. Order Line";
    begin
        IF ProdOrderLine.GET(Rec.Status, Rec."Prod. Order No.", Rec."Line No.") then
            exit(TRUE)
        else
            exit(false);
    end;

    [EventSubscriber(ObjectType::Table, 7321, 'OnAfterValidateEvent', 'Source No.', true, true)]
    local procedure WhseShipmentOnAfterValSourceNo(var rec: Record "Warehouse Shipment Line");
    var
        WarehouseShipmentHeader: Record "Warehouse Shipment Header";
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
        WhseShipmentLine: Record "Warehouse Shipment Line";
    begin
        IF WarehouseShipmentHeader.GET(rec."No.") then begin
            WarehouseShipmentHeader."SBR Sales Header" := rec."Source No.";
            IF SalesLine.GET(SalesLine."Document Type"::Order, rec."Source No.", rec."Source Line No.") then begin
                WarehouseShipmentHeader."Truck No." := SalesLine."Truck No.";
                WarehouseShipmentHeader."SBR Ship-To Code" := rec."SBR Ship-To Code";
            end;
            IF SalesHeader.GET(SalesHeader."Document Type"::Order, rec."Source No.") then
                WarehouseShipmentHeader."SBR Customer Name" := SalesHeader."Sell-to Customer Name";
            WarehouseShipmentHeader.MODIFY;

        end;
        IF WhseShipmentLine.GET(rec."No.", rec."Line No.") then begin
            IF SalesLine.GET(SalesLine."Document Type"::Order, rec."Source No.", rec."Source Line No.") then begin
                rec."SBR Truck No." := SalesLine."Truck No.";
                rec."SBR Total Watts" := SalesLine."SBR Total Watts";
            end;
            rec.Modify;
        end;

    end;

    [EventSubscriber(ObjectType::Table, 7321, 'OnAfterInsertEvent', '', true, true)]
    local procedure WhseShipmentOnAfterInsSourceNo(var rec: Record "Warehouse Shipment Line");
    var
        WarehouseShipmentHeader: Record "Warehouse Shipment Header";
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
        WhseShipmentLine: Record "Warehouse Shipment Line";
    begin
        IF WarehouseShipmentHeader.GET(rec."No.") then begin
            WarehouseShipmentHeader."SBR Sales Header" := rec."Source No.";
            IF SalesLine.GET(SalesLine."Document Type"::Order, rec."Source No.", rec."Source Line No.") then begin
                WarehouseShipmentHeader."Truck No." := SalesLine."Truck No.";
                WarehouseShipmentHeader."SBR Ship-To Code" := SalesLine."SBR Ship-To Code";
                rec."SBR Ship-To Code" := SalesLine."SBR Ship-to Code";
            END;
            IF SalesHeader.GET(SalesHeader."Document Type"::Order, rec."Source No.") then begin
                WarehouseShipmentHeader."SBR Customer Name" := SalesHeader."Sell-to Customer Name";
                //WarehouseShipmentHeader."SBR Ship-To Code" := SalesHeader."Ship-to Code";
                IF WhseShipmentLine.GET(rec."No.", rec."Line No.") then begin
                    rec.Modify;
                end;

            end;
            WarehouseShipmentHeader.MODIFY;
            IF WhseShipmentLine.GET(rec."No.", rec."Line No.") then begin
                IF SalesLine.GET(SalesLine."Document Type"::Order, rec."Source No.", rec."Source Line No.") then begin
                    WarehouseShipmentHeader."Truck No." := SalesLine."Truck No.";
                    rec."SBR Truck No." := SalesLine."Truck No.";
                    rec."SBR Total Watts" := SalesLine."SBR Total Watts";
                end;
                rec.Modify;
            end;
        end;

    end;

    [EventSubscriber(ObjectType::Table, 5405, 'OnAfterInsertEvent', '', true, true)]
    local procedure onAfterInsertProdOrder(var rec: Record "Production Order");
    var
        SalesLine: Record "Sales Line";
    begin
        IF SalesLine.GET(SalesLine."Document Type"::Order, rec."SBR Sales Order No.", rec."SBR Sales Order Line No.") THEN begin
            rec."SBR Variant Code" := SalesLine."Variant Code";
            rec.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Table, 5406, 'OnAfterInsertEvent', '', true, true)] //Sbr-Jo M3923
    local procedure onAfterInsertProdOrderLine(var rec: Record "Prod. Order Line");
    var
        ProductionOrder: Record "Production Order";
    begin
        IF ProductionOrder.GET(rec.Status, rec."Prod. Order No.") then
            IF ProductionOrder."SBR Variant Code" <> '' then begin
                rec."Variant Code" := ProductionOrder."SBR Variant Code";
                rec.Modify();
            end;
    end;

    [EventSubscriber(ObjectType::Page, 46, 'OnAfterActionEvent', 'Link to Order', true, true)]//Sbr-Jo M3923
    local procedure onAfterActionLinkToProdOrder(var rec: Record "Sales Line");
    var
        ProductionOrder: Record "Production Order";
        ProdOrderLines: Record "Prod. Order Line";
    begin
        IF ProductionOrder.GET(rec."SBR Prod. Order Status", rec."SBR Prod. Order No.") then begin
            ProductionOrder."SBR Variant Code" := rec."Variant Code";
            ProductionOrder.Modify();
        END;
    end;

    [EventSubscriber(ObjectType::Table, 7322, 'OnAfterInsertEvent', '', true, true)]//Sbr-Jo M3918
    local procedure onAfterInsertPostedWhseShipment(var rec: Record "Posted Whse. Shipment Header");
    var
        WhseShipment: Record "Warehouse Shipment Header";
        PstdWhseShipment: Record "Posted Whse. Shipment Header";
    begin
        IF WhseShipment.GET(rec."Whse. Shipment No.") then begin
            rec."SBR Quoted Price" := WhseShipment."SBR Quoted Price";
            rec."SBR Customs Invoice" := WhseShipment."SBR Customs Invoice";
            rec."SBR Customs Entry No." := WhseShipment."SBR Customs Entry No.";
            rec."SBR Customs Invoice Costs" := WhseShipment."SBR Customs Invoice Costs";
            rec."SBR Freight Invoice Costs" := WhseShipment."SBR Freight Invoice Costs";
            rec."SBR Freight Invoices" := WhseShipment."SBR Freight Invoices";
            rec."SBR Sales Header" := WhseShipment."SBR Sales Header";
            rec."SBR Carrier Rate" := WhseShipment."SBR Carrier Rate";
            UpdatePstdBaseonSL(WhseShipment, rec);//SBR-Jo M3974
            rec.Modify();
        end;
        UpdateDeliverOnTimeOrDelayed(rec);

    end;

    [EventSubscriber(ObjectType::Table, 7320, 'OnBeforeDeleteEvent', '', true, true)]//Sbr-Jo M3918
    local procedure onBeforeDeleteWhseShipment(var rec: Record "Warehouse Shipment Header");
    var

        PstedWhseShipment: Record "Posted Whse. Shipment Header";
    begin
        PstedWhseShipment.SetRange("Whse. Shipment No.", rec."No.");
        IF PstedWhseShipment.FindFirst() THEN begin
            PstedWhseShipment."SBR Quoted Price" := rec."SBR Quoted Price";
            PstedWhseShipment."SBR Customs Invoice" := rec."SBR Customs Invoice";
            PstedWhseShipment."SBR Customs Entry No." := rec."SBR Customs Entry No.";
            PstedWhseShipment."SBR Customs Invoice Costs" := rec."SBR Customs Invoice Costs";
            PstedWhseShipment."SBR Freight Invoice Costs" := rec."SBR Freight Invoice Costs";
            PstedWhseShipment."SBR Freight Invoices" := rec."SBR Freight Invoices";
            PstedWhseShipment."SBR Sales Header" := Rec."SBR Sales Header";
            PstedWhseShipment."SBR Carrier Rate" := Rec."SBR Carrier Rate";
            UpdatePstdBaseonSL(rec, PstedWhseShipment);//SBR-Jo M3974
            PstedWhseShipment.Modify();
        end;
    end;

    local procedure UpdatePstdBaseonSL(var rec: Record "Warehouse Shipment Header"; var PstedWhseShipment: Record "Posted Whse. Shipment Header");//SBR-Jo M3974
    var
        WhseShptHdr: Record "Warehouse Shipment Header";
        SalesLine: Record "Sales Line";
        SalesHeader: Record "Sales Header";
    begin
        IF WhseShptHdr.GET(rec."No.") then begin
            /*    IF SalesHeader.GET(SalesHeader."Document Type"::Order, WhseShptHdr."SBR Sales Header") then begin
                    SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                    SalesLine.SetRange("Document No.", SalesHeader."No.");
                    SalesLine.SetRange("Truck No.", rec."Truck No.");
                    IF SalesLine.FindSet() THEN begin
                        PstedWhseShipment."SBR Ship-To Code" := SalesLine."SBR Ship-To Code";
                        PstedWhseShipment."Truck No." := SalesLine."Truck No.";
                        PstedWhseShipment."SBR Sales Header" := SalesLine."Document No.";
                        PstedWhseShipment.Modify();
                    end;
                end;*/
            PstedWhseShipment."SBR Ship-To Code" := rec."SBR Ship-To Code";
            PstedWhseShipment."Truck No." := rec."Truck No.";
            PstedWhseShipment."SBR Sales Header" := rec."SBR Sales Header";
            PstedWhseShipment.Modify();
        END;

    END;

    [EventSubscriber(ObjectType::Table, 7322, 'OnAfterValidateEvent', 'Posting Date', true, true)]
    local procedure onAfterValidatePostingDatePostedWhseShptHdr(var rec: Record "Posted Whse. Shipment Header")
    var
        PstedWhseShipment: Record "Posted Whse. Shipment Header";
    begin
        UpdateDeliverOnTimeOrDelayed(rec);
    end;

    [EventSubscriber(ObjectType::Table, 7322, 'OnAfterValidateEvent', 'Shipment Date', true, true)]
    local procedure onAfterValidateReqDelDatePostedWhseShptHdr(var rec: Record "Posted Whse. Shipment Header")
    var
        PstedWhseShipment: Record "Posted Whse. Shipment Header";
    begin
        UpdateDeliverOnTimeOrDelayed(rec);
    end;

    local procedure UpdateDeliverOnTimeOrDelayed(var rec: Record "Posted Whse. Shipment Header")
    var
        PstdWhseShipment: Record "Posted Whse. Shipment Header";
        SalesHeader: Record "Sales Header";
    begin
        IF PstdWhseShipment.GET(rec."No.") then
            IF SalesHeader.GET(SalesHeader."Document Type"::Order, rec."SBR Sales Header") then
                IF Rec."Posting Date" > SalesHeader."Requested Delivery Date" then begin
                    Rec."SBR Deliver on time or Delayed" := Rec."SBR Deliver on time or Delayed"::Late;
                    rec.Modify();
                end;
    end;

    [EventSubscriber(ObjectType::Table, 7323, 'OnAfterValidateEvent', 'Posting Date', true, true)]
    local procedure onAfterValidatePostingDatePostedWhseShptLine(var rec: Record "Posted Whse. Shipment Line")
    begin
        UpdatePstedShptLine(rec);
    end;

    [EventSubscriber(ObjectType::Table, 7323, 'OnAfterValidateEvent', 'Shipment Date', true, true)]
    local procedure onAfterValidateReqDelDatePostedWhseShptLine(var rec: Record "Posted Whse. Shipment Line")
    begin
        UpdatePstedShptLine(rec);
    end;

    local procedure UpdatePstedShptLine(var rec: Record "Posted Whse. Shipment Line")
    var
        PstdWhseShipment: Record "Posted Whse. Shipment Header";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
    begin
        IF PstdWhseShipment.GET(rec."No.") then
            IF SalesHeader.GET(SalesHeader."Document Type"::Order, PstdWhseShipment."SBR Sales Header") then begin
                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange("Truck No.", rec."SBR Truck No.");
                IF SalesLine.FindSet() THEN begin
                    rec."SBR Total Watts" := 0;
                    repeat
                        rec."SBR Total Watts" += SalesLine."SBR Total Watts";
                    until SalesLine.Next = 0;
                END;

            end;

    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePurchRcptHeaderInsert', '', true, true)]
    local procedure onBeforeInsertPostedPurchaseReceiptHeader(VAR PurchRcptHeader: Record "Purch. Rcpt. Header";VAR PurchaseHeader: Record "Purchase Header")
    begin
        //PurchRcptHeader."SBR Sales Order No." := PurchaseHeader."SBR Sales Order No.";
        //PurchRcptHeader."SBR Watts" := PurchaseHeader."SBR Watts";
    end;

    [EventSubscriber(ObjectType::Codeunit, 90, 'OnBeforePurchInvHeaderInsert', '', true, true)]
    local procedure onBeforeInsertPostedPurchaseInvoiceHeader(VAR PurchInvHeader: Record "Purch. Rcpt. Header";VAR PurchHeader: Record "Purchase Header")
    begin
        //PurchInvHeader."SBR Sales Order No." := PurchHeader."SBR Sales Order No.";
        //PurchInvHeader."SBR Watts" := PurchHeader."SBR Watts";
    end;

    var
        skipFunc: Boolean;
}