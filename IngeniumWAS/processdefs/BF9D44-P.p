#*******************************************************************************
#*  Component:   BF9D44-P.p                                                    *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION LIST SCREEN                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP251B  CTS     TRAD DEPOSIT HISTORY MODIFICATION LIST SCREEN              *
#*******************************************************************************

P-STEP BF9D44-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D44";
        BusinessFunctionName = "Trad Deposit History Modification List";
        BusinessFunctionType = "List";
        MirName = "CCWM9D40";
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
    
    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
    
    OUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan ID";
    }
    
    OUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }
    
    OUT MIR-POL-PD-TO-MO-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policy Paid to Month";
    }
    
    OUT MIR-POL-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Paid to Date";
    }

    OUT MIR-POL-PD-DURATION-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Policy Paid Duration";
    }
    
    OUT MIR-TRAD-PD-TO-MO-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Trad Paid to Month";
    }
    
    OUT MIR-TRAD-PD-TO-DT-NUM
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Trad Paid to Date";
    }

    OUT MIR-TRAD-PD-DURATION-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Trad Paid Duration";
    }
    
    
    
    OUT MIR-COLCT-MTHD-CD-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        CodeSource = "DataModel";
        CodeType = "COLCT-MTHD-CD";
        SType = "Text";
        Label = "Collection Method";
        Index = "1";
    }
    
    OUT MIR-COLCT-CATG-CD-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        CodeSource = "DataModel";
        CodeType = "COLCT-CATG-CD";
        SType = "Text";
        Label = "Collection Category";
        Index = "1";
    }
    
    OUT MIR-TRAD-JRNL-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Trad Journal Date";
        Index = "1";
    }
    
    OUT MIR-TRAD-SO-JRNL-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Trad SO Journal Date";
        Index = "1";
    }
    
    OUT MIR-TRAD-RECV-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Trad Received Date";
        Index = "1";
    }
    
    OUT MIR-PREM-DUE-MO-NUM-T[50]
    {
        Length = "7";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Premium Due Month";
        Index = "1";
    }
    
    OUT MIR-DPOS-RFND-QTY-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Number of Deposits/ Refunds";
        Index = "1";
    }
    
    OUT MIR-TRXN-AMT-T[50]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Currency";
        Label = "Transaction Amount";
        Index = "1";
    }
    
    OUT MIR-TRXN-PRCES-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Transaction Process Date";
        Index = "1";
    }
    
    OUT MIR-SEQ-NUM-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        DBTableName = "TDH";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }
    

    INOUT MIR-TRAD-SO-JRNL-DT
    {
        Length = "10";
        DBTableName = "TDH";
        Label = "Trad SO Journal Date";
    }
    
    INOUT MIR-SEQ-NUM
    {
        Length = "3";
        DBTableName = "TDH";
        Label = "Sequence Number";
    }
    
    OUT MIR-PMT-CRCY-CD
    {
    	Length = "2"; 
    	SType = "Hidden";
        Label = "Currency";
    }  
        
}

