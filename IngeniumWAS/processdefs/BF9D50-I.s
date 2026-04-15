#*******************************************************************************
#*  Component:   BF9D50-I.s                                                    *
#*  Description: CURRENCY EXCHANGE RATE INQUIRE SCREEN                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP251B  CTS     CURRENCY EXCHANGE RATE INQUIRE SCREEN                      *
#*******************************************************************************

S-STEP BF9D50-I
{
        ATTRIBUTES
        {
              BusinessFunctionType = "Inquiry";
              FocusField = "MIR-XCHNG-FROM-CRCY-CD";
              FocusFrame = "ContentFrame";
              Type = "Input";
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
          Index = "1";
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
          Index = "1";
     }
      
     INOUT MIR-XCHNG-EFF-DT
     {
         Key;
         Mandatory;
         Length = "10";
         DBTableName = "TCXRT";
         SType = "Date";
         Label = "Exchange Effective Date";
     }
}
