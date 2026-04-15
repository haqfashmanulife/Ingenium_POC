# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF9D52-I.s                                                    *
#*  Description: CURRENCY EXCHANGE RATE UPDATE SCREEN                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  M271O1  CTS     CURRENCY EXCHANGE RATE UPDATE SCREEN                       *
#*******************************************************************************

S-STEP BF9D52-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-XCHNG-FROM-CRCY-CD";
        FocusFrame = "ContentFrame";
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

     IN MIR-XCHNG-FROM-CRCY-CD
     {
          Key;
          DisplayOnly;
          Mandatory;
          Length = "2";
          CodeSource = "EDIT";
          CodeType = "CRCY";
          SType = "Selection";
          Label = "From Currency";
          Index = "1";
     }
       
     IN MIR-XCHNG-TO-CRCY-CD
     {
          Key;
          DisplayOnly;          
          Mandatory;
          Length = "2";
          CodeSource = "EDIT";
          CodeType = "CRCY";
          SType = "Selection";
          Label = "To Currency";
          Index = "1";
     }
      
     IN MIR-XCHNG-EFF-DT
     {
         Key;
         DisplayOnly;         
         Mandatory;
         Length = "10";
         DBTableName = "TCXRT";
         SType = "Date";
         Label = "Exchange Effective Date";
     }
     
     INOUT MIR-XCHNG-RT-TYP-CD
     {
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "XCHNG-RT-TYP-CD";
        SType = "Text";
        Label = "Rate Type Code";
     }       
     
     INOUT MIR-XCHNG-1-RT 
     {
      Label = "TTS Rate";
      Decimals = "0";      
      Length = "18";
      SType = "Number";
     }
             
     INOUT MIR-XCHNG-2-RT 
     {
	Label = "TTB Rate";
	Length = "18";
        Decimals = "0";	
	SType = "Number";
      }
             
     INOUT MIR-XCHNG-3-RT 
     {
	Label = "TTM Rate";
	Length = "18";
        Decimals = "0";
	SType = "Number";
     }
     
     INOUT MIR-XCHNG-4-RT 
     {
        Label = "Pay-In Corporate Rate";
	Length = "18";
        Decimals = "0";	
	SType = "Number";
     }
             
     INOUT MIR-XCHNG-5-RT 
     {
	Label = "Pay-Out Corporate Rate";
	Length = "18";
        Decimals = "0";	
	SType = "Number";
     }
      

}

