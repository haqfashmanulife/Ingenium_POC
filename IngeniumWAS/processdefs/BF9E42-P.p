# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9E42-P.p                                                    *
#*  Description: Maturity Reversal Processing                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  23802H  CTS      INITIAL VERSION                                           *
#*******************************************************************************

P-STEP BF9E42-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E42";
        BusinessFunctionName = "Service Transaction - Reverse Maturity";
        BusinessFunctionType = "Revrsmat";
        MirName = "SCWM9E39";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

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

    OUT MIR-APPL-CTL-PRCES-DT

    {
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-CVG-NUM
    {
        Length = "2";
	Mandatory;
        DBTableName = "TCVG";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }

}

