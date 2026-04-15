# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9794-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  2BAC03  07MAY02  Module created                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9794-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9794";
        BusinessFunctionName = "AVE Reformat Control Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM9794";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Ingenium Plan Code";
    }

    INOUT MIR-CVG-STAT-TYP-CD
    {
        Key;
        Length = "6";
        CodeSource = "DataModel";
        CodeType = "CVG-STAT-TYP-CD";
        SType = "Selection";
        Label = "Coverage Type";
    }

    OUT MIR-PLAN-ID-T[20]
    {
        Length = "6";
        FieldGroup = "Table13";
        DBTableName = "TAVE";
        SType = "Text";
        Label = "Ingenium Plan Code";
        Index = "1";
    }

    OUT MIR-CVG-STAT-TYP-CD-T[20]
    {
        Length = "1";
        FieldGroup = "Table13";
        DBTableName = "TAVE";
        SType = "Text";
        Label = "Coverage Type";
        Index = "1";
    }

    OUT MIR-AVE-PLAN-ID-T[20]
    {
        Length = "8";
        FieldGroup = "Table13";
        DBTableName = "TAVE";
        SType = "Text";
        Label = "AVE Plan Code";
        Index = "1";
    }

    OUT MIR-PLAN-DESC-T[20]
    {
        Length = "40";
        FieldGroup = "Table13";
        DBTableName = "TAVE";
        SType = "Text";
        Label = "Plan Description";
        Index = "1";
    }





}


