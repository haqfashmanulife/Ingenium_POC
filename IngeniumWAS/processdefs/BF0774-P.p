# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0774-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0774-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0774";
        BusinessFunctionName = "Plan Rate Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM3000";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Plan";
    }

    INOUT MIR-PLAN-RT-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "PLAN-RT-TYP-CD";
        DBTableName = "TPLRT";
        SType = "Selection";
        Label = "Plan Rate Type";
    }

    OUT MIR-PLAN-RT-TYP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PLAN-RT-TYP-CD";
        DBTableName = "TPLRT";
        SType = "Text";
        Label = "Plan Rate Type";
        Index = "1";
    }

    OUT MIR-RH-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "RHDR";
        DBTableName = "TPLRT";
        SType = "Text";
        Label = "Rate Header Pointer";
        Index = "1";
    }

}

