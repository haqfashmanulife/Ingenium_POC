# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppIndivListJP.s                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016103  6.1.1J   Added Search Language Group Code                          *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppIndivListJP
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-DV-SRCH-GR-CD";
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

    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }


    # location filtering based on session object for user
    # sign-on country.

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Selection";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        Label = "Province";
    }

    INOUT MIR-CLI-ENTR-GIV-NM
    {
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

    INOUT MIR-CLI-ENTR-SUR-NM
    {
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        SType = "Text";
        Label = "Postal Code";
    }

    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        CodeSubType = "INDV";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-CLI-TAX-ID
    {
        Length = "9";
        SType = "Text";
        Label = "Tax ID";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-T[50]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Primary Address";
        Index = "1";
    }

    IN MIR-CLI-BTH-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Birthdate";
        Index = "1";
    }

    IN MIR-CLI-CRNT-LOC-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    IN MIR-CLI-ID-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Client ID";
        Index = "1";
    }

    IN MIR-CLI-PSTL-CD-T[50]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Postal/Zip Code";
        Index = "1";
    }

    IN MIR-CLI-SEX-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    IN MIR-CLI-TAX-ID-T[50]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "SSN";
        Index = "1";
    }

    IN MIR-DV-CLI-PREV-NM-IND-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        SType = "Indicator";
        Label = "AKA";
        Index = "1";
    }

    IN MIR-DV-SRCH-CLI-NM-T[50]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table50";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Full Name";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-CLI-CITY-NM-TXT-T[50]
    {
        DisplayOnly;
        Length = "30";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "City Name";
        Index = "1";
    }

    IN MIR-CLI-JP-ADDR-CD-T[50]
    {
        DisplayOnly;
        Length = "11";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "JP Address Code";
        Index = "1";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        DefaultConstant = "KJ";
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

    INOUT MIR-CLI-JP-ADDR-CD
    {
        Length = "11";
        SType = "Text";
        Label = "JP Address Code";
    }

    INOUT MIR-CLI-CITY-NM-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "Postal Code";
    }

}

