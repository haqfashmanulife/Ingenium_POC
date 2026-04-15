# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppAddressUpdateJP.s                                         *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppAddressUpdateJP
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-ADDR-EFF-DT-NUM";
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

    IN MIR-DV-RQST-PSTL-ADDR-GR-KJ;

    IN MIR-DV-RQST-PSTL-ADDR-GR-KA;

    IN MIR-DV-RQST-PSTL-ADDR-LN-1-TXT;

    IN MIR-DV-RQST-PSTL-ADDR-LN-2-TXT;

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

    INOUT MIR-ADDR-EFF-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "Address Effective Date";
    }

    INOUT MIR-ADDR-END-DT-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "End Date";
    }

    INOUT MIR-CLI-ADDR-LN-1-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-2-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address Line 2";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-3-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address Line 3";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-STAT-CD-T[1]
    {
        Length = "1";
        FieldGroup = "Table2";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Selection";
        Label = "Address Status";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-YR-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Years at Address";
    }

    INOUT MIR-CLI-CITY-NM-TXT-T[1]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province/State";
    }

    INOUT MIR-CLI-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    INOUT MIR-CLI-RES-NUM-T[1]
    {
        Length = "5";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    INOUT MIR-CLI-RES-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Selection";
        Label = "Residence Type";
    }

    IN MIR-CLI-ADDR-SEQ-NUM
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ADDR-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
    }

    INOUT MIR-CLI-JP-ADDR-CD-T[1]
    {
        Length = "11";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Japanese Address Code";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT-T[1]
    {
        Length = "60";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Additional Information";
        Index = "1";
    }

    IN MIR-PSTL-ADDR-LN-1-TXT
    {
        Label = "Line 1 Options";
        SType = "Selection";
        Length = "30";
        CodeSource = "CSOM4915";
        FilterFields = "4";
        FilterField1 = "MIR-CLI-PSTL-CD";
        FilterField2 = "MIR-CLI-CTRY-CD";
        FilterField3 = "MIR-DV-RQST-PSTL-ADDR-GR-KJ";
        FilterField4 = "MIR-DV-RQST-PSTL-ADDR-LN-1-TXT";
    }

    IN MIR-PSTL-ADDR-LN-2-TXT
    {
        Label = "Line 2 Options";
        SType = "Selection";
        Length = "30";
        CodeSource = "CSOM4915";
        FilterFields = "4";
        FilterField1 = "MIR-CLI-PSTL-CD";
        FilterField2 = "MIR-CLI-CTRY-CD";
        FilterField3 = "MIR-DV-RQST-PSTL-ADDR-GR-KJ";
        FilterField4 = "MIR-DV-RQST-PSTL-ADDR-LN-2-TXT";
    }

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

}

