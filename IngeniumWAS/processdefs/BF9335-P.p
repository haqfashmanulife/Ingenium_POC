# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9335-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HCL109  HIN/CL   CLAIM PAYMENT                                              *
#*                                                                             *
#*******************************************************************************

P-STEP BF9335-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9335";
        BusinessFunctionName = "Claim Payee Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9335";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TCLMA";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Master Claim ID";
    }

    OUT MIR-CODE-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName;
        SType = "Text";
        Label = "Payee Seq. Number";
        Index = "1";
    }

    OUT MIR-DESC-T[50]
    {
        Length = "50";
        FieldGroup = "Table50";
        DBTableName;
        SType = "Text";
        Label = "Payee Name";
        Index = "1";
    }

}

