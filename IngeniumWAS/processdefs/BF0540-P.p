# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0540-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0540-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0540";
        BusinessFunctionName = "Physician/Personal Information Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0540";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TAPPF";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    OUT MIR-CLI-DOCTOR-NM
    {
        Length = "50";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Physician's Name";
    }

    OUT MIR-CLI-DOCTOR-PROV-CD
    {
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Province/State";
    }

    OUT MIR-CLI-MEDCTN-GIV-TXT
    {
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "LVMED";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Medication Given";
    }

    OUT MIR-CLI-PREG-CNFMT-DT
    {
        Length = "10";
        DBTableName = "TAPPF";
        SType = "Date";
        Label = "Confinement Date";
    }

    OUT MIR-CLI-PREG-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-PREG-IND";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Client is currently pregnant";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-DISORD-DIAGNS-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVDIS";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Disorder/Diagnosis";
    }

    OUT MIR-DOCTOR-CITY-NM-TXT
    {
        Length = "25";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "City";
    }

    OUT MIR-DOCTOR-PREV-VST-DT
    {
        Length = "9";
        DBTableName = "TAPPF";
        SType = "Date";
        Label = "Date Last Consulted";
    }

    OUT MIR-DV-CLI-CM-HT
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "cm";
    }

    OUT MIR-DV-CLI-FT-HT
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "ft";
    }

    OUT MIR-DV-CLI-INCH-HT
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "in";
    }

    OUT MIR-DV-CLI-KG-WGT
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "kgs";
    }

    OUT MIR-DV-CLI-LB-WGT
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "lbs";
    }

    OUT MIR-DV-CLI-WGT-CHNG-KG-QTY
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Weight Change  (lbs / kgs)";
    }

    OUT MIR-DV-CLI-WGT-CHNG-LB-QTY
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Weight Change  (lbs / kgs)";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-PREG-CMPLIC-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PREG-CMPLIC-IND";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Complications Now or in Past";
    }

    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TMEDI";
        SType = "Date";
        Label = "Date Last Changed";
    }

    OUT MIR-PREV-VST-REASN-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "VREAS";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Reason Last Consulted";
    }

    OUT MIR-PREV-VST-RSLT-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVRLT";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Results of Visit";
    }

    OUT MIR-REASN-WGT-CHNG-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "WCRSN";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Reason for Weight Change";
    }

    OUT MIR-REGU-DOCTOR-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REGU-DOCTOR-IND";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Client has a regular physician";
    }

    OUT MIR-TRTMNT-RECV-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVTRT";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Treatment Received";
    }

    OUT MIR-WGT-GAIN-LOS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "WGT-GAIN-LOS-CD";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Gain / Loss";
    }

}

