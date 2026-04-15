#*******************************************************************************
#*  Component:   BF9D40-I.s                                                    *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION INQUIRY SCREEN              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP251B  CTS     TRAD DEPOSIT HISTORY MODIFICATION INQUIRY SCREEN           *
#*******************************************************************************

S-STEP BF9D40-I
{
        ATTRIBUTES
        {
                BusinessFunctionType = "Retrieve";
                FocusField = "MIR-POL-ID-BASE";
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
        
           
        INOUT MIR-POL-ID-BASE
        {
                DefaultSession = "MIR-POL-ID-BASE";
                Key;
                Label = "Policy Id";
                Length = "9";
                Mandatory;
                SType = "Text";
        }
        
        INOUT MIR-POL-ID-SFX
        {
                DefaultSession = "MIR-POL-ID-SFX";
                Key;
                Label = "Suffix";
                Length = "1";
                SType = "Text";
        }
        
        INOUT MIR-TRAD-SO-JRNL-DT
        {
                DefaultSession = "MIR-TRAD-SO-JRNL-DT";
                Key;
                Label = "Trad SO Journal Date";
                Length = "10";
                Mandatory;
                SType = "Date";
        }
        
        INOUT MIR-SEQ-NUM
        {
                DefaultSession = "MIR-SEQ-NUM";
                Key;
                Label = "Sequence Number";
                Length = "3";
                Mandatory;
                SType = "Text";
        }
}
