#*******************************************************************************
#*  Component:   BF9D54-I.s                                                    *
#*  Description: CURRENCY EXCHANGE RATE INQUIRE SCREEN                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M271O2  CTS     CURRENCY EXCHANGE RATE INQUIRE SCREEN                      *
#*******************************************************************************

S-STEP BF9D54-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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
        SType="Hidden";
    }
    OUT index
    {
        SType = "Hidden";
    }
     INOUT MIR-XCHNG-FROM-CRCY-CD
     {
          Key;
          Mandatory;
          Length = "2";
          CodeSource = "EDIT";
          CodeType = "CRCY";
          SType = "Selection";
          Label = "From Currency";

     }
       
     INOUT MIR-XCHNG-TO-CRCY-CD
     {
          Key;
          Mandatory;
          Length = "2";
          CodeSource = "EDIT";
          CodeType = "CRCY";
          SType = "Selection";
          Label = "To Currency";
          
     }
      
     INOUT MIR-XCHNG-EFF-DT
     {
         Length = "10";
     
         DefaultSession = "LSIR-PRCES-DT";
         SType = "Date";
         Label = "Exchange Effective Date";
     }


  }
