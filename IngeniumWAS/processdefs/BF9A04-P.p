# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9A04-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPPU  CTS      NEW PLAN PAYOUT METHOD LIST                               *
#*******************************************************************************

P-STEP BF9A04-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A04";
        BusinessFunctionName = "Policy Payout Method List";
        BusinessFunctionType = "List";
        MirName = "CCWM9A00";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LOC-GR-ID
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPPMS";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-PAYO-PLAN-MTHD-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PAYO-PLAN-MTHD-CD";
        DBTableName = "TPPMS";
        SType = "Selection";
        Label = "Payout Method";
    }

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

    OUT MIR-LOC-GR-ID-T[12]
    {
        Length = "3";
        KeyColumn;
        CodeSource = "EDIT";
        FieldGroup = "Table12";
        CodeType = "LOCGP";
        DBTableName = "TPPMS";
        SType = "Selection";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-PAYO-PLAN-MTHD-CD-T[12]
    {
        Length = "2";
        CodeSource = "DataModel";
        FieldGroup = "Table12";
        CodeType = "PAYO-PLAN-MTHD-CD";
        DBTableName = "TPPMS";
        SType = "Selection";
        Label = "Payout Method";
        Index = "1";
    }

    OUT MIR-PLAN-MTHD-DFLT-IND-T[12]
    {
        Length = "1";
        DBTableName = "TPPMS";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Default";
        Index = "1";
    }

    OUT MIR-PAYO-PLAN-LEAD-MTHD-CD-T[12]
    {
        Length = "2";
        CodeSource = "EDIT";
        FieldGroup = "Table12";
        CodeType = "LTMD";
        DBTableName = "TPPMS";
        SType = "Selection";
        Label = "Lead Time Method";
        Index = "1";
    }
    OUT MIR-PAYO-PLAN-LEAD-DUR-T[12]
    {
        Length = "3";
        DBTableName = "TPPMS";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Lead Time";
        Index = "1";
    }
    OUT MIR-LEAD-TIME-TYP-CD-T[12]
    {
        Length = "2";
        CodeSource = "EDIT";
        FieldGroup = "Table12";
        CodeType = "POTYP";        
        DBTableName = "TPPMS";        
        SType = "Text";
        Label = "Lead Time Type";
        Index = "1";
    }

}

