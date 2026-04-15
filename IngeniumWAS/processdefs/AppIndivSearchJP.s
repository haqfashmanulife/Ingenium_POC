# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppIndivSearchJP.s                                           *
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

S-STEP AppIndivSearchJP
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
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

    OUT MIR-CLI-BTH-DT
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

    OUT MIR-CLI-ENTR-GIV-NM
    {
        Length = "25";
        SType = "Text";
        Label = "First Name";
    }

    OUT MIR-CLI-ENTR-SUR-NM
    {
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    OUT MIR-CLI-PSTL-CD
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

    OUT MIR-CLI-TAX-ID
    {
        Length = "9";
        SType = "Text";
        Label = "Tax ID";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        DefaultConstant = "KJ";
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

    OUT MIR-CLI-JP-ADDR-CD
    {
        Length = "11";
        SType = "Text";
        Label = "JP Address Code";
    }

    OUT MIR-CLI-CITY-NM-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "City Name";
    }

}

