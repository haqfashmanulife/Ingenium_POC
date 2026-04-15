
#*******************************************************************************
#*  Component:   BF9306-O.s                                                    *
#*  Description: New Screen for Advance Payment Quote                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLPP1  CTS      INITIAL VERSION                                           *
#*  M271O1  CTS      CHANGES DONE AS PART OF FRA                               *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

S-STEP BF9306-O
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
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
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
    
    IN MIR-ADV-PMT-YR
    {      
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPLSY";
        SType = "Text";
        Label = "Advance Payment Years and Months";
    }

    IN MIR-ADV-PMT-MO
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "PPLSM";
        SType = "Text";
        Label = "Advance Payment Years and Months";
    } 

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan ID";
    }    
    
    IN MIR-CALC-DATE
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Calculation Base Date";
    }
    
    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Payment Route";
    }

    IN MIR-POL-BILL-MODE-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment Mode";
    } 
    
    IN MIR-POL-MPREM-AMT
    {
#M271O1 CHANGES START HERE 
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE   
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Modal Premium";
    }
    
    IN MIR-ADV-PMT-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Advance Payment Start Date";
    }  
    
    IN MIR-ADV-PMT
    {
#M271O1 CHANGES START HERE 
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE      
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Advance Payment";
    }        

    IN MIR-OS-PREM
    {

#M271O1 CHANGES START HERE 
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE      
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Outstanding Premium";
    }            

    IN MIR-ADV-PMT-RFND-AMT
    {
#M271O1 CHANGES START HERE 
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE      
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Advance Payment Additional/Refund Amount";
    }                
    
    IN MIR-TOT-PREM
    {
#M271O1 CHANGES START HERE 
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Premium";
    }  
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 
#UYS133 CHANGES START
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    } 
#UYS133 CHANGES END
}