#*******************************************************************************
#*  Component:   BF9B30-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1542  CTS      Created for APL History                                   *
#*  M319B5  CTS      CHANGES AS PART OF FXWL APL HISTORY                       *
#*******************************************************************************

S-STEP BF9B30-O
{
    ATTRIBUTES
    {
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-LOAN-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-POL-LOAN-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-LOAN-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-POL-LOAN-TRXN-AMT
    {
        Signed;                
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Loan Transaction Amount";
    }

    IN MIR-POL-LOAN-TRXN-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-LOAN-TRXN-CD";
        SType = "Text";
        Label = "Loan Transaction";
    }
    
    IN MIR-LOAN-PD-DUR
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Paid Duration";
    }

    IN MIR-LOAN-INCR-DECR-AMT
    {
        Signed;                
        DisplayOnly;
        Length = "15";
        SType = "Currency";
#M319B5 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE         
        Label = "APL Premium";
    }

    IN MIR-APL-DPOS-QTY
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Number of APL deposits";
    }

    IN MIR-LOAN-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
#M319B5 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE         
        Label = "Interest amount (Capitalization)";
    }

    IN MIR-LOAN-BAL-AMT
    {
        Signed;                
        DisplayOnly;
        Length = "15";
        SType = "Currency";
#M319B5 CHANGES STARTS HERE
	CurrencyCode = "MIR-POL-CRCY-CD";
#M319B5 CHANGES ENDS HERE         
        Label = "Balance of APL";
    }

    IN MIR-LOAN-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }

    IN MIR-PREV-UPDT-USER-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-NXT-INT-CAP-YM
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Next interest capitalization Year/Month";
    }
#M319B5 CHANGES STARTS HERE
    IN MIR-POL-CRCY-CD
    {     
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    } 
#M319B5 CHANGES ENDS HERE     

}

