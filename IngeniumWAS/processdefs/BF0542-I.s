# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:24 PM EDT

#*******************************************************************************
#*  Component:   BF0542-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0542-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-DV-CLI-FT-HT";
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
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Province/State";
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

    INOUT MIR-DV-CLI-CM-HT
    {
        Length = "4";
        SType = "Text";
        Label = "cm";
    }

    INOUT MIR-DV-CLI-FT-HT
    {
        Length = "1";
        SType = "Text";
        Label = "ft";
    }

    INOUT MIR-DV-CLI-INCH-HT
    {
        Length = "2";
        SType = "Text";
        Label = "in";
    }

    INOUT MIR-DV-CLI-KG-WGT
    {
        Length = "4";
        SType = "Text";
        Label = "kgs";
    }

    INOUT MIR-DV-CLI-LB-WGT
    {
        Length = "3";
        SType = "Text";
        Label = "lbs";
    }

    INOUT MIR-DV-CLI-WGT-CHNG-KG-QTY
    {
        Length = "4";
        SType = "Text";
        Label = "Weight Change  (lbs / kgs)";
    }

    INOUT MIR-DV-CLI-WGT-CHNG-LB-QTY
    {
        Length = "3";
        SType = "Text";
        Label = "Weight Change  (lbs / kgs)";
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

    INOUT MIR-REASN-WGT-CHNG-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "WCRSN";
        SType = "Selection";
        Label = "Reason for Weight Change";
    }

    INOUT MIR-REGU-DOCTOR-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REGU-DOCTOR-IND";
        SType = "Selection";
        Label = "Client has a regular physician";
    }

    INOUT MIR-TRTMNT-RECV-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVTRT";
        SType = "Selection";
        Label = "Treatment Received";
    }

    INOUT MIR-WGT-GAIN-LOS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "WGT-GAIN-LOS-CD";
        SType = "Selection";
        Label = "Gain / Loss";
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

    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Last Changed";
    }

}

