#*******************************************************************************
#*  Component:   BF9942-P.p                                                    *
#*  Description: Question Rule Update Screen                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*                                                                             *
#*  AFU015  CTS    Change to increse the length of question description to 200 *
#*******************************************************************************

P-STEP BF9942-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9942";
        BusinessFunctionName = "Question Rule Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9942";
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

    INOUT MIR-QUES-DESC
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

    INOUT MIR-YES-ACTV-TYP-CD
    {
        Length = "05";
        DBTableName = "TCQRL";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "ACTV-TYP-CD";
        Label = "Action";
    }

    INOUT MIR-YES-ACTV-ID
    {
        Length = "10";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant";
    }

    INOUT MIR-NO-ACTV-TYP-CD
    {
        Length = "05";
        DBTableName = "TCQRL";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "ACTV-TYP-CD";
        Label = "Action";
    }

    INOUT MIR-NO-ACTV-ID
    {
        Length = "10";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant";
    }

    INOUT MIR-UNKNWN-ACTV-TYP-CD
    {
        Length = "05";
        DBTableName = "TCQRL";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "ACTV-TYP-CD";
        Label = "Action";
    }

    INOUT MIR-UNKNWN-ACTV-ID
    {
        Length = "10";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant";
    }

    INOUT MIR-BLNK-ACTV-TYP-CD
    {
        Length = "05";
        DBTableName = "TCQRL";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "ACTV-TYP-CD";
        CodeSubType = "BLNK";
        Label = "Action";
    }

    INOUT MIR-BLNK-ACTV-ID
    {
        Length = "10";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant";
    }

    INOUT MIR-HID-LVL-NUM
    {
        Length = "03";
        DBTableName = "TCQRL";
        SType = "Hidden";
    }
}


