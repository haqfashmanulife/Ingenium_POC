# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0853-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFFALL  CLB      Modify to support allocation by amount for 2-tier,        *
#*  MFFALL           Cvg-Fund level system.                                    *
#*******************************************************************************

P-STEP BF0853-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0853";
        BusinessFunctionName = "Coverage Allocation Delete";
     #  BusinessFunctionName = "Policy Allocation Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM3240";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CDI-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCDSI";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DV-POL-PAYO-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "DV-POL-PAYO-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Allocation Type";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

}

