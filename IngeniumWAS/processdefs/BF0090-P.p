# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:16 PM EDT

#*******************************************************************************
#*  Component:   BF0090-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  R10440  CTS      VM MIGRATION PLAN - REGARDING DUMMY DEPLOYMENT FOR        *  
#*                   INGENIUM PRODUCTION                                       *
#*                                                                             *
#*******************************************************************************

P-STEP BF0090-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0090";
        BusinessFunctionName = "User Message List";
        BusinessFunctionType = "List";
        MirName = "XCWM0090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-BCKWRD-SCROLL-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Scroll Backward Ind";
    }

    INOUT MIR-USER-ID
    {
        Key;
        Length = "8";
        DBTableName = "TMSIN";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-USER-MSG-DT
    {
        Key;
        Length = "10";
        DBTableName = "TMSIN";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Date Message Created";
    }

    INOUT MIR-USER-MSG-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TMSIN";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-USER-MSG-SEVRTY-CD
    {
        Length = "1";
        DBTableName = "TMSIN";
        SType = "Hidden";
        Label = "Severity Code - for index";
    }

    INOUT MIR-USER-MSG-TASK-ID
    {
        Key;
        Length = "4";
        DBTableName = "TMSIN";
        DefaultSession = "LSIR-TASK-ID";
        SType = "Text";
        Label = "CICS Task Number";
    }

    INOUT MIR-USER-MSG-TIME
    {
        Key;
        Length = "8";
        DBTableName = "TMSIN";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Time";
    }

    OUT MIR-BUS-FCN-ID-T[50]
    {
        Length = "4";
        FieldGroup = "Table50";
        DBTableName = "TMSIN";
        SType = "Text";
        Label = "Transaction";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[50]
    {
        Length = "2";
        FieldGroup = "Table50";
        DBTableName = "TMSIN";
        SType = "Text";
        Label = "Coverage";
        Index = "1";
    }

    OUT MIR-MSG-REF-ID-T[50]
    {
        Length = "6";
        FieldGroup = "Table50";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Source Number";
        Index = "1";
    }

    OUT MIR-MSG-REF-NUM-T[50]
    {
        Length = "4";
        FieldGroup = "Table50";
        DBTableName = "TMSGS";
        SType = "Text";
        Label = "Message Number";
        Index = "1";
    }

    OUT MIR-POL-OR-CLI-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CPEVNT-POL-CLI-CD";
        DBTableName = "TMSIN";
        SType = "Text";
        Label = "Policy or Client";
        Index = "1";
    }

    OUT MIR-POL-OR-CLI-CO-ID-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "COMP";
        DBTableName = "TMSIN";
        SType = "Text";
        Label = "Company";
        Index = "1";
    }

    OUT MIR-POL-OR-CLI-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TMSIN";
        SType = "Text";
        Label = "Policy / Client #";
        Index = "1";
    }

    OUT MIR-USER-MSG-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TMSIN";
        SType = "Date";
        Label = "Date";
        Index = "1";
    }

    OUT MIR-USER-MSG-SEQ-NUM-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TMSIN";
        SType = "Text";
        Label = "Sequence";
        Index = "1";
    }

    OUT MIR-USER-MSG-SEVRTY-CD-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "MSG-SEVRTY-CD";
        DBTableName = "TMSIN";
        SType = "Text";
        Label = "Severity Code";
        Index = "1";
    }

    OUT MIR-USER-MSG-TASK-ID-T[50]
    {
        Length = "4";
        FieldGroup = "Table50";
        DBTableName = "TMSIN";
        SType = "Text";
        Label = "Task";
        Index = "1";
    }

    OUT MIR-USER-MSG-TIME-T[50]
    {
        Length = "6";
        FieldGroup = "Table50";
        DBTableName = "TMSIN";
        SType = "Time";
        Label = "Time";
        Index = "1";
    }

    OUT MIR-USER-MSG-TXT-T[50]
    {
        Length = "120";
        FieldGroup = "Table50";
        DBTableName = "TMSIN";
        SType = "Text";
        Label = "Message";
        Index = "1";
    }

}

