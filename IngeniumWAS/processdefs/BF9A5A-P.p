# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:39 PM EDT

#*******************************************************************************
#*  Component:   BF9A5A-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M319A2  CTS      CHANGES FXWL LOAN PROCESSING                              *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A5A-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A5A";
        BusinessFunctionName = "Policy Loan";
        BusinessFunctionType = "Loan";
        MirName = "CCWM9A5A";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-PRCES-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Effective Date";
    }
    
    INOUT  MIR-POL-CRCY-CD
    {
        Length = "2";
        SType = "Text";
        Label = "Currency";
    }
}

