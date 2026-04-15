# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:41 PM EDT

#*******************************************************************************
#*  Component:   BF1570-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1570-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1570";
        BusinessFunctionName = "Reissue Processing - Suspend";
        BusinessFunctionType = "Suspend";
        MirName = "NCWM3600";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APP-FORM-TYP-ID
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TSPOL";
        SType = "Selection";
        Label = "Application Form Type";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-SPND-POL-EFF-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TSPND";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-SPND-POL-REASN-CD
    {
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STOPR";
        DBTableName = "TSPND";
        SType = "Selection";
        Label = "Suspend Reason";
    }

    INOUT MIR-SPND-POL-REDT-IND
    {
        Length = "1";
        DBTableName = "TSPND";
        SType = "Indicator";
        Label = "Policy redating allowed";
    }

    INOUT MIR-SPND-POL-UWG-IND
    {
        Length = "1";
        DBTableName = "TSPND";
        SType = "Indicator";
        Label = "Underwriting required";
    }

    INOUT MIR-UW-USER-1-ID
    {
        Mandatory;
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

