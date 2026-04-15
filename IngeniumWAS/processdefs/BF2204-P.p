# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:50 PM EDT

#*******************************************************************************
#*  Component:   BF2204-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016103  6.11J    Search Enhancements fo Japanese                           *
#*                                                                             *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB01  GW       Added MIR-SO-ID-T - Sales Office field.                   *
#*                                                                             *
#*******************************************************************************

P-STEP BF2204-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2204";
        BusinessFunctionName = "Agent Search";
        BusinessFunctionType = "List";
        MirName = "CCWM2204";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-ENTR-GIV-NM
    {
        Key;
        Length = "25";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "First Name";
    }

    IN MIR-ENTR-SUR-NM
    {
        Key;
        Mandatory;
        Length = "25";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-DV-SRCH-GR-CD
    {
        Mandatory;
        Length = "02";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Search Language Group";
    }

    OUT MIR-AGT-CLAS-LIC-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-CLAS-LIC-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Class License";
        Index = "1";
    }

    OUT MIR-AGT-CMPNST-SCHD-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-CMPNST-SCHD-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Contract Type";
        Index = "1";
    }

    OUT MIR-AGT-ID-T[50]
    {
        Length = "6";
        FieldGroup = "Table50";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    OUT MIR-AGT-LOC-LIC-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-LOC-LIC-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Location License";
        Index = "1";
    }

    OUT MIR-AGT-STAT-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent Status";
        Index = "1";
    }

    OUT MIR-BR-ID-T[50]
    {
        Length = "5";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Branch";
        Index = "1";
    }

    OUT MIR-SO-ID-T[50]
    {
        Length = "5";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "SALE";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Sales Office";
        Index = "1";
    }

    OUT MIR-DV-SRCH-CLI-NM-T[50]
    {
        Length = "75";
        FieldGroup = "Table50";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

}

