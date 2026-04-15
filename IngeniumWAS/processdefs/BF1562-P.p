# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1562-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1562-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1562";
        BusinessFunctionName = "Select Coverages to Update - Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM3500";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CVG-CSTAT-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TSCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    INOUT MIR-CVG-FACE-AMT-T[20]
    {
        Length = "15";
        FieldGroup = "Table20";
        DBTableName = "TSCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    INOUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-CVG-UWGDECN-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        DBTableName = "TSCVG";
        SType = "Selection";
        Label = "Coverage Decision";
        Index = "1";
    }

    INOUT MIR-PLAN-ID-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    INOUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TSPOL";
        SType = "Text";
        Label = "Policy Status";
    }

    INOUT MIR-SPND-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TSPND";
        SType = "Text";
        Label = "Policy Status";
    }

    INOUT MIR-SPND-POL-EFF-DT
    {
        Length = "10";
        DBTableName = "TSPND";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-SPND-POL-REASN-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "STOPR";
        DBTableName = "TSPND";
        SType = "Text";
        Label = "Suspend Reason";
    }

    INOUT MIR-SPND-POL-REDT-IND
    {
        Length = "1";
        DBTableName = "TSPND";
        SType = "Indicator";
        Label = "Policy redating allowed";
    }

    INOUT MIR-SPND-POL-UWG-IND
    {
        Length = "1";
        DBTableName = "TSPND";
        SType = "Indicator";
        Label = "Underwriting required";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

}

