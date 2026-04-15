# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppAgentSearch.s                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016103  6.1.1J   Added Search Language Group Code                          *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB01  GW       Added MIR-SO-ID-T - Sales Office field.                   *
#*                                                                             *
#*******************************************************************************

S-STEP AppAgentSearch
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-ENTR-SUR-NM";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-ENTR-SUR-NM
    {
        Key;
        Mandatory;
        Length = "25";
        SType = "Text";
        Label = "Agent's Last Name";
    }

    INOUT MIR-ENTR-GIV-NM
    {
        Key;
        Length = "25";
        SType = "Text";
        Label = "Agent's First Name";
    }

    IN MIR-DV-SRCH-CLI-NM-T[50]
    {
        DisplayOnly;
        KeyColumn;
        Length = "75";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Agent Name";
        Index = "1";
    }

    IN MIR-AGT-ID-T[50]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    IN MIR-AGT-CLAS-LIC-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-CLAS-LIC-CD";
        SType = "Text";
        Label = "Class License";
        Index = "1";
    }

    IN MIR-AGT-CMPNST-SCHD-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-CMPNST-SCHD-CD";
        SType = "Text";
        Label = "Contract Type";
        Index = "1";
    }

    IN MIR-AGT-LOC-LIC-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-LOC-LIC-CD";
        SType = "Text";
        Label = "Location License";
        Index = "1";
    }

    IN MIR-AGT-STAT-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "AGT-STAT-CD";
        SType = "Text";
        Label = "Agent Status";
        Index = "1";
    }

    IN MIR-BR-ID-T[50]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
        Index = "1";
    }

    IN MIR-SO-ID-T[50]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "SALE";
        SType = "Text";
        Label = "Sales Office";
        Index = "1";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        DefaultConstant = "KJ";
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

}

