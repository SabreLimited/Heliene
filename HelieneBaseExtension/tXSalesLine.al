// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

/*pageextension 59100 CustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}*/

tableextension 59100 SalesLineExt extends "Sales Line"
{
    fields
    {
        field(59100; "Truck No."; Option)
        {

            Caption = 'Truck No.';
            DataClassification = ToBeClassified;
            OptionMembers = "0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77","78","79","80","81","82","83","84","85","86","87","88","89","90","91","92","93","94","95","96","97","98","99","100","101","102","103","104","105","106","107","108","109","110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","127","128","129","130","131","132","133","134","135","136","137","138","139","140","141","142","143","144","145","146","147","148","149","150","151","152","153","154","155","156","157","158","159","160","161","162","163","164","165","166","167","168","169","170","171","172","173","174","175","176","177","178","179","180","181","182","183","184","185","186","187","188","189","190","191","192","193","194","195","196","197","198","199","200","201","202","203","204","205","206","207","208","209","210","211","212","213","214","215","216","217","218","219","220","221","222","223","224","225","226","227","228","229","230","231","232","233","234","235","236","237","238","239","240","241","242","243","244","245","246","247","248","249","250","251","252","253","254","255","256","257","258","259","260","261","262","263","264","265","266","267","268","269","270","271","272","273","274","275","276","277","278","279","280","281","282","283","284","285","286","287","288","289","290","291","292","293","294","295","296","297","298","299","300","301","302","303","304","305","306","307","308","309","310","311","312","313","314","315","316","317","318","319","320","321","322","323","324","325","326","327","328","329","330","331","332","333","334","335","336","337","338","339","340","341","342","343","344","345","346","347","348","349","350";
        }
        field(59101; "Watts"; Decimal)
        {
            Caption = 'Watts';
            DataClassification = ToBeClassified;
        }
        field(59102; "CostPerWatt"; Decimal)
        {
            Caption = 'Cost Per Watt';
            DataClassification = ToBeClassified;
            DecimalPlaces = 4 : 5;
        }
        field(59103; "PricePerWatt"; Decimal)
        {
            Caption = 'Price Per Watt';
            DataClassification = ToBeClassified;
            DecimalPlaces = 4 : 5;
        }
        field(59104; "SBR WarehouseShipmentHeader"; Code[50])
        {
            Caption = 'Warehouse Shipment Header';
            DataClassification = ToBeClassified;
        }
        field(59105; "SBR Ship-To Code"; Code[10])
        {
            Caption = 'Ship-To Code';
            DataClassification = ToBeClassified;
            TableRelation = "Ship-to Address".Code WHERE ("Customer No." = FIELD ("Sell-to Customer No."));
        }
        field(59106; "SBR Total Watts"; Decimal)
        {
            Caption = 'Total Watts';
        }
        field(59107; "SBR Production Order Line Number"; Code[20])
        {
            Caption = 'Prod order Line No.';
            Editable = false;
        }
        field(59108; "SBR Production Order Quantity"; Integer)
        {
            Caption = 'Production Order Quantity';
            Editable = false;
        }
        field(59109; "SBR Production Order Finished Qty"; Integer)
        {
            Caption = 'Production Order Finished Qty';
            Editable = false;
        }
        field(59110; "SBR Production Order Remaining Qty"; Integer)
        {
            Caption = 'Production Order Remaining Qty';
            Editable = false;
        }
        field(59111; "SBR Prod Order Line Number"; Integer)
        {
            Caption = 'Production Order Line Number';
            Editable = false;
        }
        field(59120;"SBR_Prod. Order No."; Code[20]){
            Caption = 'Production Order No.';
        }
        // Add changes to table fields here
    }

    var
        myInt: Integer;
}