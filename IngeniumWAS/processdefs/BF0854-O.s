# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:30 PM EDT

#*******************************************************************************
#*  Component:   BF0854-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016737  611J     Code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************
#*****************************************************************************
#  Revisions 10/29/1999 - Changed table occurs to 45 (from 139)              *
#  Revisions 11/05/1999 - Changed KEY field attributes			     *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*****************************************************************************	

S-STEP BF0854-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END

    INOUT MIR-CDI-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
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
        SType = "Selection";
        Label = "Allocation Type";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CDI-EFF-DT-T[45]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table45";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-CDI-STAT-CD-T[45]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table45";
        CodeSource = "DataModel";
        CodeType = "CDI-STAT-CD";
        SType = "Text";
        Label = "Allocation Status";
        Index = "1";
    }

    IN MIR-DV-POL-PAYO-TYP-CD-T[45]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table45";
        CodeSource = "DataModel";
        CodeType = "DV-POL-PAYO-TYP-CD";
        Link;
        SType = "Text";
        Label = "Allocation Type";
        Index = "1";
    }

}

