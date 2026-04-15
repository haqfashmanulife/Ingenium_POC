#*******************************************************************************
#*  Component:   BF9831-P.p                                                    *
#*  Description: Question Description Create Screen                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS    Initial Version                                             *
#*                                                                             *
#*  AFF024  CTS    Fix for Unable to retrieve the value of the session variable*
#*  AFU013  CTS    Change for user type flow                                   *
#*  AFU015  CTS    Change to increase the length of question description to 200*
#*******************************************************************************

P-STEP BF9831-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9831";
        BusinessFunctionName = "Question Description Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9831";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-QSTN-ID
    {
        Key;
        Length = "09";
        DBTableName = "TCQDR";
#AFF024        DefaultSession = "MIR-QSTN-ID";
        SType = "Text";
        Label = "Question ID";
    }

    INOUT MIR-MAJ-QSTN-IND
    {
        Length = "01";
        DBTableName = "TCQDS";
        SType = "Indicator";
        Label = "Major Question Indicator";
    }

    INOUT MIR-USER-TYP-CD
    {
        Key;
#AFU013 CHANGES START
#       Mandatory;
#AFU013 CHANGES END
        Length = "03";
        DBTableName = "TCQDS";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "USER-TYP-CD";
        Label = "User Type";
    }

    OUT MIR-QSTN-DESC-TXT
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
    INOUT MIR-HID-QSTN-ID
    {
        Key;
        Length = "09";
        DBTableName = "TCQDR";
        SType = "Hidden";
    }

}        
