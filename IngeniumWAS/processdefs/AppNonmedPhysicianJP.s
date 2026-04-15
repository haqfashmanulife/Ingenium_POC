# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:12 PM EDT

#*******************************************************************************
#*  Component:   AppNonmedPhysicianJP.s                                       *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP AppNonmedPhysicianJP
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-CLI-DOCTOR-NM";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    INOUT MIR-CLI-DOCTOR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Physician's Name";
    }

    INOUT MIR-CLI-DOCTOR-PROV-CD
    {
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-DOCTOR-CTRY-CD";
        SType = "Selection";
        Label = "Province/State";
    }

    INOUT MIR-CLI-DOCTOR-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-MEDCTN-GIV-TXT
    {
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "LVMED";
        SType = "Selection";
        Label = "Medication Given";
    }

    INOUT MIR-CLI-PREG-CNFMT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Confinement Date";
    }

    INOUT MIR-CLI-PREG-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-PREG-IND";
        SType = "Selection";
        Label = "Client is currently pregnant";
    }

    INOUT MIR-DISORD-DIAGNS-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVDIS";
        SType = "Selection";
        Label = "Disorder/Diagnosis";
    }

    INOUT MIR-DOCTOR-CITY-NM-TXT
    {
        Length = "25";
        SType = "Text";
        Label = "City";
    }

    INOUT MIR-DOCTOR-PREV-VST-DT
    {
        Length = "9";
        SType = "Date";
        Label = "Date Last Consulted";
    }

    INOUT MIR-PREG-CMPLIC-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PREG-CMPLIC-IND";
        SType = "Selection";
        Label = "Complications Now or in Past";
    }

    INOUT MIR-PREV-VST-REASN-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "VREAS";
        SType = "Selection";
        Label = "Reason Last Consulted";
    }

    INOUT MIR-PREV-VST-RSLT-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVRLT";
        SType = "Selection";
        Label = "Results of Visit";
    }

    INOUT MIR-TRTMNT-RECV-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVTRT";
        SType = "Selection";
        Label = "Treatment Received";
    }

}

