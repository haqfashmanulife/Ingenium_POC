# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF0761-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00071  KRW      Replace App Received Date with Journal Date               *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  Q50535  CTS      FIX AS PART OF M245B2                                     *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

S-STEP BF0761-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Accts";
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

    IN MIR-ACCT-BASE-ID-T[100]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Account to Credit / Debit";
        Index = "1";
    }

    IN MIR-DV-ACCT-DESC-TXT-T[100]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    IN MIR-DV-ACCT-TRXN-AMT-T[100]
    {
#Q50535 CHANGES START HERE    
#M245B2 CHANGES START HERE    
#        CurrencyCode = "MIR-POL-CRCY-CD-1";
#M245B2 CHANGES END HERE 
        CurrencyCode = "MIR-POL-CRCY-CD-1-T[]";
#Q50535 CHANGES END HERE         
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Amount";
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
    IN MIR-JRNL-DT-T[100]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Date";
        Label = "Journal Date";
        Index = "1";
    }
    IN MIR-OPER-CAT-CD-T[100]
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        SType = "Text";
        Label = "OPERATION CATEGORY";
        Index = "1";
    }
    IN MIR-MCL-BASE-ID-T[100]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Text";
        Label = "MCL Account";
        Index = "1";
    }
#Q50535 CHANGES START HERE    
#M245B2 CHANGES START HERE    
#     INOUT MIR-POL-CRCY-CD-1
#        {
#            Length = "2";
#            SType = "Hidden";
#            Label = "Currency";
#    }
#    
#M245B2 CHANGES END HERE

       INOUT MIR-POL-CRCY-CD-1-T[100]
       {
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
       }
 
#Q50535 CHANGES END HERE  
#UY3049 CHANGES STARTS
    INOUT MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    INOUT MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS
}

