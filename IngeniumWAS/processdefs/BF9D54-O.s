#*******************************************************************************
#*  Component:   BF9D54-O.s                                                    *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION LIST SCREEN                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M271O2  CTS     CURRENCY EXCHANGE RATE INQUIRE SCREEN                      *
#* Q60714  CTS  CHANGES FOR MORE BUTTON LOGIC                                  *
#*******************************************************************************

S-STEP BF9D54-O
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
        SType = "Hidden";
    }
            
        IN MIR-XCHNG-FROM-CRCY-CD 
        {
           DefaultSession = "MIR-XCHNG-FROM-CRCY-CD";
           DisplayOnly;
            CodeSource = "EDIT";
            CodeType = "CRCY";           
           Key;
           Label = "From Currency";
           Length = "2";
           SType = "Text";

        }
        
        IN MIR-XCHNG-TO-CRCY-CD 
	{
	   DefaultSession = "MIR-XCHNG-TO-CRCY-CD";
	   DisplayOnly;
            CodeSource = "EDIT";
            CodeType = "CRCY";	   
	   Key;
	   Label = "To Currency";
	   Length = "2";
	   SType = "Text";
	
        }
        
#Q60714 CHANGES STARTS

    IN MIR-XCHNG-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Exchange Effective Date";
    }
    
#Q60714 CHANGES ENDS         
          
        IN MIR-XCHNG-EFF-DT-T[50] 
        {
            DisplayOnly;
            FieldGroup = "Table50";
            Index = "1";
            Label = "Exchange Effective Date";
            Length = "10";
            SType = "Text";
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
                
                
}
