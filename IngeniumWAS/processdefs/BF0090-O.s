# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:13 PM EDT

#*******************************************************************************
#*  Component:   BF0090-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  R10440  CTS      VM MIGRATION PLAN - REGARDING DUMMY DEPLOYMENT FOR        *  
#*                   INGENIUM PRODUCTION                                       *
#*******************************************************************************

S-STEP BF0090-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-USER-ID";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-USER-ID
    {
        Key;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-USER-MSG-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Date Message Created";
    }

    INOUT MIR-USER-MSG-SEQ-NUM
    {
        Key;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-USER-MSG-SEVRTY-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Severity Code - for index";
    }

    INOUT MIR-USER-MSG-TASK-ID
    {
        Key;
        Length = "4";
        DefaultSession = "LSIR-TASK-ID";
        SType = "Text";
        Label = "CICS Task Number";
    }

    INOUT MIR-USER-MSG-TIME
    {
        Key;
        Length = "8";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Time";
        Label = "Time";
    }

    IN MIR-BUS-FCN-ID-T[50]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Transaction";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[50]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Coverage";
        Index = "1";
    }

    IN MIR-MSG-REF-ID-T[50]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Source Number";
        Index = "1";
    }

    IN MIR-MSG-REF-NUM-T[50]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Message Number";
        Index = "1";
    }

    IN MIR-POL-OR-CLI-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CPEVNT-POL-CLI-CD";
        SType = "Text";
        Label = "Policy or Client";
        Index = "1";
    }

    IN MIR-POL-OR-CLI-CO-ID-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "XTAB";
        CodeType = "COMP";
        SType = "Text";
        Label = "Company";
        Index = "1";
    }

    IN MIR-POL-OR-CLI-ID-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Policy / Client #";
        Index = "1";
    }

    IN MIR-USER-MSG-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Date";
        Index = "1";
    }

    IN MIR-USER-MSG-SEQ-NUM-T[50]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Sequence";
        Index = "1";
    }

    IN MIR-USER-MSG-SEVRTY-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "MSG-SEVRTY-CD";
        SType = "Text";
        Label = "Severity Code";
        Index = "1";
    }

    IN MIR-USER-MSG-TASK-ID-T[50]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Task";
        Index = "1";
    }

    IN MIR-USER-MSG-TIME-T[50]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table50";
        SType = "Time";
        Label = "Time";
        Index = "1";
    }

    IN MIR-USER-MSG-TXT-T[50]
    {
        DisplayOnly;
        Length = "120";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Message";
        Index = "1";
    }

    IN MIR-DV-BCKWRD-SCROLL-IND
    {
        Length = "1";
        SType = "Hidden";
        Label = "Scroll";
    }

}

