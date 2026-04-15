#*******************************************************************************
#*  Component:   BF9834-P.p                                                    *
#*  Description: Question Description List Screen                              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395  CTS      Initial Version                                           *
#*                                                                             *
#*  AFU015  CTS    Change to increse the length of question description to 200 *
#*******************************************************************************

P-STEP BF9834-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9834";
        BusinessFunctionName = "Question Description List";
        BusinessFunctionType = "List";
        MirName = "CCWM9834";
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
        SType = "Hidden";

    }

    INOUT MIR-USER-TYP-CD
    {
        Key;
        Length = "03";
        SType = "Hidden";
    }

    OUT MIR-QSTN-ID-T[30]
    {
        Key;
        Length = "09";
        Index = "1";
        FieldGroup = "Table1";
        DBTableName = "TCQDR";
        SType = "Text";
        Label = "Question ID";
    }

    OUT MIR-MAJ-QSTN-IND-T[30]
    {
        Key;
        Length = "01";
        Index = "1";
        FieldGroup = "Table1";
        DBTableName = "TCQDS";
        SType = "Text";
        Label = "Major Question Indicator";
    }

    OUT MIR-USER-TYP-CD-T[30]
    {
        Key;
        Length = "03";
        Index = "1";
        FieldGroup = "Table1";
        DBTableName = "TCQDS";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "USER-TYP-CD";
        Label = "User Type";
    }

    
    OUT MIR-QSTN-DESC-TXT-T[30]
    {
        MixedCase;
#AFU015 CHANGES START
#       Length = "100";
        Length = "200";
#AFU015 CHANGES END
        Index = "1";
        FieldGroup = "Table1";
        DBTableName = "TCQDS";
        SType = "Text";
        Label = "Question Description";
    }

}        
