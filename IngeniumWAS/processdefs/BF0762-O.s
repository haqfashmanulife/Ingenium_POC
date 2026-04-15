# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0762-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLCOM  CTS      ADDED PREMIUM PAID DATE FOR NWLCOM                        *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

S-STEP BF0762-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Comms";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID-BASE";
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

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-TRXN-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-POL-TRXN-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-POL-TRXN-SEQ-NUM
    {
        Key;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-TRXN-TASK-ID
    {
        Key;
        Length = "4";
        DefaultConstant = "9999";
        SType = "Text";
        Label = "Task Number";
    }

    INOUT MIR-POL-TRXN-TIME
    {
        Key;
        Length = "7";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Text";
        Label = "Time";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-AGT-ID-T[100]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Commissionable Agent Number";
        Index = "1";
    }

    IN MIR-CVG-AGT-CPREM-AMT-T[100]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD-1-T[]";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Commissionable Premium";
        Index = "1";
    }

    IN MIR-CVG-NUM-T[100]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    IN MIR-DV-AGT-REASN-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "AGT-REASN-CD";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    IN MIR-DV-COMM-AMT-T[100]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD-1-T[]";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Net Commission";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-TRXN-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Process Date";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-POL-TRXN-EFF-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-POL-TRXN-SEQ-NUM-T[100]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-POL-TRXN-TASK-ID-T[100]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Task Number";
        Index = "1";
    }

    IN MIR-POL-TRXN-TIME-T[100]
    {
        DisplayOnly;
        Length = "7";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Time";
        Index = "1";
    }
    IN MIR-CVG-AGT-TYP-CD-T[100]
    {
        DisplayOnly;
        Length = "1";
        Occurs = "100";
        FieldGroup = "Table100";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Coverage Agent Type";
    }
    IN MIR-TRANS-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        Occurs = "100";
        FieldGroup = "Table100";
        DBTableName = "TUHCO";
        SType = "Date";
        Label = "Transaction Effective Date";
    }

    
#NWLCOM CHANGES STARTS HERE
    IN MIR-PREM-PD-DT-T[100]
    {
        DisplayOnly;
        Length = "10";
        Occurs = "100";
        FieldGroup = "Table100";
        DBTableName = "TTH";
        SType = "Date";
        Label = "Premium Paid Date";
    }
#NWLCOM CHANGES ENDS HERE    
#M245B2 CHANGES START HERE 
     INOUT MIR-POL-CRCY-CD-1-T[100]
        {
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
    }
#M245B2 CHANGES END HERE     
}

