# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:45 PM EDT

#*******************************************************************************
#*  Component:   BF1814-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1814-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1814";
        BusinessFunctionName = "Plan Description Record List";
        BusinessFunctionType = "List";
        MirName = "CCWM0111";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

    OUT MIR-APP-FORM-TYP-ID-T[13]
    {
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TAFTT";
        SType = "Text";
        Label = "Application Form Type";
        Index = "1";
    }

    OUT MIR-LOC-GR-COLCT-ID-T[13]
    {
        Length = "6";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "LOCPT";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Group Location Pointer";
        Index = "1";
    }

    OUT MIR-PLAN-EFF-DT-T[13]
    {
        Length = "10";
        FieldGroup = "Table13";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Plan Effective Date";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[13]
    {
        Length = "40";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPH";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    OUT MIR-PLAN-INS-TYP-CD-T[13]
    {
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "PLAN-INS-TYP-CD";
        DBTableName = "TPD";
        SType = "Text";
        Label = "Type of Insurance";
        Index = "1";
    }

    OUT MIR-PLAN-UWG-IND-T[13]
    {
        Length = "40";
        FieldGroup = "Table13";
        DBTableName = "TPD";
        SType = "Indicator";
        Label = "Underwriting Required Indicator";
        Index = "1";
    }

    OUT MIR-PLAN-XPRY-DT-T[13]
    {
        Length = "10";
        FieldGroup = "Table13";
        DBTableName = "TPH";
        SType = "Date";
        Label = "Plan Expiry Date";
        Index = "1";
    }

}

