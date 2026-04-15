# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppIndivSearchFTJUL.s                                         *
#*  Description: Cloned from AppIndivSearchFTJUL.s                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00386  WBP      New for App Update Flow                                   *
#*                                                                             *
#*******************************************************************************

S-STEP AppIndivSearchFTJULU
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

    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    INOUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        SType = "Text";
        Label = "Address Code";
    }
     
    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        SType = "Selection";
        Label = "Province/State";
    }

    INOUT MIR-CLI-ENTR-CO-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Company Name";
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

    INOUT MIR-CLI-MID-INIT-NM
    {
        Length = "1";
        SType = "Text";
        Label = "Middle Initial";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    INOUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-CLI-TAX-ID
    {
        Length = "9";
        SType = "Text";
        Label = "SSN/Tax ID";
    }

    INOUT MIR-DV-CLI-NM-SRCH-IND
    {
        Length = "1";
        DefaultConstant = "Y";
        SType = "Indicator";
        Label = "First Name/Last Name switch";
    }

    INOUT MIR-DV-GIV-NM-SRCH-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-GIV-NM-SRCH-CD";
        DefaultConstant = "E";
        SType = "Selection";
        Label = "First Name Phonetic/Exact";
    }

    INOUT MIR-DV-SUR-NM-SRCH-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-SUR-NM-SRCH-CD";
        DefaultConstant = "E";
        SType = "Selection";
        Label = "Last Name/Company Name Phonetic/Exact";
    }

    INOUT MIR-DV-SRCH-GR-CD
    {
        DefaultConstant = "KJ";
        SType = "YesNo";
        Label = "Search Language Group Code";
    }

    INOUT MIR-CLI-CITY-NM-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "City Name";
    }

    INOUT MIR-CLI-ADDR-LN-1-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "Neighborhood";
    }

}
