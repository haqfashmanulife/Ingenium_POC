# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:17 PM EDT

#*******************************************************************************
#*  Component:   BF0184-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0184-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0184";
        BusinessFunctionName = "Policy Notification List";
        BusinessFunctionType = "List";
        MirName = "CCWM0180";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-NOTI-DT
    {
        Key;
        Length = "10";
        DBTableName = "TPOLN";
        SType = "Date";
        Label = "Date Notices Produced";
    }

    INOUT MIR-POL-NOTI-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Sequence Number";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }

    OUT MIR-POL-NOTI-DEPT-ID-T[10]
    {
        Length = "6";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "DEPT";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Notify Information - Department";
        Index = "1";
    }

    OUT MIR-POL-NOTI-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TPOLN";
        SType = "Date";
        Label = "Date Notices Produced";
        Index = "1";
    }

    OUT MIR-POL-NOTI-MO-DUR-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Frequency of Notices - Months";
        Index = "1";
    }

    OUT MIR-POL-NOTI-QTY-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Number of Notifications Produced";
        Index = "1";
    }

    OUT MIR-POL-NOTI-REASN-CD-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "NOTRE";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Notification Reason";
        Index = "1";
    }

    OUT MIR-POL-NOTI-SEQ-NUM-T[10]
    {
        Length = "3";
        FieldGroup = "Table10";
        DBTableName = "TPOLN";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

}

