# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0382-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0382-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0382";
        BusinessFunctionName = "Event Table Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0380";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-EVNT-GR-CD-T[13]
    {
        Length = "3";
        FieldGroup = "Table1";
        CodeSource = "EDIT";
        CodeType = "GROUP";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Category Grouped";
        Index = "1";
    }

    INOUT MIR-EVNT-SECUR-CD-T[13]
    {
        Mandatory;
        Length = "1";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "EVNT-SECUR-CD";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Security Code";
        Index = "1";
    }

    INOUT MIR-EVNT-USE-IND-T[13]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TDALT";
        SType = "Indicator";
        Label = "Produce log entries for this log entry type";
        Index = "1";
    }

    INOUT MIR-MSG-REF-ID-T[13]
    {
        Mandatory;
        Length = "6";
        FieldGroup = "Table1";
        KeyColumn;
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Message Source";
        Index = "1";
    }

    INOUT MIR-MSG-REF-NUM-T[13]
    {
        Mandatory;
        Length = "4";
        FieldGroup = "Table1";
        DBTableName = "TDALT";
        SType = "Text";
        Label = "Message Number";
        Index = "1";
    }

    IN MIR-EVNT-ACT-CD
    {
        Key;
        Mandatory;
        Length = "4";
        CodeSource = "EDIT";
        CodeType = "DACTN";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Action Type";
    }

    IN MIR-EVNT-ACTV-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DACTV";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Activity Type";
    }

    IN MIR-EVNT-SRC-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EVNT-SRC-CD";
        DBTableName = "TDALT";
        SType = "Selection";
        Label = "Source of Log Entry";
    }

}

