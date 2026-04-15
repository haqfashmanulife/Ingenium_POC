# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AddUpdtCvgBene.s                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  02NB64  WBP      New                                                       *
#*                                                                             *
#*******************************************************************************

S-STEP AddUpdtCvgBene
{
    ATTRIBUTES
    {
        Type = "List";
        FocusField = "nextButton";
        FocusFrame = "ButtonFrame";
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

    # SELECTION LIST PART OF PAGE

    IN MIR-CLI-ID-T[20] 
    {
      DisplayOnly;
      Length = "10";
      FieldGroup = "Table20";
      Index = "1";
      SType = "Text";
      Label = "Client ID";
    }

    IN MIR-DV-CLI-NM-T[20] 
    {
      DisplayOnly;
      Length = "75";
      FieldGroup = "Table20";
      Index = "1";
      SType = "Text";
      Label = "Client Name";
    }

    # DISPLAY ONLY FIELDS FOR LIST PART OF PAGE

    IN MIR-INSRD-CLI-NM-T[12]
    {
        DisplayOnly;
        Length = "54";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Insured's Name";
        Index = "1";
    }

    IN MIR-BNFY-NM-T[12]
    {
        DisplayOnly;
        Length = "54";
        FieldGroup = "Table12";
        KeyColumn;
        SType = "Text";
        Label = "Beneficiary's Name";
        Index = "1";
    }

    IN MIR-BNFY-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        Link;
        SType = "Text";
        Label = "Beneficiary Type";
        Index = "1";
    }

    IN MIR-BNFY-DESGNT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        SType = "Text";
        Label = "Designation";
        Index = "1";
    }

    IN MIR-BNFY-PRCDS-PCT-T[12]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table12";
        SType = "Percent";
        Label = "Percentage";
        Index = "1";
    }

    IN MIR-BNFY-REL-INSRD-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "BTOI";
        SType = "Text";
        Label = "Relation to Insured";
        Index = "1";
    }

    # remaining fileds not being used at the present time

    INOUT MIR-INSRD-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
    #   DefaultSession = "MIR-INSRD-CLI-ID";
        SType = "Text";
        Label = "Insured's Client Id";
    }

    INOUT MIR-BNFY-PRCDS-PCT
    {
        Mandatory;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Percentage";
    }

    INOUT MIR-BNFY-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BNFY-TYP-CD";
        SType = "Selection";
        Label = "Beneficiary Type";
    }

    INOUT MIR-BNFY-REL-INSRD-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTOI";
        SType = "Selection";
        Label = "Relation to Insured";
    }

    INOUT MIR-BNFY-MINR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Beneficiary is a minor";
    }

    INOUT MIR-BNFY-NM
    {
        Length = "54";
        SType = "Text";
        Label = "Beneficiary's Name";
    }

    INOUT MIR-BNFY-DESGNT-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "BNFY-DESGNT-CD";
        SType = "Selection";
        Label = "Designation";
    }

}

