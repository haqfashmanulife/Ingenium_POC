# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF1411-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1411-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1411";
        BusinessFunctionName = "Disability Claim Inforce";
        BusinessFunctionType = "Inforce";
        MirName = "CCWM0641";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-CVG-NUM
    {
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

    IN MIR-DV-PSTDT-ISS-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-PSTDT-ISS-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Sub Code";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

}

