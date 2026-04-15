# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A44-P.p                                                    *
#*  Description: Death Benefit Table (DBEN) List step                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A44-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A44";
        BusinessFunctionName = "Death Benefit Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM9A40";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PLAN-ID
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

    INOUT MIR-CAUSE-CAT-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DTCAT";
        DBTableName = "TDBEN";
        SType = "Selection";
        Label = "Cause Category Code";
    }


    OUT MIR-PLAN-ID-T[50]
    {
        Length = "6";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TDBEN";
        SType = "Text";
        Label = "Plan ID";
        Index = "1";
    }

    OUT MIR-CAUSE-CAT-CD-T[50]
    {
        Length = "5";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "DTCAT";
        DBTableName = "TDBEN";
        SType = "Text";
        Label = "Cause Category Code";
        Index = "1";
    }

    OUT MIR-BNFT-NM-ID-T[50]
    {
        Length = "5";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "BNNM";
        DBTableName = "TDBEN";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";

    }

    OUT MIR-PAYBL-AMT-CALC-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TDBEN";
        SType = "Text";
        Label = "Payable amount calculation code";
        Index = "1";
    }



 }
