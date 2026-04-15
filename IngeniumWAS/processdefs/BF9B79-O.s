#*******************************************************************************
#*  Component:   BF9B79-O.s                                                    *
#*  Description: Future CSV - Monthly                                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP269A  CTS      INITIAL VERSION                                           *
#*******************************************************************************

S-STEP BF9B79-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        DelEmptyRows;
        FocusField = "OKButton";
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
    OUT index
    {
        SType="Hidden";
    }
    IN MIR-POL-ID-BASE 
    {
        DefaultSession = "MIR-POL-ID-BASE";
        DisplayOnly;
        Key;
        Label = "Policy Id";
        Length = "9";
        SType = "Text";
    }
     IN MIR-POL-ID-SFX 
    {
        DefaultSession = "MIR-POL-ID-SFX";
        DisplayOnly;
        Key;
        Label = "Suffix";
        Length = "1";
        SType = "Text";
    }
    IN  MIR-DV-OWN-CLI-NM
    {
         DisplayOnly;
         Length = "75";
         SType = "Text";
         Label = "Owner Name";
    }
    IN MIR-APPL-CTL-PRCES-DT
    {
        DefaultSession = "LSIR-PRCES-DT";
        Label = "Date Of Change";
        Length = "10";
        Mandatory;
        SType = "Date";
    }
    IN  MIR-POL-SNDRY-AMT
    {
         CurrencyCode = "MIR-POL-CRCY-CD";
         DisplayOnly;
         Signed;
         Length = "14";
         SType = "Currency";
         Label = "Sundry Amount";
    }
    IN MIR-POL-BILL-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment Mode";
    }
     IN MIR-DV-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Effective Date";
    }
    IN  MIR-MTHV-DT-T[12]
    {
        DisplayOnly;        
        Length = "10";
        SType = "Date";
        Label = "Anniversary date";  
        Index = "1";        
    }
    
    IN  MIR-INSRD-AGE-MTHLY-T[12]
    {
        DisplayOnly;            
        Length = "3";
        SType = "Number";
        Label = "Insured age";
        Index = "1"; 
    }
    
    IN  MIR-ELPSD-ISS-YR-NB-T[12]
    {
        DisplayOnly;            
        Length = "3";
        SType = "Number";
        Label = "Number of Years Elapsed After New Business";
        Index = "1";         
    }
    
    IN  MIR-ELPSD-MO-ANNIV-T[12]
    {
        DisplayOnly;            
        Length = "3";
        SType = "Number";
        Label = "Number of Months Elapsed After Anniversary Date";
        Index = "1";         
    }
    IN  MIR-ELPSD-MO-FA-RED-T[12]
    {
        DisplayOnly;            
        Length = "3";
        SType = "Number";
        Label = "Number of Months Elapsed After FA Reduction";
        Index = "1";         
    } 
    IN  MIR-ELPSD-YR-FA-RED-T[12]
    {
        DisplayOnly;            
        Length = "3";
        SType = "Number";
        Label = "Number of Year Elapsed After FA Reduction";
        Index = "1";         
    }     
    IN  MIR-CSV-AMT-MTHLY-T[12]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;            
        Length = "16";
        SType = "Currency";
        Label = "Cash Surrender Value";
        Index = "1";
    }
    
    IN  MIR-TOT-ACCUM-AMT-MTHLY-T[12]
    {
        CurrencyCode = "MIR-POL-CRCY-CD";
        DisplayOnly;            
        Length = "16";
        SType = "Currency";
        Label = "cumulative Amount of  Premiums Paid";
        Index = "1";
    }    
      
    IN  MIR-CSV-RATIO-T[12]
    {
        DisplayOnly;            
        Length = "3";
        SType = "Percent";
        Label = "Rate of CSV to Premium Paid";
        Index = "1";
    }      
    IN MIR-POL-CRCY-CD
    {
     
        Length = "2";
        SType = "Text";
        Label = "Currency";
     }

}
