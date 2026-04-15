# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1312-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  SESCAP  31DEC04  SESSION CAP ENHANCEMENT                                   *
#*                                                                             *
#*******************************************************************************

P-STEP BF1312-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1312";
        BusinessFunctionName = "System Control Profile Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0601";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID-ASIGN-IND
    {
        Length = "1";
        DBTableName = "TPSYS";
        SType = "Indicator";
        Label = "Use automatic client number assignment";
    }

    INOUT MIR-DV-MAX-POL-CVG-QTY
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Maximum Coverages/Policy";
    }

    INOUT MIR-MAX-CLI-ID-TRY-NUM
    {
        Mandatory;
        Length = "3";
        DBTableName = "TPSYS";
        SType = "Text";
        Label = "Maximum Client Number Attempts";
    }

    INOUT MIR-MAX-CLI-ON-CVG-QTY
    {
        Mandatory;
        Length = "2";
        DBTableName = "TPSYS";
        SType = "Text";
        Label = "Maximum Clients/Coverage";
    }

    INOUT MIR-MAX-CLI-ON-POL-QTY
    {
        Mandatory;
        Length = "2";
        DBTableName = "TPSYS";
        SType = "Text";
        Label = "Maximum Non-insured Clients/Policy";
    }

    INOUT MIR-MAX-CLI-SRCH-QTY
    {
        Mandatory;
        Length = "2";
        DBTableName = "TPSYS";
        SType = "Text";
        Label = "Maximum Search List Size";
    }

    INOUT MIR-MAX-PERS-MDRT-AMT
    {
        Length = "15";
        DBTableName = "TPSYS";
        SType = "Currency";
        Label = "Maximum Personal MDRT Credits";
    }

    INOUT MIR-MIB-COMUN-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIB-COMUN-TYP-CD";
        DBTableName = "TPSYS";
        SType = "Selection";
        Label = "Type of Connection to MIB";
    }

    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TPSYS";
        SType = "Date";
        Label = "Last File Update";
    }

# SESCAP
    INOUT MIR-SESN-XPRY-DUR
    {
      Length = "3";
      DBTableName = "TPSYS";
      SType = "Text";
      Label = "Session Expiry Period";
      SType = "Text";
    }
     
}

