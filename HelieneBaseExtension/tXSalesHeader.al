tableextension 59116 SalesHeaderExt extends "Sales Header"
{
    fields
    {

        field(59100; "TotalWattage"; Decimal)
        {
            Caption = 'Total Watts';
            DataClassification = ToBeClassified;
        }
        field(59101; "SBR Approval Boolean A"; Boolean)
        {
            Caption = 'Approval Boolean A';
        }
        field(59102; "SBR Approval Boolean B"; Boolean)
        {
            Caption = 'Approval Boolean B';
        }
        field(59103; "SBR Approval Boolean C"; Boolean)
        {
            Caption = 'Approval Boolean C';
        }
        field(59104; "SBR Date Req to Archive"; Date)
        {
            Caption = 'Date Req to Archive';
        }
        field(59105; "SBR Bool Req to Archive"; Boolean)
        {
            Caption = 'Bool Req to Archive';
        }

        // HEL11.00 / 0005558 / SGR / 2020-04-28 BEGIN
        field(59150; "SBRHEL Truck No."; Option)
        {
            Caption = 'Truck No.';
            OptionMembers = "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211", "212", "213", "214", "215", "216", "217", "218", "219", "220", "221", "222", "223", "224", "225", "226", "227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260", "261", "262", "263", "264", "265", "266", "267", "268", "269", "270", "271", "272", "273", "274", "275", "276", "277", "278", "279", "280", "281", "282", "283", "284", "285", "286", "287", "288", "289", "290", "291", "292", "293", "294", "295", "296", "297", "298", "299", "300", "301", "302", "303", "304", "305", "306", "307", "308", "309", "310", "311", "312", "313", "314", "315", "316", "317", "318", "319", "320", "321", "322", "323", "324", "325", "326", "327", "328", "329", "330", "331", "332", "333", "334", "335", "336", "337", "338", "339", "340", "341", "342", "343", "344", "345", "346", "347", "348", "349", "350";
            Editable = false;
        }
        field(59151; "SBRHEL Ship-To Code"; Code[10])
        {
            Caption = 'Ship-To Code';
            TableRelation = "Ship-to Address".Code;
            Editable = false;            
        }
        field(59152; "SBRHEL Sales Header"; Code[20])
        {
            Caption = 'Sales Header';
            TableRelation = "Sales Header"."No.";
            Editable = false;            
        }
        field(59153; "SBRHEL Quoted Price"; Decimal)
        {
            Caption = 'Quoted Price';
            Editable = false;            
        }
        field(59154; "SBRHEL Customer Name"; Code[50])
        {
            Caption = 'Customer Name';
            Editable = false;            
        }
        field(59155; "SBRHEL Module Count"; Decimal)
        {
            Caption = 'Module Count';
            Editable = false;            
        }
        field(59156; "SBRHEL Freight Invoices"; Text[30])
        {
            Caption = 'Freight Invoices';
            Editable = false;            
        }
        field(59157; "SBRHEL Freight Invoice Costs"; Decimal)
        {
            Caption = 'Freight Invoice Costs';
            Editable = false;            
        }
        field(59158; "SBRHEL Customs Invoice"; Text[30])
        {
            Caption = 'Customs Invoice';
            Editable = false;            
        }
        field(59159; "SBRHEL Customs Invoice Costs"; Decimal)
        {
            Caption = 'Customs Invoice Costs';
            Editable = false;            
        }
        field(59160; "SBRHEL Customs Entry No."; Text[30])
        {
            Caption = 'Customs Entry No.';
            Editable = false;            
        }
        field(59161; "SBRHEL Carrier Rate"; Decimal)
        {
            Caption = 'Carrier Rate';
            Editable = false;            
        }
        field(59162; "SBRHEL Total Watts Per Truck"; Decimal)
        {
            Caption = 'Total Watts Per Truck';
            Editable = false;            
        }
        field(59163; "SBRHEL Deliver on Time or Delayed"; Option)
        {
            Caption = 'Deliver on time or Delayed';
            OptionMembers = "On Time",Delayed,Late;            
        }
        field(59164; "SBRHEL Reasoning for Delay"; Text[50])
        {
            Caption = 'Reasoning for Delay';            
        }

        field(59165; "SBRHEL Linked Customer No."; Code[20])
        {
            Caption = 'Linked Customer No.';            
            Editable = false;         
        }
        field(59166; "SBRHEL Linked Sales Order No."; Code[20])
        {
            Caption = 'Linked Sales Order No.';

            trigger OnValidate();
            var
                SalesSetup: Record "Sales & Receivables Setup";
                SalesHeader: Record "Sales Header";
            begin                
                if ("SBRHEL Linked Sales Order No." = '') and
                    (xRec."SBRHEL Linked Sales Order No." <> "SBRHEL Linked Sales Order No." )
                then begin  
                    SalesSetup.Get;
                    SalesSetup.TestField("SBRHEL US Company Name");
                    SalesHeader.ChangeCompany(SalesSetup."SBRHEL US Company Name");
                    if SalesHeader.Get(SalesHeader."Document Type"::Order,xRec."SBRHEL Linked Sales Order No.") then begin 
                        SalesHeader."SBRHEL Linked Sales Order No." := '';
                        SalesHeader."SBRHEL Linked Customer No." := '';
                        SalesHeader."SBRHEL Linked Customer Name" := '';
                        SalesHeader.Modify;

                        "SBRHEL Linked Customer No." := '';
                        "SBRHEL Linked Customer Name" := '';
                    end;
                end else
                    Error('');
            end;          
        }
        field(59167; "SBRHEL Linked Customer Name"; Text[50])
        {
            Caption = 'Linked Customer Name';            
            Editable = false;         
        }
        modify("Posting Date")
        {
            trigger OnAfterValidate()
            begin
                if "Posting Date" <> xRec."Posting Date" then
                    SBRCustManagementG.SetDeliveronTimeorDelayedOnSalesHeader(Rec);
            end;
        }
        modify("Requested Delivery Date")
        {
            trigger OnAfterValidate()
            begin
                if "Requested Delivery Date" <> xRec."Requested Delivery Date" then
                    SBRCustManagementG.SetDeliveronTimeorDelayedOnSalesHeader(Rec);
            end;
        }                        
        // HEL11.00 / 0005558 / SGR / 2020-04-28 END
    }

    // HEL11.00 / 0005558 / SGR / 2020-06-09 BEGIN
    var
        SBRCustManagementG: Codeunit "SBRCust Management";
    // HEL11.00 / 0005558 / SGR / 2020-06-09 END
}