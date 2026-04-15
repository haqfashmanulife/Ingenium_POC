# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0854-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0854-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0854";
        BusinessFunctionName = "Coverage Allocation List";
     #  BusinessFunctionName = "Policy Allocation List";
        BusinessFunctionType = "List";
        MirName = "CCWM3240";
    }


    #*****************************************************************************
    #  Revisions 10/29/1999 - Changed table occurs to 45 (from 139)              *
    #*****************************************************************************  

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CDI-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSI";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-POL-PAYO-TYP-CD
    {
        Key;
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

    OUT MIR-CDI-EFF-DT-T[45]
    {
        Length = "10";
        FieldGroup = "Table45";
        DBTableName = "TCDSI";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
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

    OUT MIR-CDI-STAT-CD-T[45]
    {
        Length = "40";
        FieldGroup = "Table45";
        CodeSource = "DataModel";
        CodeType = "CDI-STAT-CD";
        DBTableName = "TCAIN";
        SType = "Text";
        Label = "Allocation Status";
        Index = "1";
    }

    OUT MIR-DV-POL-PAYO-TYP-CD-T[45]
    {
        Length = "40";
        FieldGroup = "Table45";
        CodeSource = "DataModel";
        CodeType = "DV-POL-PAYO-TYP-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Allocation Type";
        Index = "1";
    }

}

