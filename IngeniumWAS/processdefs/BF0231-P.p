# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0231-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0231-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0231";
        BusinessFunctionName = "Cheque Reconciliation Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM0175";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CHQ-ID
    {
        Key;
        Mandatory;
        Length = "16";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Reference Number";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TCR";
        SType = "Selection";
        Label = "Sub Company";
    }

}

