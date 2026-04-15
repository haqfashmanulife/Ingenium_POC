#*******************************************************************************
#*  Component:   BF9944-P.p                                                    *
#*  Description: Question Rule List Screen                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN0395   CTS    Initial Version                                            *
#*                                                                             *
#*  AFU015  CTS    Change to increse the length of question description to 200 *
#*******************************************************************************

P-STEP BF9944-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9944";
        BusinessFunctionName = "Question Rule List";
        BusinessFunctionType = "List";
        MirName = "CCWM9944";
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

    OUT MIR-HID-MAJ-QSTN-ID-T[50]
    {
        Length = "09";
        DBTableName = "TCQRL";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Hidden";
        Label = "Major Question ID";
    }

    OUT MIR-MAJ-QSTN-ID-T[50]
    {
        Length = "09";
        DBTableName = "TCQRL";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Major Question ID";
    }

    OUT MIR-PRNT-QSTN-ID-T[50]
    {
        Length = "09";
        DBTableName = "TCQRL";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Parent Question ID";
    }

    OUT MIR-RESP-TYP-T[50]
    {
        Length = "10";
        SType = "Text";
        FieldGroup = "Table1";
        Index = "1";
        Label = "Trigger";
    }


    OUT MIR-ACTV-CD-T[50]
    {
        Length = "05";
        SType = "Selection";
        CodeSource = "DataModel";
        CodeType = "ACTV-TYP-CD";
        FieldGroup = "Table1";
        Index = "1";
        Label = "Action";
    }

    OUT MIR-ACTV-ID-T[50]
    {
        Length = "10";
        DBTableName = "TCQRL";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Resultant";
    }

    OUT MIR-ACTV-DESC-T[50]
    {
        MixedCase;
#AFU015 CHANGES START
#       Length = "100";
        Length = "200";
#AFU015 CHANGES END
        DBTableName = "TCQRL";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Text";
        Label = "Description";
    }

    OUT MIR-HID-LVL-NUM-T[50]
    {
        Length = "03";
        DBTableName = "TCQRL";
        FieldGroup = "Table1";
        Index = "1";
        SType = "Hidden";
    }

    OUT MIR-HID-USER-TYP-CD-T[50]
    {
        Length = "03";
        DBTableName = "TCQDS";
        SType = "Hidden";
        CodeSource = "DataModel";
        CodeType = "USER-TYP-CD";
    }
}
