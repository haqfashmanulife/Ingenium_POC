# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT

#*******************************************************************************
#*  Component:   BF0394-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0394-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0394";
        BusinessFunctionName = "Checkpoint Table List";
        BusinessFunctionType = "List";
        MirName = "XCWM0390";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CHKPT-INSTC-ID
    {
        Key;
        Length = "3";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Instance Number";
    }

    INOUT MIR-CHKPT-PGM-ID
    {
        Key;
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PROGM";
        DBTableName = "TCKPT";
        SType = "Selection";
        Label = "Program Name";
    }

    OUT MIR-CHKPT-INSTC-ID-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Instance Number";
        Index = "1";
    }

    OUT MIR-CHKPT-PGM-ID-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "PROGM";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Program Name";
        Index = "1";
    }

    OUT MIR-CHKPT-STAT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CHKPT-STAT-CD";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Current Checkpoint Status";
        Index = "1";
    }

    OUT MIR-COMIT-FREQ-UOW-QTY-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Commit Frequency Units";
        Index = "1";
    }

    OUT MIR-COMIT-MAX-SEC-DUR-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Commit Frequency Maximum Time";
        Index = "1";
    }

    OUT MIR-COMIT-MIN-SEC-DUR-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Commit Frequency Minimum Time";
        Index = "1";
    }

    OUT MIR-PREV-UPDT-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCKPT";
        SType = "Date";
        Label = "Previous Update Date";
        Index = "1";
    }

    OUT MIR-PREV-UPDT-USER-ID-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        DBTableName = "TCKPT";
        SType = "Text";
        Label = "Previous Update User ID";
        Index = "1";
    }

}

