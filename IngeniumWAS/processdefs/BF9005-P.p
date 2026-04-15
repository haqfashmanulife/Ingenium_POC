#*******************************************************************************
#*  Component:   BF9005-P.p                                                    *
#*  Description: Question Id Auto generation for Question Description Create   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS    Initial Version                                             *
#*  AFF024  CTS    Fix for Unable to retrieve the value of the session variable*                       
#*                                                                             *
#*******************************************************************************

P-STEP BF9005-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9005";
        BusinessFunctionName = "Question Id Auto generation";
        BusinessFunctionType = "Auto generation";
        MirName = "CCWM9005";
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

    INOUT MIR-HID-QSTN-ID
    {
        Key;
        Length = "09";
        DBTableName = "TCQDR";
        SType = "Hidden";

    }

}       