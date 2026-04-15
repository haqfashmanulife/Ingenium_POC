# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9H36-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYDM28   CTS      INITIAL VERSION OF UNISYS POLICY INQUIRY SCREEN        *
#*                                                                             *
#*******************************************************************************

P-STEP BF9H36-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9H36";
        BusinessFunctionName = "Conversion Policy Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9H36";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TUSPM";
        SType = "Text";
        Label = "Policy Id";
    }
    INOUT MIR-LARG-TYP
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Large Type Code";
    }    
    OUT MIR-CNVR-DISC-TPREM-AMT 
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Total discount premium";
    }
    OUT MIR-CNVR-ACT-PREM-AMT 
    {
        DisplayOnly;
        Length = "07";
        SType = "Text";
        Label = "Actual premium";
    }
	OUT MIR-CNVR-PREM-PD-TOT-AMT 
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Paid premium total";
    }
    OUT MIR-CNVR-DIV-ACCUM-AMT 
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Payment dividend accumulation";
    }
    OUT MIR-CNVR-SINGLE-PREM-AMT 
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Single premium";
    }
    OUT MIR-CNVR-DIV-AMT 
    {
        DisplayOnly;
        Length = "08";
        SType = "Text";
        Label = "Dividend";
    }
   OUT MIR-D2G-PREV-POL-ID-1
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre issue policy ID-(01)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-1
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-1
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-1
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-1
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-1           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-1        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-1             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-1             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-1         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-1            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-1   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-1            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-2   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (02)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-2 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-2     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-2          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-2           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-2           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-2        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-2               
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-2             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-2         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-2            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-2   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-2            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-3   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (03)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-3 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-3     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-3          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-3           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-3           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-3        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-3             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-3             
	{
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-3         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-3            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-3   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-3            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-4   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID- (04)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-4 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-4     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-4          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-4           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-4           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-4        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-4             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-4             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-4         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-4            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-4   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-4            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-5   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID- (05)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-5 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-5     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-5          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-5           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-5           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-5        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-5             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-5             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-5         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-5            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-5   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-5            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-6   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (06)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-6 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-6     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-6          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-6           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-6           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-6        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-6             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-6             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-6         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-6            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-6   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-6            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-7   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (07)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-7 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-7     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-7          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-7           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-7           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-7        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-7             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-7             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-7         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-7            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-7   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-7            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-8   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (08)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-8 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-8     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-8          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-8           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-8           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-8        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-8             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-8             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-8         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-8            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-8   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-8            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-9   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (09)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-9 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-9     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-9          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-9           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-9           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-9        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-9             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-9             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-9         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-9            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-9   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-9            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-10  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (10)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-10
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-10    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-10         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-10          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-10          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-10       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-10            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-10            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-10        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-10           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-10  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-10           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-11  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (11)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-11
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-11    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-11         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-11          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-11          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-11       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-11            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-11            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-11        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-11           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-11  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical treatment S";
   }
   OUT MIR-D2G-X2-11           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-12  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (12)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-12
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-12    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-12         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-12          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-12          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-12       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-12            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-12            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-12        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-12           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-12  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-12           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-13  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (13)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-13
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-13    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-13         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-13          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-13          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-13       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-13            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-13            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-13        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-13           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-13  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-13           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-14  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (14)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-14
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-14    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-14         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-14          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-14          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-14       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-14            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-14            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-14        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-14           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-14  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-14           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-D2G-PREV-POL-ID-15  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (15)";
   }
   OUT MIR-D2G-PREV-SMAL-TYP-15
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-D2G-TV5X-TV0X-15    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-D2G-TKAV-15         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-D2G-TRX-15          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-D2G-TYP-15          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-D2G-POL-DT-15       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-D2G-N-15            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-D2G-M-15            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-D2G-MAT-S-15        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-D2G-X1-15           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-D2G-MED-BASIC-S-15  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-D2G-X2-15           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-CNVR-POL-ID         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Business policy ID after conversion";
   }
   OUT MIR-CNVR-SMAL-TYP-CD    
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "〃 small type";
   }
   OUT MIR-CNVR-DT             
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Conversion date";
   }
   OUT MIR-AG1-PIN             
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Pin code AC";
   }
   OUT MIR-AG1-TOT-REBT        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Total rebate P (Annual payment P)";
   }
   OUT MIR-AG1-DIV             
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Dividend";
   }
   OUT MIR-AG1-PLAN-DT         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Conversion planned date";
   }
   OUT MIR-AG1-PMT-MTHD        
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Payment method";
   }
   OUT MIR-AG1-PAID-P-TOT      
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Paid P total";
   }
   OUT MIR-AG1-PMT-B-ACCUM     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Payment B accumulation";
   }
   OUT MIR-AG1-SGL-PREM-AMT    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Single premium";
   }
   OUT MIR-A2G-PREV-POL-ID-1   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (01)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-1 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-1     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-1          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-1           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-1           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-1        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date ";
   }
   OUT MIR-A2G-N-1             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-1             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-1         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-1            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-1   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-1            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-2   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (02)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-2 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-2     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-2          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-2           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-2           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-2        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-2             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-2             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-2         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-2            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-2   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-2            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-3   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (03)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-3 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-3     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-3          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-3           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-3           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-3        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-3             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-3             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-3         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-3            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-3   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-3            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-4   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (4)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-4 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type ";
   }
   OUT MIR-A2G-TV5X-TV0X-4     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-4          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-4           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-4           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-4        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-4             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-4             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-4         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-4            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-4   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-4            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-5   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (05)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-5 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type ";
   }
   OUT MIR-A2G-TV5X-TV0X-5     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-5          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-5           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-5           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-5        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-5             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-5             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-5         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-5            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-5   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-5            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-6   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (06)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-6 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-6     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-6          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-6           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-6           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "type";
   }
   OUT MIR-A2G-POL-DT-6        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-6             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-6             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-6         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-6            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-6   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-6            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-7   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (07)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-7 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-7     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-7          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-7           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-7           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-7        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-7             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-7             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-7         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-7            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-7   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-7            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-8   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (08)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-8 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-8     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-8          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-8           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-8           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-8        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-8             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-8             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-8         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-8            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-8   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-8            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-9   
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (09)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-9 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type ";
   }
   OUT MIR-A2G-TV5X-TV0X-9     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-9          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-9           
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-9           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-9        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-9             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-9             
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-9         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-9            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-9   
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-9            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-10  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (10)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-10
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-10    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-10         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-10          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-10          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-10       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-10            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-10            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-10        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-10           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-10  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-10           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-11  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (11)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-11
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-11    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-11         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-11          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-11          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-11       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-11            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-11            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-11        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-11           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-11  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-11           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-12  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (12)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-12
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-12    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-12         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-12          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-12          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-12       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-12            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-12            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-12        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-12           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-12  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-12           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-13  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (13)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-13
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-13    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-13         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-13          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-13          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-13       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-13            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-13            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-13        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-13           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-13  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-13           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-14  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID (14)";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-14
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-14    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-14         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-14          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-14          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-14       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-14            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-14            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-14        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-14           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-14  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-14           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-A2G-PREV-POL-ID-15  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Pre business policy ID";
   }
   OUT MIR-A2G-PREV-SMAL-TYP-15
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "previous policy small type";
   }
   OUT MIR-A2G-TV5X-TV0X-15    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tV5x,tV0x";
   }
   OUT MIR-A2G-TKAV-15         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tkaV";
   }
   OUT MIR-A2G-TRX-15          
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "tRx";
   }
   OUT MIR-A2G-TYP-15          
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Type";
   }
   OUT MIR-A2G-POL-DT-15       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy date";
   }
   OUT MIR-A2G-N-15            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "N";
   }
   OUT MIR-A2G-M-15            
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "M";
   }
   OUT MIR-A2G-MAT-S-15        
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Maturity S";
   }
   OUT MIR-A2G-X1-15           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X1";
   }
   OUT MIR-A2G-MED-BASIC-S-15  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Medical basic S";
   }
   OUT MIR-A2G-X2-15           
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "X2";
   }
   OUT MIR-B2G-LIAB-RSRV       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Liability reserve";
   }
   OUT MIR-B2G-PLN-INT         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Interest on policy loan";
   }
   OUT MIR-B2G-PLN-INT-EXDF    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Excess or deficiency of interest on loan";
   }
   OUT MIR-B2G-UNEARN-PREM     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Outstanding・Unearned premium";
   }
   OUT MIR-B2G-PREM-EXDF       
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Premium excess or deficiency";
   }
   OUT MIR-B2G-DIV             
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Dividend";
   }
   OUT MIR-B2G-DIV-EXDF        
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Dividend excess or deficiency";
   }
   OUT MIR-B2G-POL-LOAN-AMT    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Policy loan amount";
   }
   OUT MIR-B2G-APL             
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "APL";
   }
   OUT MIR-B2G-APL-INT         
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "APL interest";
   }
   OUT MIR-B2G-POL-ID          
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Representative business policy ID";
   }
   OUT MIR-B2G-SMAL-TYP        
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Representative business small type";
   }
   OUT MIR-B2G-DIV-YR          
   {
       DisplayOnly;
       Length="4";
       SType = "Text";
       Label = "Dividend year";
   }
   OUT MIR-B2G-UNEARN-FREQ     
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Outstanding・unearned frequency";
   }
   OUT MIR-B2G-BASE-DT         
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Base date";
   }
   OUT MIR-B2G-OTH-REFND-AMT   
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Other refund amount";
   }
   OUT MIR-B2G-HLTH-BONUS      
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "health award bonus (Deposit +B)";
   }
   OUT MIR-B2G-SRV-BNFT        
   {
       DisplayOnly;
       Length="10";
       SType = "Text";
       Label = "Survival benefit";
   }
   OUT MIR-B2G-SRV-BNFT-DFR-INT
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Survival benefit's deferred interest";
   }
   OUT MIR-B2G-SCHL-ADM-AMT    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Admission to school award";
   }
   OUT MIR-B2G-SCHL-ADM-DFR-INT
   {
       DisplayOnly;
       Length="10";
       SType = "Text";
       Label = "Deffered interest on admission to school award";
   }
   OUT MIR-NC-BAL-DISC-DUR     
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Discount period";
   }
   OUT MIR-NC-BAL-PRCS-CD-1    
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Process code (CH) (1)";
   }
   OUT MIR-NC-BAL-PRCS-DT-1    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Process date: year, month, day";
   }
   OUT MIR-NC-BAL-INT-CAP-YM-1 
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Interest capitalization, appropriation year and month";
   }
   OUT MIR-NC-BAL-ELAPS-YR-1   
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Elapsed year";
   }
   OUT MIR-NC-BAL-AMT-1        
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "Conversion balance";
   }
   OUT MIR-NC-BAL-YR-APRO-VAL-1
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Yearly appropriation value";
   }
   OUT MIR-NC-BAL-REFUND-VAL-1 
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "Refund reimbursement value";
   }
   OUT MIR-NC-BAL-PRCS-CD-2    
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Process code (CH) (2)";
   }
   OUT MIR-NC-BAL-PRCS-DT-2    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Process date: year, month, day";
   }
   OUT MIR-NC-BAL-INT-CAP-YM-2 
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Interest capitalization, appropriation year and month";
   }
   OUT MIR-NC-BAL-ELAPS-YR-2   
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Elapsed year";
   }
   OUT MIR-NC-BAL-AMT-2        
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "Conversion balance";
   }
   OUT MIR-NC-BAL-YR-APRO-VAL-2
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Yearly appropriation value";
   }
   OUT MIR-NC-BAL-REFUND-VAL-2 
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "Refund reimbursement value";
   }
   OUT MIR-NC-BAL-PRCS-CD-3    
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Process code (CH) (3)";
   }
   OUT MIR-NC-BAL-PRCS-DT-3    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Process date: year, month, day";
   }
   OUT MIR-NC-BAL-INT-CAP-YM-3 
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Interest capitalization, appropriation year and month";
   }
   OUT MIR-NC-BAL-ELAPS-YR-3   
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Elapsed year";
   }
   OUT MIR-NC-BAL-AMT-3        
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "Conversion balance";
   }
   OUT MIR-NC-BAL-YR-APRO-VAL-3
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Yearly appropriation value";
   }
   OUT MIR-NC-BAL-REFUND-VAL-3 
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "Refund reimbursement value";
   }
   OUT MIR-NC-BAL-PRCS-CD-4    
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Process code (CH) (4)";
   }
   OUT MIR-NC-BAL-PRCS-DT-4    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Process date: year, month, day";
   }
   OUT MIR-NC-BAL-INT-CAP-YM-4 
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Interest capitalization, appropriation year and month";
   }
   OUT MIR-NC-BAL-ELAPS-YR-4   
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Elapsed year";
   }
   OUT MIR-NC-BAL-AMT-4        
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "Conversion balance";
   }
   OUT MIR-NC-BAL-YR-APRO-VAL-4
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Yearly appropriation value";
   }
   OUT MIR-NC-BAL-REFUND-VAL-4 
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "Refund reimbursement value";
   }
   OUT MIR-NC-BAL-PRCS-CD-5    
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Process code (CH) (5)";
   }
   OUT MIR-NC-BAL-PRCS-DT-5    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Process date: year, month, day";
   }
   OUT MIR-NC-BAL-INT-CAP-YM-5 
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Interest capitalization, appropriation year and month";
   }
   OUT MIR-NC-BAL-ELAPS-YR-5   
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Elapsed year";
   }
   OUT MIR-NC-BAL-AMT-5        
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "Conversion balance";
   }
   OUT MIR-NC-BAL-YR-APRO-VAL-5
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Yearly appropriation value";
   }
   OUT MIR-NC-BAL-REFUND-VAL-5 
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "Refund reimbursement value";
   }
   OUT MIR-NC-CALC-BASE-DT     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Calculation base date";
   }
   OUT MIR-NC-SPL-DIV-AMT      
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Special dividend";
   }
   OUT MIR-NC-SPL-DIV-VCALC    
   {
       DisplayOnly;
       Length="9";
       SType = "Text";
       Label = "V calculation for special dividend";
   }
   OUT MIR-ADJ-DIV-AMT         
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Adjusted dividend";
   }
   OUT MIR-ADJ-DIV-APROP-DT    
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Adjusted dividend appropriation date";
   }
   OUT MIR-ADJ-DIV-INTCAP-BS-DT
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Interest capitalization base date";
   }
   OUT MIR-ADJ-DIV-INT-CAP-DT  
   {
       DisplayOnly;
       Length="6";
       SType = "Text";
       Label = "Interest capitalization date";
   }
   OUT MIR-ADJ-TOT-DIV-AMT     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Total adjusted dividend";
   }
   OUT MIR-ADJ-DIV-PMT-DT      
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Payment date";
   }
   OUT MIR-ADJ-DIV-PMT-AMT     
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Payment amount";
   }
   OUT MIR-NE1G-PREV-POL-ID-1  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID ";
   }
   OUT MIR-NE1G-PREV-SMALTYP-1 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (1)";
   }
   OUT MIR-NE1G-BASE-POL-DT-1  
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date ";
   }
   OUT MIR-NE1G-PRCH-TYP-1     
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification";
   }
   OUT MIR-NE1G-PREV-POL-ID-2  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (2)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-2 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (2)";
   }
   OUT MIR-NE1G-BASE-POL-DT-2  
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (2)";
   }
   OUT MIR-NE1G-PRCH-TYP-2     
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification (2)";
   }
   OUT MIR-NE1G-PREV-POL-ID-3  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (3)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-3 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (3)";
   }
   OUT MIR-NE1G-BASE-POL-DT-3  
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (3)";
   }
   OUT MIR-NE1G-PRCH-TYP-3     
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification (3)";
   }
   OUT MIR-NE1G-PREV-POL-ID-4  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (4)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-4 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (4)";
   }
   OUT MIR-NE1G-BASE-POL-DT-4  
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (4)";
   }
   OUT MIR-NE1G-PRCH-TYP-4     
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification (4)";
   }
   OUT MIR-NE1G-PREV-POL-ID-5  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (5)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-5 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (5)";
   }
   OUT MIR-NE1G-BASE-POL-DT-5  
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (5)";
   }
   OUT MIR-NE1G-PRCH-TYP-5     
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification (5)";
   }
   OUT MIR-NE1G-PREV-POL-ID-6  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (6)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-6 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (6)";
   }
   OUT MIR-NE1G-BASE-POL-DT-6  
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (6)";
   }
   OUT MIR-NE1G-PRCH-TYP-6     
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification (6)";
   }
   OUT MIR-NE1G-PREV-POL-ID-7  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (7)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-7 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (7)";
   }
   OUT MIR-NE1G-BASE-POL-DT-7  
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (7)";
   }
   OUT MIR-NE1G-PRCH-TYP-7     
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification (7)";
   }
   OUT MIR-NE1G-PREV-POL-ID-8  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID  (8)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-8 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (8)";
   }
   OUT MIR-NE1G-BASE-POL-DT-8  
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date  (8)";
   }
   OUT MIR-NE1G-PRCH-TYP-8     
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification (8)";
   }
   OUT MIR-NE1G-PREV-POL-ID-9  
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (9)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-9 
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (9)";
   }
   OUT MIR-NE1G-BASE-POL-DT-9  
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (9)";
   }
   OUT MIR-NE1G-PRCH-TYP-9     
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification (9)";
   }
   OUT MIR-NE1G-PREV-POL-ID-10 
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (10)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-10
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (10)";
   }
   OUT MIR-NE1G-BASE-POL-DT-10 
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date  (10)";
   }
   OUT MIR-NE1G-PRCH-TYP-10    
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification(10)";
   }
   OUT MIR-NE1G-PREV-POL-ID-11 
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (11)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-11
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (11)";
   }
   OUT MIR-NE1G-BASE-POL-DT-11 
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (11)";
   }
   OUT MIR-NE1G-PRCH-TYP-11    
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification(11)";
   }
   OUT MIR-NE1G-PREV-POL-ID-12 
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (12)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-12
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (12)";
   }
   OUT MIR-NE1G-BASE-POL-DT-12 
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (12)";
   }
   OUT MIR-NE1G-PRCH-TYP-12    
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification(12)";
   }
   OUT MIR-NE1G-PREV-POL-ID-13 
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (13)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-13
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (13)";
   }
   OUT MIR-NE1G-BASE-POL-DT-13 
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (13)";
   }
   OUT MIR-NE1G-PRCH-TYP-13    
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification(13)";
   }
   OUT MIR-NE1G-PREV-POL-ID-14 
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (14)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-14
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (14)";
   }
   OUT MIR-NE1G-BASE-POL-DT-14 
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (14)";
   }
   OUT MIR-NE1G-PRCH-TYP-14    
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification (14)";
   }
   OUT MIR-NE1G-PREV-POL-ID-15 
   {
       DisplayOnly;
       Length="7";
       SType = "Text";
       Label = "Before conversion business policy ID (15)";
   }
   OUT MIR-NE1G-PREV-SMALTYP-15
   {
       DisplayOnly;
       Length="3";
       SType = "Text";
       Label = "Before conversion policy small type (15)";
   }
   OUT MIR-NE1G-BASE-POL-DT-15 
   {
       DisplayOnly;
       Length="8";
       SType = "Text";
       Label = "Base policy date (15)";
   }
   OUT MIR-NE1G-PRCH-TYP-15    
   {
       DisplayOnly;
       Length="2";
       SType = "Text";
       Label = "Parent-child classification (15)";
   }

}

