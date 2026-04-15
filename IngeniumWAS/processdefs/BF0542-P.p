# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:23 PM EDT

#*******************************************************************************
#*  Component:   BF0542-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0542-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0542";
        BusinessFunctionName = "Physician/Personal Information Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0540";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-DOCTOR-NM
    {
        Length = "50";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "Physician's Name";
    }

    INOUT MIR-CLI-DOCTOR-PROV-CD
    {
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Province/State";
    }

    INOUT MIR-CLI-MEDCTN-GIV-TXT
    {
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "LVMED";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Medication Given";
    }

    INOUT MIR-CLI-PREG-CNFMT-DT
    {
        Length = "10";
        DBTableName = "TAPPF";
        SType = "Date";
        Label = "Confinement Date";
    }

    INOUT MIR-CLI-PREG-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-PREG-IND";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Client is currently pregnant";
    }

    INOUT MIR-DISORD-DIAGNS-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVDIS";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Disorder/Diagnosis";
    }

    INOUT MIR-DOCTOR-CITY-NM-TXT
    {
        Length = "25";
        DBTableName = "TAPPF";
        SType = "Text";
        Label = "City";
    }

    INOUT MIR-DOCTOR-PREV-VST-DT
    {
        Length = "9";
        DBTableName = "TAPPF";
        SType = "Date";
        Label = "Date Last Consulted";
    }

    INOUT MIR-DV-CLI-CM-HT
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "cm";
    }

    INOUT MIR-DV-CLI-FT-HT
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "ft";
    }

    INOUT MIR-DV-CLI-INCH-HT
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "in";
    }

    INOUT MIR-DV-CLI-KG-WGT
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "kgs";
    }

    INOUT MIR-DV-CLI-LB-WGT
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "lbs";
    }

    INOUT MIR-DV-CLI-WGT-CHNG-KG-QTY
    {
        Length = "4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Weight Change  (lbs / kgs)";
    }

    INOUT MIR-DV-CLI-WGT-CHNG-LB-QTY
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Weight Change  (lbs / kgs)";
    }

    INOUT MIR-PREG-CMPLIC-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "PREG-CMPLIC-IND";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Complications Now or in Past";
    }

    INOUT MIR-PREV-VST-REASN-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "VREAS";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Reason Last Consulted";
    }

    INOUT MIR-PREV-VST-RSLT-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVRLT";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Results of Visit";
    }

    INOUT MIR-REASN-WGT-CHNG-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "WCRSN";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Reason for Weight Change";
    }

    INOUT MIR-REGU-DOCTOR-IND
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "REGU-DOCTOR-IND";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Client has a regular physician";
    }

    INOUT MIR-TRTMNT-RECV-TXT
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LVTRT";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Treatment Received";
    }

    INOUT MIR-WGT-GAIN-LOS-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "WGT-GAIN-LOS-CD";
        DBTableName = "TAPPF";
        SType = "Selection";
        Label = "Gain / Loss";
    }

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

}

