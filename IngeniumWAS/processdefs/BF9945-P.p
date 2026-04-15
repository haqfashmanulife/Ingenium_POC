#*******************************************************************************
#*  Component:   BF9945-P.p                                                    *
#*  Description: Question Rule Insert Screen                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9945-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9945";
        BusinessFunctionName = "Question Rule Insert";
        BusinessFunctionType = "Insert";
        MirName = "CCWM9945";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-MAJ-QSTN-ID
    {
        Key;
        Mandatory;
        Length = "09";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Major Question ID";
    }

    INOUT MIR-PRNT-QSTN-ID
    {
        Key;
        Mandatory;
        Length = "09";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Parent Question ID";
    }

    INOUT MIR-QSTN-ID
    {
        Key;
        Mandatory;
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

    INOUT MIR-LVL-NUM
    {
       	Length = "03";
        DBTableName = "TCQRL";
        SType = "Hidden";
    }

}


