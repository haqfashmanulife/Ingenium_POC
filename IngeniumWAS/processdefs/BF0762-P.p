# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:28 PM EDT

#*******************************************************************************
#*  Component:   BF0762-P.p                                                    *
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
#*******************************************************************************

P-STEP BF0762-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0762";
        BusinessFunctionName = "Policy Commission Summary History";
        BusinessFunctionType = "Comms";
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

    OUT MIR-AGT-ID-T[100]
    {
        Length = "6";
        FieldGroup = "Table100";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Commissionable Agent Number";
        Index = "1";
    }

    OUT MIR-CVG-AGT-CPREM-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "TCVGA";
        SType = "Currency";
        Label = "Commissionable Premium";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[100]
    {
        Length = "2";
        FieldGroup = "Table100";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-DV-AGT-REASN-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "AGT-REASN-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    OUT MIR-DV-COMM-AMT-T[100]
    {
        Length = "13";
        FieldGroup = "Table100";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Net Commission";
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
    OUT MIR-CVG-AGT-TYP-CD-T[100]
    {
        Length = "1";
        Occurs = "100";
        FieldGroup = "Table100";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Coverage Agent Type";
  }
    OUT MIR-TRANS-DT-T[100]
    {
        Length = "10";
        Occurs = "100";
        FieldGroup = "Table100";
        DBTableName = "TUHCO";
        SType = "Date";
        Label = "Transaction Effective Date";
    }

#NWLCOM CHANGES STARTS HERE
    OUT MIR-PREM-PD-DT-T[100]
    {
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

