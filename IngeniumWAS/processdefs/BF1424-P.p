# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF1424-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01CP02  CSS      Added Sales Office field                                  * 
#*                                                                             *
#*******************************************************************************

P-STEP BF1424-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1424";
        BusinessFunctionName = "Agent Record List";
        BusinessFunctionType = "List";
        MirName = "CCWM0081";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-AGT-ID
    {
        Key;
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    OUT MIR-AGT-CMPNST-SCHD-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "AGT-CMPNST-SCHD-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Contract Type";
        Index = "1";
    }

    OUT MIR-AGT-ID-T[12]
    {
        Length = "6";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    OUT MIR-AGT-STAT-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent Status";
        Index = "1";
    }

    OUT MIR-BR-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Branch";
        Index = "1";
    }

    OUT MIR-SO-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Sales Office";
        Index = "1";
    }

    OUT MIR-DV-AGT-CLI-NM-T[12]
    {
        Length = "30";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    OUT MIR-OVRID-BASE-AGT-ID-T[12]
    {
        Length = "6";
        FieldGroup = "Table12";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Override Key";
        Index = "1";
    }

    OUT MIR-OVRID-ID-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Override Situation";
        Index = "1";
    }

}

