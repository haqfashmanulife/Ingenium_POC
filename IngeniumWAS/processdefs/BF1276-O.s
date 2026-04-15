# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1276-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

S-STEP BF1276-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Pollist";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DI-CLM-ID
    {
        Key;
        Length = "6";
        DefaultSession = "MIR-DI-CLM-ID";
        SType = "Text";
        Label = "Claim Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
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

    IN MIR-CVG-BNFT-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CVG-BNFT-STAT-CD";
        SType = "Text";
        Label = "Benefit Status";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-MTHLY-BNFT-AMT-T[100]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Current Monthly Benefit Amount";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[100]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

}

