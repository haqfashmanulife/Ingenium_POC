# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:16 PM EDT

#*******************************************************************************
#*  Component:   BF0115-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0115-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0115";
        BusinessFunctionName = "Fund Unit Value Next Valuation Date";
        BusinessFunctionType = "Nextdate";
        MirName = "SCWM0110";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FND-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFV";
        SType = "Selection";
        Label = "Fund";
    }

    INOUT MIR-FND-NXT-VALN-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFH";
        SType = "Date";
        Label = "Next Fund Valuation Date";
    }

    INOUT MIR-FNDVL-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFV";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Fund Valuation Date";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

    OUT MIR-DV-PRCES-OVRID-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Override Indicator";
    }

    OUT MIR-FND-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "FND-TYP-CD";
        DBTableName = "TFH";
        SType = "Text";
        Label = "Fund Type";
    }

}

