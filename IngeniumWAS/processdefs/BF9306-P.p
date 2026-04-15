
#*******************************************************************************
#*  Component:   BF9306-P.p                                                    *
#*  Description: Created for Advance Payment Quote Screen                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLPP1  CTS      INITIAL VERSION                                           *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

P-STEP BF9306-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9306";
        BusinessFunctionName = "Advance Payment Quote";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9306";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }
    
    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    INOUT MIR-ADV-PMT-YR
    {              
        Length = "2";
        DBTableName = "Derived";
        CodeSource = "EDIT";
        CodeType = "PPLSY";
        SType = "Selection";
        Label = "Advance Payment Years and Months";
    }
    
    INOUT MIR-ADV-PMT-MO
    {
        Length = "2";
        DBTableName = "Derived";
        CodeSource = "EDIT";
        CodeType = "PPLSM";
        SType = "Selection";
        Label = "Advance Payment Years and Months";
    } 
    
    OUT MIR-PLAN-ID
    {
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Plan ID";
    }    
        
    INOUT MIR-CALC-DATE
    {
        DBTableName = "Derived";
        Length = "10";
        SType = "Date";
        Label = "Calculation Base Date";
    }
        
    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
        
    OUT MIR-POL-BILL-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Payment Route";
    }
    
    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Payment Mode";
    }
    
    OUT MIR-POL-MPREM-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Modal Premium";
    }    
      
    OUT MIR-ADV-PMT-STRT-DT
    {       
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Advance Payment Start Date";
    }    
    
    OUT MIR-ADV-PMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Advance Payment";
    }    
        
    OUT MIR-OS-PREM
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Outstanding Premium";
    } 
    
    OUT MIR-ADV-PMT-RFND-AMT
    {
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Advance Payment Additional/Refund Amount";
    }        
    
    OUT MIR-TOT-PREM
    {
        Length = "15";
        DBTableName = "Derived";
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