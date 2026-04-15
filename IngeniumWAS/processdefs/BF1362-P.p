# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:37 PM EDT

#*******************************************************************************
#*  Component:   BF1362-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PF 2.2  PF22     Fixed SyntaxCheck error - BF1361-Prev renamed BF1362-P    *
#*  MP1542  CTS      CHANGES FOR APL REVERSAL PROCESSING                       *
#*******************************************************************************

#P-STEP BF1361-Prev
P-STEP BF1362-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1362";
        BusinessFunctionName = "Service Transaction - APL Reversal";
        BusinessFunctionType = "Aplrev";
        MirName = "CCWM0661";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-CVG-NUM
    {
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
# MP1542 Changes Starts

    INOUT MIR-APL-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TLHST";
        SType = "Text";
        Label = "Sequence Number";
    }

# MP1542 Changes Ends
}

