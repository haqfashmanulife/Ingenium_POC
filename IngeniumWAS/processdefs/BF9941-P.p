#*******************************************************************************
#*  Component:   BF9941-P.p                                                    *
#*  Description: Question Rule Create Screen                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*                                                                             *
#*  AFU015  CTS    Change to increse the length of question description to 200 *
#*******************************************************************************

P-STEP BF9941-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9941";
        BusinessFunctionName = "Question Rule Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9941";
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

    OUT MIR-QUES-DESC
    {
        MixedCase;
#AFU015 CHANGES START
#       Length = "100";
        Length = "200";
#AFU015 CHANGES END
        DBTableName = "TCQDS";
        SType = "Text";
        Label = "Question Description";
    }

    INOUT MIR-HID-LVL-NUM
    {
        Length = "03";
        DBTableName = "TCQRL";
        SType = "Hidden";
    }
}

