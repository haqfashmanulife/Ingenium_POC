# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0391-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0391-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0391";
        BusinessFunctionName = "Checkpoint Table Create";
        BusinessFunctionType = "Create";
        MirName = "XCWM0390";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CHKPT-INSTC-ID
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Instance Number";
    }

    IN MIR-CHKPT-PGM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PROGM";
        DBTableName = "TCKPT";
        SType = "Selection";
        Label = "Program Name";
    }

}

