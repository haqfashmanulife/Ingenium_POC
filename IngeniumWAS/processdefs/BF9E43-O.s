# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF9E43O.s                                                     *
#*  Description: Deferment Quote - Result                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3066  20SEP23  CHANGES FOR SAVING RIDER                                  *
#*******************************************************************************

S-STEP BF9E43-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Quotedefer";
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

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";
    }

    IN MIR-JRNL-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Journal Date";      
    } 
     
    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }

    IN  MIR-EVNT-ACTV-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "DEFR-ACTV-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }

    IN MIR-TOT-PD-PREM-AMT
    {
        DisplayOnly;           
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Total Premium Paid for the Policy";
    } 

#UY3066 CHANGES STARTS HERE

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

#UY3066 CHANGES ENDS HERE
    
    IN MIR-POL-BILL-MODE-CD
    {     
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    }

    IN MIR-MAT-DEFR-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Maturity Amount(Deferment Amount)";
    }  

    IN MIR-DEFR-INT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Deferment Interest";
    } 

    IN MIR-POL-MAT-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Maturity Date(Deferment Start Date)";
    }    
    
    IN MIR-DEFR-INT-CAP-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Next Deferment Interest Capitalization Date";
    }    
    
    IN MIR-DEFR-MAT-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Deferment End Date";
    }
    
    IN MIR-REMIT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Remittance Amount";
    }
 
}       