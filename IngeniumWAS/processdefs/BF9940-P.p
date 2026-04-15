#*******************************************************************************
#*  Component:   BF9940-P.p                                                    *
#*  Description: Question Rule Inquiry Screen                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*                                                                             *
#*  AFU015  CTS    Change to increse the length of question description to 200 *
#*******************************************************************************

P-STEP BF9940-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9940";
        BusinessFunctionName = "Question Rule Inquiry";
        BusinessFunctionType = "Inquiry";
        MirName = "CCWM9940";
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

    OUT MIR-YES-ACTV-TYP-CD
    {
        Length = "05";
        DBTableName = "TCQRL";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "ACTV-TYP-CD";
        Label = "Action";
    }

    OUT MIR-YES-ACTV-ID
    {
        Length = "10";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant";
    }

    OUT MIR-YES-ACTV-DESC   
    {
        MixedCase;
#AFU015 CHANGES START
#       Length = "100";
        Length = "200";
#AFU015 CHANGES END
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant Description";
    }

    OUT MIR-NO-ACTV-TYP-CD
    {
        Length = "05";
        DBTableName = "TCQRL";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "ACTV-TYP-CD";
        Label = "Action";
    }

    OUT MIR-NO-ACTV-ID
    {
        Length = "10";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant";
    }

    OUT MIR-NO-ACTV-DESC   
    {
        MixedCase;
#AFU015 CHANGES START
#       Length = "100";
        Length = "200";
#AFU015 CHANGES END
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant Description";
    }

    OUT MIR-UNKNWN-ACTV-TYP-CD
    {
        Length = "05";
        DBTableName = "TCQRL";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "ACTV-TYP-CD";
        Label = "Action";
    }

    OUT MIR-UNKNWN-ACTV-ID
    {
        Length = "10";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant";
    }

    OUT MIR-UNKNWN-ACTV-DESC   
    {
        MixedCase;
#AFU015 CHANGES START
#       Length = "100";
        Length = "200";
#AFU015 CHANGES END
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant Description";
    }

    OUT MIR-BLNK-ACTV-TYP-CD
    {
        Length = "05";
        DBTableName = "TCQRL";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "ACTV-TYP-CD";
        CodeSubType = "BLNK";
        Label = "Action";
    }

    OUT MIR-BLNK-ACTV-ID
    {
        Length = "10";
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant";
    }

    OUT MIR-BLNK-ACTV-DESC   
    {
        MixedCase;
#AFU015 CHANGES START
#       Length = "100";
        Length = "200";
#AFU015 CHANGES END
        DBTableName = "TCQRL";
        SType = "Text";
        Label = "Resultant Description";
    }

    INOUT MIR-HID-LVL-NUM
    {
        Length = "03";
        DBTableName = "TCQRL";
        SType = "Hidden";
    }
 
}
