#*******************************************************************************
#*  Component:   BF9943-P.p                                                    *
#*  Description: Question Rule Delete Screen                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9943-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9943";
        BusinessFunctionName = "Question Rule Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9943";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-MAJ-QSTN-ID
    {
        Key;
        Length = "09";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Major Question ID";
    }

    INOUT MIR-PRNT-QSTN-ID
    {
        Key;
        Length = "09";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Parent Question ID";
    }

    INOUT MIR-QSTN-ID
    {
        Key;
        Length = "09";
        DBTableName = "TCQDR";
        SType = "Text";
        Label = "Question ID";
    }

    INOUT MIR-HID-USER-TYP-CD
    {
        Key;
        Length = "03";
        DBTableName = "TCQDS";
        SType = "Hidden";
        CodeSource = "DataModel";
        CodeType = "USER-TYP-CD";
        Label = "User Type";
    }

    INOUT MIR-HID-LVL-NUM
    {
       	Length = "03";
        DBTableName = "TCQRL";
        SType = "Hidden";
    }
}

