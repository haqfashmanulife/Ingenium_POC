#*******************************************************************************
#*  Component:   BF9D40-O.s                                                    *
#*  Description: CURRENCY EXCHANGE RATE INQUIRE SCREEN                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP251B  CTS     CURRENCY EXCHANGE RATE INQUIRE SCREEN                      *
#*******************************************************************************

S-STEP BF9D50-O
{
        ATTRIBUTES
        {
                BusinessFunctionType = "Inquiry";
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
         

    IN MIR-XCHNG-FROM-CRCY-CD
        {
            Key;
            Mandatory;
            Length = "2";
            DBTableName = "TCXRT";
            CodeSource = "EDIT";
            CodeType = "CRCY";
            SType = "Text";
            Label = "From Currency";
        }
       
    IN MIR-XCHNG-TO-CRCY-CD
    {
         Key;
         Mandatory;
         Length = "2";
         DBTableName = "TCXRT";
            CodeSource = "EDIT";
            CodeType = "CRCY";         
         SType = "Text";
         Label = "To Currency";
     }
      
     IN MIR-XCHNG-EFF-DT
     {
         Key;
         Length = "10";
         DBTableName = "TCXRT";
         DefaultSession = "MIR-XCHNG-EFF-DT";
         SType = "Date";
         Label = "Exchange Effective Date";
     }
    IN MIR-XCHNG-RT-TYP-CD
    {
    	DisplayOnly;
    	Length = "5";
    	CodeSource = "DataModel";
    	CodeType = "XCHNG-RT-TYP-CD";
    	SType = "Text";
    	Label = "Rate Type Code";
    }
    IN MIR-XCHNG-1-RT 
    {
      DisplayOnly;
      Label = "TTS Rate";
      Length = "18";
      Decimals = "0";      
      SType = "Number";
     }
             
     IN MIR-XCHNG-2-RT 
     {
	DisplayOnly;
	Label = "TTB Rate";
	Length = "18";
        Decimals = "0";      	
	SType = "Number";
     }
             
     IN MIR-XCHNG-3-RT 
     {
	DisplayOnly;
	Label = "TTM Rate";
	Length = "18";
        Decimals = "0";      		
	SType = "Number";
     }
     
     IN MIR-XCHNG-4-RT 
	{
	  DisplayOnly;
	  Label = "Pay-In Corporate Rate";
          Decimals = "0";      		    
	  Length = "18";
	  SType = "Number";
     }
             
     IN MIR-XCHNG-5-RT 
	{
          DisplayOnly;
          Label = "Pay-Out Corporate Rate";
          Decimals = "0";      		     
          Length = "18";
          SType = "Number";
     }
      
}
