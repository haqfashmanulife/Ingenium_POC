# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppCompCreateJP.s                                            *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppCompCreateJP
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CLI-ENTR-CO-NM-T[1]";
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

    IN MIR-DV-RQST-PSTL-ADDR-GR-KJ;

    IN MIR-DV-RQST-PSTL-ADDR-GR-KA;

    IN MIR-DV-RQST-PSTL-ADDR-LN-1-TXT;

    IN MIR-DV-RQST-PSTL-ADDR-LN-2-TXT;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-CLI-ADDR-LN-1-TXT-T[2]
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-2-TXT-T[2]
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-3-TXT-T[2]
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-STAT-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table5";
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

    INOUT MIR-CLI-CITY-NM-TXT-T[2]
    {
        Length = "25";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "City";
        Index = "1";
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
        CodeType = "PSTL-ADDR-LN-1-TXT";
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

    INOUT MIR-CLI-CNFD-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    INOUT MIR-CLI-CO-NM-T[1]
    {
        Length = "50";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Company Name";
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
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-ENTR-CO-NM-T[2]
    {
        Length = "50";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Company Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-GIV-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-PREV-GIV-NM-T[6]
    {
        Length = "25";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "First Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-PREV-SUR-NM-T[6]
    {
        Length = "25";
        FieldGroup = "Table1";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    INOUT MIR-CLI-ENTR-SUR-NM-T[2]
    {
        Length = "25";
        FieldGroup = "Table3";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }

    INOUT MIR-CLI-LANG-CD
    {
        Length = "1";
        DefaultConstant = "J";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Correspondence Language";
    }

    INOUT MIR-CLI-LEGIT-DUP-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Legitimate duplicate - Do not consolidate";
    }

    INOUT MIR-CLI-PREV-ADDR-LN-1-TXT-T[4]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-ADDR-LN-2-TXT-T[4]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-ADDR-YR-DUR-T[4]
    {
        Length = "3";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Years at Address";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-CITY-NM-TXT-T[4]
    {
        Length = "25";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-CRNT-LOC-CD-T[4]
    {
        Length = "2";
        FieldGroup = "Table2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Selection";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        Label = "Province/State";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-CTRY-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Country";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-PSTL-CD-T[4]
    {
        Length = "9";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-RES-NUM-T[4]
    {
        Length = "5";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    INOUT MIR-CLI-PREV-RES-TYP-CD-T[4]
    {
        Length = "40";
        FieldGroup = "Table2";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Selection";
        Label = "Residence Type";
        Index = "1";
    }

    IN MIR-CLI-PREV-JP-ADDR-CD-T[4]
    {
        Length = "11";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "JP Address Code";
        Index = "1";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    INOUT MIR-CLI-RES-NUM-T[2]
    {
        Length = "5";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Apt/Unit #";
        Index = "1";
    }

    INOUT MIR-CLI-RES-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Selection";
        Label = "Residence Type";
    }

    INOUT MIR-CLI-SMKR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        SType = "Selection";
        Label = "Smoker";
    }

    INOUT MIR-CLI-TAX-ID
    {
        Length = "9";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    INOUT MIR-DV-UPDT-ADDR-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Update previous address";
    }

    INOUT MIR-DV-UPDT-NM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Update previous name";
    }

    INOUT MIR-EMPLR-ADDR-1-TXT-T[2]
    {
        Length = "25";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    INOUT MIR-EMPLR-ADDR-2-TXT-T[2]
    {
        Length = "25";
        FieldGroup = "Table6";
        SType = "Text";
        Label = "Current Employer Address";
        Index = "1";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Record";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-DV-CLI-PREV-NM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Client has a previous name(s)";
    }

    IN MIR-CLI-NM-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Name Change Date";
    }

    IN MIR-CLI-ADDR-CHNG-DT-T[2]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table5";
        SType = "Date";
        Label = "Address Changed Date";
        Index = "1";
    }

    IN MIR-ADDR-STAT-CHNG-DT-T[2]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table5";
        SType = "Date";
        Label = "Address Status Changed Date";
        Index = "1";
    }

    IN MIR-DV-PREV-ADDR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Previous Address";
    }

    INOUT MIR-CLI-CNTCT-ID-TXT-T[5]
    {
        Length = "50";
        FieldGroup = "Table5";
        SType = "Text";
        Label = "Identification Code";
        Index = "1";
    }

    INOUT MIR-CLI-CNTCT-ID-CD-T[5]
    {
        Length = "2";
        FieldGroup = "Table5";
        CodeSource = "EDIT";
        CodeType = "CNTID";
        SType = "Selection";
        Label = "Contact Type";
        Index = "1";
    }

    INOUT ClientIDAssignmentOverride
    {
        SType = "Indicator";
        Label = "Override automatic Client Reference ID Assignment";
    }

    INOUT UserDefinedClientID
    {
        Length = "10";
        Mandatory;
        SType = "Text";
        Label = "User-defined Client Reference ID";
    }

}

