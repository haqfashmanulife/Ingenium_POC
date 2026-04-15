# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:24 PM EDT

#*******************************************************************************
#*  Component:   BF0540-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0540-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-DOCTOR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Physician's Name";
    }

    IN MIR-CLI-DOCTOR-PROV-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Province/State";
    }

    IN MIR-CLI-MEDCTN-GIV-TXT
    {
        DisplayOnly;
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "LVMED";
        SType = "Text";
        Label = "Medication Given";
    }

    IN MIR-CLI-PREG-CNFMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Confinement Date";
    }

    IN MIR-CLI-PREG-IND
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-PREG-IND";
        SType = "Text";
        Label = "Client is currently pregnant";
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

    IN MIR-DISORD-DIAGNS-TXT
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVDIS";
        SType = "Text";
        Label = "Disorder/Diagnosis";
    }

    IN MIR-DOCTOR-CITY-NM-TXT
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "City";
    }

    IN MIR-DOCTOR-PREV-VST-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Date Last Consulted";
    }

    IN MIR-DV-CLI-CM-HT
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "cm";
    }

    IN MIR-DV-CLI-FT-HT
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "ft";
    }

    IN MIR-DV-CLI-INCH-HT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "in";
    }

    IN MIR-DV-CLI-KG-WGT
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "kgs";
    }

    IN MIR-DV-CLI-LB-WGT
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "lbs";
    }

    IN MIR-DV-CLI-WGT-CHNG-KG-QTY
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Weight Change  (lbs / kgs)";
    }

    IN MIR-DV-CLI-WGT-CHNG-LB-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Weight Change  (lbs / kgs)";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-PREG-CMPLIC-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREG-CMPLIC-IND";
        SType = "Text";
        Label = "Complications Now or in Past";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Date Last Changed";
    }

    IN MIR-PREV-VST-REASN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "VREAS";
        SType = "Text";
        Label = "Reason Last Consulted";
    }

    IN MIR-PREV-VST-RSLT-TXT
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVRLT";
        SType = "Text";
        Label = "Results of Visit";
    }

    IN MIR-REASN-WGT-CHNG-TXT
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "WCRSN";
        SType = "Text";
        Label = "Reason for Weight Change";
    }

    IN MIR-REGU-DOCTOR-IND
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REGU-DOCTOR-IND";
        SType = "Text";
        Label = "Client has a regular physician";
    }

    IN MIR-TRTMNT-RECV-TXT
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVTRT";
        SType = "Text";
        Label = "Treatment Received";
    }

    IN MIR-WGT-GAIN-LOS-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "WGT-GAIN-LOS-CD";
        SType = "Text";
        Label = "Gain / Loss";
    }

}

