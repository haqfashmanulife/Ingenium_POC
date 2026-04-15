#*******************************************************************************
#*  Component:   BF9D50-P.p                                                    *
#*  Description: CURRENCY EXCHANGE RATE INQUIRE SCREEN                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP251B  CTS     CURRENCY EXCHANGE RATE INQUIRE SCREEN                      *
#*******************************************************************************

P-STEP BF9D50-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D50";
        BusinessFunctionName = "Currency Exchange Rate Inquiry";
        BusinessFunctionType = "Inquiry";
        MirName = "CCWM9D50";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    IN MIR-XCHNG-FROM-CRCY-CD
        {
            Key;
            Mandatory;
            Length = "2";
            DBTableName = "TCXRT";
            SType = "Text";
            Label = "From Currency";
        }
       
    IN MIR-XCHNG-TO-CRCY-CD
    {
         Key;
         Mandatory;
         Length = "2";
         DBTableName = "TCXRT";
         SType = "Text";
         Label = "To Currency";
     }
      
     IN MIR-XCHNG-EFF-DT
     {
         Key;
         Length = "10";
         DBTableName = "TCXRT";
         SType = "Date";
         Label = "Exchange Effective Date";
     }
    OUT MIR-XCHNG-RT-TYP-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "XCHNG-RT-TYP-CD";
        SType = "Text";
        Label = "Rate Type Code";
    }    
    
 
    OUT MIR-XCHNG-1-RT 
    {
      DisplayOnly;
      Label = "TTS Rate";
      Length = "18";
      Decimals = "0";      	      
      SType = "Number";
    }
             
    OUT MIR-XCHNG-2-RT 
    {
	DisplayOnly;
	Label = "TTB Rate";
	Length = "18";
        Decimals = "0";      	      	
	SType = "Number";
    }
             
    OUT MIR-XCHNG-3-RT 
    {
	DisplayOnly;
	Label = "TTM Rate";
	Length = "18";
        Decimals = "0";      	      	
        SType = "Number";
    }
     
     OUT MIR-XCHNG-4-RT 
     {
      DisplayOnly;
      Label = "Pay-In Corporate Rate";
      Length = "18";
      Decimals = "0";      	            
      SType = "Number";
     }
             
     OUT MIR-XCHNG-5-RT 
     {
       DisplayOnly;
       Label = "Pay-Out Corporate Rate";
       Length = "18";
       Decimals = "0";      	      	     
       SType = "Number";
     }
      
   }
