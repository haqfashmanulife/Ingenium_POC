
#*******************************************************************************
#*  Component:   BF9900-P.p                                                    *
#*  Description: Question Description Inquiry Screen                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS    Initial Version                                             *
#*                                                                             *
#*  AFU015  CTS    Change to increse the length of question description to 200 *
#*******************************************************************************

P-STEP BF9900-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9900";
        BusinessFunctionName = "Question Description Inquiry";
        BusinessFunctionType = "Inquiry";
        MirName = "CCWM9900";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-QSTN-ID
    {
        Key;
        Length = "09";
        DBTableName = "TCQDR";
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

}        
