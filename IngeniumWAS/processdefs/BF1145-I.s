# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:35 PM EDT

#*******************************************************************************
#*  Component:   BF1145-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016107  602J     Automatic Face Reduction for Variable Products            *
#*  016736  611J     Code Cleanup - delete Net/Gross Reason code               *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1145-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Fsurrf";
        Type = "Input";
        FocusField = "MIR-FIA-VALU-SURR-PCT-T[1]";
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

    IN MIR-CIA-SRC-DEST-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        SType = "Text";
        Label = "Destination of Surrender Amount";
    }

    IN MIR-CIA-TAXWH-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-TAXWH-IND";
        SType = "Text";
        Label = "Tax withholding";
    }


    #	IN MIR-DV-CIA-REASN-CD 
    #	{
    #		DisplayOnly;
    #		Length = "3";
    #		CodeSource = "DataModel": RT;
    #		CodeType = "DV-CIA-REASN-CD": RT;
    #		SType = "Text": RT;
    #		Label = "DV_CIA_REASN_CD";
    #	}

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUPRES-CNFRM-IND";
        SType = "Text";
        Label = "Confirmation";
    }

    IN MIR-DV-REDC-FACE-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-REDC-FACE-IND";
        SType = "Indicator";
        Label = "Override automatic face reduction";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BNK-ACCT-HLDR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-DV-FROM-FND-AMT-T[139]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "From fund";
        Index = "1";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CIA-LOAD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        Decimals = "0";
        SType = "Currency";
        Label = "Charges";
    }

    IN MIR-DV-CFN-APROX-AMT-T[139]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-FND-DESC-TXT-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        KeyColumn;
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }

    INOUT MIR-FIA-VALU-SURR-PCT-T[139]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table139";
        SType = "Percent";
        Label = "Percentage of Fund Surrendered";
        Index = "1";
    }

}

