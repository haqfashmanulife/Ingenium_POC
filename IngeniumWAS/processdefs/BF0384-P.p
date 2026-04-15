# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0384-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0384-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0384";
        BusinessFunctionName = "Event Table List";
        BusinessFunctionType = "List";
        MirName = "NCWM0380";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-EVNT-ACT-CD
    {
        Key;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "DACTN";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Action Type";
    }

    INOUT MIR-EVNT-ACTV-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Activity Type";
    }

    INOUT MIR-EVNT-SRC-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EVNT-SRC-CD";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Source of Log Entry";
    }

    OUT MIR-EVNT-ACT-CD-T[13]
    {
        Length = "4";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "DACTN";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Action Type";
        Index = "1";
    }

    OUT MIR-EVNT-ACTV-CD-T[13]
    {
        Length = "5";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Activity Type";
        Index = "1";
    }

    OUT MIR-EVNT-GR-CD-T[13]
    {
        Length = "3";
        FieldGroup = "Table13";
        CodeSource = "EDIT";
        CodeType = "GROUP";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Category Grouped";
        Index = "1";
    }

    OUT MIR-EVNT-SECUR-CD-T[13]
    {
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "EVNT-SECUR-CD";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Security Code";
        Index = "1";
    }

    OUT MIR-EVNT-SRC-CD-T[13]
    {
        Length = "1";
        FieldGroup = "Table13";
        CodeSource = "DataModel";
        CodeType = "EVNT-SRC-CD";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Source of Log Entry";
        Index = "1";
    }

    OUT MIR-EVNT-USE-IND-T[13]
    {
        Length = "1";
        FieldGroup = "Table13";
        DBTableName = "TDALT";
        SType = "Indicator";
        Label = "Produce log entries for this log entry type";
        Index = "1";
    }

    OUT MIR-MSG-REF-ID-T[13]
    {
        Length = "6";
        FieldGroup = "Table13";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Message Source";
        Index = "1";
    }

    OUT MIR-MSG-REF-NUM-T[13]
    {
        Length = "4";
        FieldGroup = "Table13";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Message Number";
        Index = "1";
    }

}

