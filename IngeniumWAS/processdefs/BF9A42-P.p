# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A42-P.p                                                    *
#*  Description: Death Benefit Support Table (DBEN) Update step                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A42-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A42";
        BusinessFunctionName = "Death Benefit Support Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9A40";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TDBEN";
        SType = "Selection";
        Label = "Plan ID";
    }

    IN MIR-CAUSE-CAT-CD
    {
        Key;
        Mandatory;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "DTCAT";
        DBTableName = "TDBEN";
        SType = "Selection";
        Label = "Cause Category Code";
    }

    INOUT MIR-BNFT-NM-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "BNNM";
        SType = "Selection";
        Label = "Benefit Name";
    }

    INOUT MIR-PAYBL-AMT-CALC-CD
    {
        Length = "1";
        DBTableName = "TDBEN";
        SType = "Text";
        Label = "Payable amount calculation code";

    }
   }
