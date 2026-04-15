# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:14 PM EDT

#*******************************************************************************
#*  Component:   AppBF0852-P.p                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP AppBF0852-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0852";
        BusinessFunctionName = "Policy Allocation Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM3240";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CDI-ALLOC-PCT-T[20]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Percent";
        Label = "Allocation Percentage";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[20]
    {
        Key;
        Mandatory;
        Length = "2";
        FieldGroup = "Table139";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-FND-ID-T[20]
    {
        Key;
        Mandatory;
        Length = "40";
        FieldGroup = "Table139";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    IN MIR-CDI-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSI";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DV-POL-PAYO-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-POL-PAYO-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Allocation Type";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CDI-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CDI-STAT-CD";
        DBTableName = "TCAIN";
        SType = "Text";
        Label = "Allocation Status";
    }

}

