#*******************************************************************************
#*  Component:   BF0523FBC-O.s                                                 *
#*  Description: Free Withdrawal confirm screen                                *
#*                                                                             *
#*******************************************************************************
#*                                                                             *
#*  UY3060  CTS      Dividend Payout Process for stream3 product               *
#*******************************************************************************

S-STEP BF0523FBC-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "TDSrvb";
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
       Length = "9";
       SType = "Text";
       Label = "Policy Id";
    }
   
    IN MIR-POL-ID-SFX
    {
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

    IN MIR-POL-TRXN-EFF-DT
    {
        DisplayOnly;
        Label = "Effective Date";
        Length = "10";
        Mandatory;
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
    
    IN 	MIR-POL-DIV-OPT-CD
    {
        CodeSource = "DataModel";
        CodeType = "POL-DIV-OPT-CD";
        DisplayOnly;
        Label = "Policy Dividend Option";
        Length = "40";
        SType = "Text";
    }

    IN MIR-POL-DOD-ACUM-AMT
    {
        DisplayOnly;
        Length = "15";      
        SType = "Currency";   
        Label = "Accumulated Dividend Amount";   
    } 

    IN 	MIR-DIV-ACUM-INT-AMT
    {
        DisplayOnly;
        Length = "15";      
        SType = "Currency";   
        Label = "Accumulated Interest Amount:";   
    }  

    IN 	MIR-DIV-INT-RT-ID
    {
        DisplayOnly;
        Length = "4"; 
        Decimals = "2";		
        SType = "Percent";   
        Label = "Dividend Interest Rate:";   
    } 

    IN 	MIR-DIV-PMT-AMT
    {
        DisplayOnly;
        Length = "15";      
        SType = "Currency";   
        Label = "Cumulative Dividend Amount:";   
    }

}
