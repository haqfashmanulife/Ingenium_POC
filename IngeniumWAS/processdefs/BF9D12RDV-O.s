#*******************************************************************************
#*  Component:   BF9D12RDV-O.s                                                 *
#*  Description: Rider A/V Voluntary Withdrawal Process                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CD3001  CTS      CHANGES DONE AS PART OF CERBERUS DAY 3.0                  *
#*******************************************************************************

S-STEP BF9D12RDV-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        FocusField = "confirmButton";
        FocusFrame = "ButtonFrame";
        Type = "Output";
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
        SType="Hidden";
    }
	
    IN MIR-POL-ID-BASE 
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }
    
   IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    }  

    IN MIR-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Pay Out Method";
    }

    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
    }
    
    IN MIR-ATO-NOT-APPL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "ATO Not Applicable";
    }
    
    IN MIR-HO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }
        
    IN MIR-VWD-SPEC-AMT
    {
        DisplayOnly;
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-SP";
        SType = "Currency";
        Label = "Specified Amount";
     }
    
    IN MIR-PAYO-JPY-BNFT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Text";
        Label = "JPY Benefit Rider";

    }
    
    IN MIR-RID-AV-BAL-AMT
    {
        DisplayOnly;
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Rider A/V Balance";
    }
        
    IN MIR-WTHDR-AMT-AFTR-DED
    {
        DisplayOnly;
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Withdrawal Amount(After Interest Deduction)";
    }
  
   IN MIR-DLY-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Daily Interest";
    }
  
   IN MIR-WTHDR-AMT
    {
        DisplayOnly;
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Withdrawal Amount";
    }
  
   IN MIR-AV-BAL-AMT-AFTR-WTHDR
    {
        DisplayOnly;
        Length = "15";
        CurrencyCode="MIR-POL-CRCY-CD";
        SType = "Currency";
        Label = "Rider A/V Balance After Withdrawal";
    }
  
   IN MIR-RDR-AV-WTHDR-YEN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Rider A/V Withdrawal Amount(Yen)";
    }

     INOUT MIR-POL-CRCY-CD
    {   
        Length = "2";
        SType = "Hidden";              
    } 

     INOUT MIR-POL-CRCY-SP
    {   
        Length = "2";
        SType = "Hidden";                
    } 

     INOUT MIR-SPWL-PLAN-IND
    {
        Length = "1"; 
        SType = "Hidden";
    }

}






