# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppAddressListJP.s                                           *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppAddressListJP
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "SELECT-T[1]";
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

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Owner Client ID";
    }

    IN MIR-ADDR-EFF-DT-NUM-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Address Effective Date";
        Index = "1";
    }

    IN MIR-ADDR-END-DT-NUM-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "End Date";
        Index = "1";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-T[12]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    IN MIR-CLI-ADDR-SEQ-NUM-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-CLI-ADDR-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
        Index = "1";
    }

    IN MIR-CLI-ADDR-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        Link;
        SType = "Text";
        Label = "Address Type";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CLI-CITY-NM-TXT-T[12]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    IN MIR-CLI-CRNT-LOC-CD-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Province/State";
        Index = "1";
    }

}

