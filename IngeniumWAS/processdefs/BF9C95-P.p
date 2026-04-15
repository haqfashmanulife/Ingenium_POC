#*******************************************************************************
#*  Component:   BF9C95-P.p                                                    *
#*  Description:Future dated Trail Calculation Quote Inquiry                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M117PB  CTS      Intial Version                                            *
#*  UYS133  CTS      Addition of PD group size field                           *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*******************************************************************************

P-STEP BF9C95-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C95";
        BusinessFunctionName = "Future dated Trail Calculation Quote Details";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9C90";
    }

   OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPBRQ";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPBRQ";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-PBRQ-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPBRQ";
        SType = "Date";
        Label = "Policy billing request Effective Date";
    }

    OUT MIR-DV-POL-FUT-ACTV-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-POL-FUT-ACTV-TYP-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Activity Type";
    }
    
    OUT MIR-TRAD-PD-TO-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Traditional paid to date";
    }
    

    INOUT MIR-POL-FUT-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Policy Future Bill Type";
    }

    INOUT MIR-POL-FUT-BILL-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Policy Future Bill Mode";
    }
    
    OUT MIR-POL-FUT-MPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "New Modal Premium";
    }

    
    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Bill Mode";
    }

    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Bill Type";
    }
    

    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Current Modal Premium";
    }
#UYS043 CHANGES START HERE
    INOUT MIR-VIR-LAPS-CNCL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Lapse cancellation";
    }
#UYS043 CHANGES END HERE	
#UYS133 CHANGES START
    OUT MIR-PD-GR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
    }
#UYS133 CHANGES END
    
}

