# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0392-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0392-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0392";
        BusinessFunctionName = "Checkpoint Table Update";
        BusinessFunctionType = "Update";
        MirName = "XCWM0390";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-COMIT-FREQ-UOW-QTY
    {
        Mandatory;
        Length = "5";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Commit Frequency Units";
    }

    INOUT MIR-COMIT-MAX-SEC-DUR
    {
        Mandatory;
        Length = "5";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Commit Frequency Maximum Time";
    }

    INOUT MIR-COMIT-MIN-SEC-DUR
    {
        Mandatory;
        Length = "5";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Commit Frequency Minimum Time";
    }

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

    OUT MIR-CHKPT-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CHKPT-STAT-CD";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Current Checkpoint Status";
    }

    OUT MIR-CHKPT-WRK-INFO
    {
        Length = "237";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Work Area Display";
    }

    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TCKPT";
        SType = "Date";
        Label = "Previous Update Date";
    }

    OUT MIR-PREV-UPDT-USER-ID
    {
        Length = "8";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Previous Update User ID";
    }

}

