# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF1369-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  RPU002  CTS      CHANGES HAS BEEN MADE FOR RPU REVERSAL                                                                            *
#*******************************************************************************

P-STEP BF1369-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1369";
        BusinessFunctionName = "Service Transaction - Reverse RPU";
        BusinessFunctionType = "Revrsrpu";
        MirName = "CCWM0661";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

# RPU002 Changes Starts here
#    INOUT MIR-APPL-CTL-PRCES-DT
       OUT MIR-APPL-CTL-PRCES-DT

    {
        Length = "10";
# RPU002 Changes Starts here	
#        Mandatory;
#        DBTableName = "TMAST";
#        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
#        Label = "Process Date";
        DisplayOnly;
        Label = "Effective Date";
# RPU002 Ends here
    }

    INOUT MIR-CVG-NUM
    {
        Length = "2";
# RPU002 Changes Starts here	
	Mandatory;
# RPU002 Ends here	
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

