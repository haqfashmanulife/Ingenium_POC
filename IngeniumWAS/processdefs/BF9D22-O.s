#*******************************************************************************
#*  Component:   BF9D22-O.s                                                    *
#*  Description: Health congratulatory benefit payout process                  *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  UY3071  CTS      INGENIUM HEALTH CONGRATULATORY BENEFIT                    *
#*******************************************************************************

S-STEP BF9D22-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "HEcngr";
        DelEmptyRows;
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
        DisplayOnly;
        Key;
        Label = "Policy Id";
        Length = "9";
        SType = "Text";
    }
    
   IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-DV-OWN-CLI-NM
    {
	Length = "50";
	DisplayOnly;
	SType = "Text";
	Label = "Owner name"; 
    }
    
    IN MIR-APPL-CTL-PRCES-DT
    {
        Label = "Process Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-CO-RECV-DT
    {
        DisplayOnly;
        Label = "Company Received Date";
        Length = "10";
        SType = "Date";
    }

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        Label = "Pay Out Method";
        Length = "1";
        SType = "Text";
        DisplayOnly;
    }

    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Label = "Journal Date";
        Length = "10";
        SType = "Date";
    }
    
    IN MIR-HLBEN-EFF-DT
    {
	Length = "10";
	SType = "Date";
	DBTableName = "TPOL";
	DisplayOnly;
	Label = "Health Congratulatory Benefit Payout Effective Date";
     }
        
    IN MIR-HLBEN-PAYO-AMT-A
    {
        Length = "20";
        SType = "Currency";
        DisplayOnly;
        Label = "This time's Health Congratulatory Payout Amount A";
     }
 
     IN MIR-HLBEN-PAYO-AMT-B
     {
         Length = "20";
         SType = "Currency";
         DisplayOnly;
         Label = "This time's Health Congratulatory Payout Amount B";
     }
 
    IN MIR-DEFR-HLBEN-PAYO-AMT
    {
	Length = "20";
	SType = "Currency";               
	DisplayOnly;
	Label = "Deferral Health Congratulatory Payout Amount";
    }
        
    IN MIR-DEFR-INT-AMT
    {
	Length = "20";                
	SType = "Currency";               
	DisplayOnly;
	Label = "Deferral Interest Amount";
    }
        
    IN MIR-NET-PAYO-AMT
    {
	Length = "20";              
	SType = "Currency";               
	DisplayOnly;
	Label = "Net Payout Amount";
    }
        
    IN MIR-CLM-POL-ID-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        KeyColumn;
        Label = "Policy No";
        Length = "10";
        SType = "Text";
        Index = "1";
    }

    IN MIR-CLM-ID-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        Index = "1";
        Label = "Claim Id";
        Length = "8";
        SType = "Text";
    }
    
    IN MIR-CLM-CVG-NUM-T[99] 
    {
        DisplayOnly;
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        Index = "1";
        Label = "Coverage No";
        Length = "2";
        SType = "Text";
    }
    
    IN MIR-BNFT-NM-T[99]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table99";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
       CodeSource = "EDIT";
	CodeType = "BENNM";
    }
    
    IN MIR-STRT-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";           
        DisplayOnly;
        SType = "Date";
        Label = "Start date";
        Index = "1";
     }
    
    IN MIR-END-DT-T[99]
    {
        Length = "10";
        FieldGroup = "Table99";
        DisplayOnly;
        SType = "Date";
        Label = "End date";
        Index = "1";
    }
        
    IN MIR-EVNT-UNIT-QTY-T[99]
    {
        Length = "6";
        FieldGroup = "Table99";
        DisplayOnly;
        SType = "Text";
        Label = "Paid Unit";
        Index = "1";
    }
    
    IN MIR-MULT-AMT-T[99]
    {
        Length = "7";
        FieldGroup = "Table99";
        DisplayOnly;
        SType = "Text";
        Label = "Multiplier";
        Index = "1";
    }
    
   IN MIR-ELIG-DAYS-T[99]
   {
        Length = "7";
        FieldGroup = "Table99";
        DisplayOnly;
        SType = "Text";
        Label = "Elligible days";
        Index = "1";
    }
    
    IN MIR-CVG-FACE-AMT-T[99]
    {
        Length = "16";
        FieldGroup = "Table99";
        DisplayOnly;
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }
    
}
