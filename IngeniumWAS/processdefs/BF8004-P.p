# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF8004-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016043  602J     Passback data from server                                 *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3049  CTS      ANNUITY TRANSITION PROCESSING STREAM 3                    *
#*******************************************************************************

P-STEP BF8004-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8004";
        BusinessFunctionName = "Policy/Coverage Diagnostics";
        BusinessFunctionType = "Diagnsts";
        MirName = "CCWM8004";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }


    #
    # Added for 16043
    #

    OUT MIR-POL-APP-CMPLT-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Appl Completion Date";
    }

    OUT MIR-POL-NXT-ACTV-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Next Activity Date";
    }

    OUT MIR-NXT-ACTV-TYP-CD
    {
        Length = "3";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Next Activity Type Code";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "4";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status Code";
    }

    OUT MIR-POL-PREV-CSTAT-CD
    {
        Length = "4";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Prev Policy Status Code";
    }

    OUT MIR-POL-STAT-CHNG-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Policy Status Change Date";
    }

    OUT MIR-POL-CVG-ERROR-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy CVG Error Code";
    }

    OUT MIR-CVG-APP-CMPLT-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "CVG Appl Completion Date";
        Index = "1";
    }

    OUT MIR-CVG-CNVR-XPRY-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "CVG Converted Expiry Date";
        Index = "1";
    }

    OUT MIR-CVG-AD-XPRY-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "CVG ADB Expiry Date";
        Index = "1";
    }

    OUT MIR-CVG-WP-XPRY-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "CVG Waiver of Prem Expiry Date";
        Index = "1";
    }

    OUT MIR-CVG-AD-MULT-FCT-T[20]
    {
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "ADB Multiplier";
        Index = "1";
    }

    OUT MIR-CVG-WP-MULT-FCT-T[20]
    {
        Signed;
        Length = "3";
        Decimals = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "CVG Status Code";
        Index = "1";
    }

    OUT MIR-CVG-PREV-CSTAT-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Prev CVG Status Code";
        Index = "1";
    }

    OUT MIR-CVG-STAT-PRCES-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "CVG Status Process Date";
        Index = "1";
    }
#UY3049 CHANGES START HERE
    IN MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    IN MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES END HERE
}

