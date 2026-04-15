# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:28 PM EDT

#*******************************************************************************
#*  Component:   BF9D17-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP302U  6.0      New for release 6.0                                       *
#*******************************************************************************

S-STEP BF9D17-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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
        DisplayOnly;
        Key;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }
    
    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-SRVH-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Survival Benefit Payout/Deferral Date";
    }

    IN MIR-SRVH-PRCES-DT    
    {    
        DisplayOnly;
        Length = "10";
        SType = "Date";       
        Label = "Process Date";    
    }    

    IN MIR-DV-TOT-SRVBEN-DED-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Survival Benefit Amount(After Deduction)";
    }
    
    IN MIR-DV-DED-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Deduction Amount";
    }
            
    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner name"; 
    }
        
    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "75";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Subsidiary Company ID";
    }
        
    IN MIR-CLM-ID-T[30]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Claim Id";
        Index = "1";
    }
    
    IN MIR-CVG-NUM-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Coverage No";
        Index = "1";
    }
        
    IN MIR-BNFT-NM-T[30]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table30";
        SType = "Text";
        Label = "Benefit Name";
        Index = "1";
        CodeSource = "EDIT";
      	CodeType = "BENNM";
    }
        
    IN MIR-EVNT-STRT-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        SType = "Date";
        Label = "Payment Event Start date";
        Index = "1";
    }
        
    IN MIR-EVNT-END-DT-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        SType = "Date";
        Label = "Payment Event End date";
        Index = "1";
    }
    
    IN MIR-EVNT-PAID-AMT-T[30]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table30";
        SType = "Currency";
        Label = "Benefit Amount";
        Index = "1";
    }
        
}