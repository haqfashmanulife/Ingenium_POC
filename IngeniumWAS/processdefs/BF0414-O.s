# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:22 PM EDT

#*******************************************************************************
#*  Component:   BF0414-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0414-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Clmlist";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-DI-CLM-ID";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-DI-CLM-ID
    {
        Key;
        Length = "6";
        DefaultSession = "MIR-DI-CLM-ID";
        SType = "Text";
        Label = "Claim Number";
    }

    IN MIR-CLI-ID-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-CLM-CLOS-REASN-CD-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "CLSRE";
        SType = "Text";
        Label = "Claim Closed Reason";
        Index = "1";
    }

    IN MIR-CLM-CRNT-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CLM-CRNT-STAT-CD";
        SType = "Text";
        Label = "Claim Overall Status";
        Index = "1";
    }

    IN MIR-DI-CLM-CLOS-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Claim Closed Date";
        Index = "1";
    }

    IN MIR-DI-CLM-ID-T[100]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Claim Number";
        Index = "1";
    }

    IN MIR-DISAB-REASN-CD-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        CodeSource = "EDIT";
        CodeType = "DISRE";
        SType = "Text";
        Label = "Disability Reason";
        Index = "1";
    }

    IN MIR-INSRD-DISAB-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Date Insured Disabled";
        Index = "1";
    }

    IN MIR-INSRD-DISAB-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "INSRD-DISAB-TYP-CD";
        SType = "Text";
        Label = "Disability Type";
        Index = "1";
    }

}

