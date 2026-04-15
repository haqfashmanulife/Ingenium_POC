# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0761-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00071  KRW      Replace App Received Date with Journal Date               *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  Q50535  CTS      FIX AS PART OF M245B2                                     *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

P-STEP BF0761-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0761";
        BusinessFunctionName = "Policy Accounting Summary History";
        BusinessFunctionType = "Accts";
        MirName = "CCWM0931";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "THI";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-TRXN-DT
    {
        Key;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-POL-TRXN-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "THI";
        DefaultSession = "LSIR-SYS-DT-EXT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-POL-TRXN-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "THI";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-TRXN-TASK-ID
    {
        Key;
        Length = "4";
        DBTableName = "THI";
        DefaultConstant = "9999";
        SType = "Text";
        Label = "Task Number";
    }

    INOUT MIR-POL-TRXN-TIME
    {
        Key;
        Length = "7";
        DBTableName = "THI";
        DefaultSession = "LSIR-SYS-TIME";
        SType = "Text";
        Label = "Time";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-ACCT-BASE-ID-T[100]
    {
        Length = "6";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Account to Credit / Debit";
        Index = "1";
    }

    OUT MIR-DV-ACCT-DESC-TXT-T[100]
    {
        Length = "20";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    OUT MIR-DV-ACCT-TRXN-AMT-T[100]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Amount";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-POL-TRXN-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        KeyColumn;
        DBTableName = "THI";
        SType = "Date";
        Label = "Process Date";
        Index = "1";
    }

    OUT MIR-POL-TRXN-EFF-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-POL-TRXN-SEQ-NUM-T[100]
    {
        Length = "3";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-POL-TRXN-TASK-ID-T[100]
    {
        Length = "4";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Text";
        Label = "Task Number";
        Index = "1";
    }

    OUT MIR-POL-TRXN-TIME-T[100]
    {
        Length = "7";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Text";
        Label = "Time";
        Index = "1";
    }
    OUT MIR-JRNL-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "THI";
        SType = "Date";
        Label = "Journal Date";
        Index = "1";
    }
    OUT MIR-OPER-CAT-CD-T[100]
    {
        Length = "40";
        DBTableName = "THI";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        SType = "Selection";
        Label = "OPERATION CATEGORY";
        Index = "1";                                                                                    
    }
    OUT MIR-MCL-BASE-ID-T[100]
    {
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

