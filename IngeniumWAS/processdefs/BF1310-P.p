# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:36 PM EDT

#*******************************************************************************
#*  Component:   BF1310-P.p                                                    *
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

P-STEP BF1310-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1310";
        BusinessFunctionName = "System Control Profile Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0601";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    OUT MIR-CLI-ID-ASIGN-IND
    {
        Length = "1";
        DBTableName = "TPSYS";
        SType = "Indicator";
        Label = "Use automatic client number assignment";
    }

    OUT MIR-DV-MAX-POL-CVG-QTY
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Maximum Coverages/Policy";
    }

    OUT MIR-MAX-CLI-ID-TRY-NUM
    {
        Length = "3";
        DBTableName = "TPSYS";
        SType = "Text";
        Label = "Maximum Client Number Attempts";
    }

    OUT MIR-MAX-CLI-ON-CVG-QTY
    {
        Length = "2";
        DBTableName = "TPSYS";
        SType = "Text";
        Label = "Maximum Clients/Coverage";
    }

    OUT MIR-MAX-CLI-ON-POL-QTY
    {
        Length = "2";
        DBTableName = "TPSYS";
        SType = "Text";
        Label = "Maximum Non-insured Clients/Policy";
    }

    OUT MIR-MAX-CLI-SRCH-QTY
    {
        Length = "2";
        DBTableName = "TPSYS";
        SType = "Text";
        Label = "Maximum Search List Size";
    }

    OUT MIR-MAX-PERS-MDRT-AMT
    {
        Length = "15";
        DBTableName = "TPSYS";
        SType = "Currency";
        Label = "Maximum Personal MDRT Credits";
    }

    OUT MIR-MIB-COMUN-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MIB-COMUN-TYP-CD";
        DBTableName = "TPSYS";
        SType = "Text";
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
    OUT MIR-SESN-XPRY-DUR
    {
      Length = "3";
      DBTableName = "TPSYS";
      SType = "Text";
      Label = "Session Expiry Period";
      SType = "Text";
    }
     
}

