#*******************************************************************************
#*  Component:   BF9D44-I.s                                                    *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION LIST SCREEN                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP251B  CTS     TRAD DEPOSIT HISTORY MODIFICATION LIST SCREEN              *
#*******************************************************************************

S-STEP BF9D44-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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
   
        INOUT MIR-APPL-CTL-PRCES-DT
        {
               DefaultSession = "LSIR-PRCES-DT";
               Key;
               Label = "Process Date";
               Length = "10";
               SType = "Date";
        }
        
        INOUT MIR-TRAD-SO-JRNL-DT
        {
                Label = "Trad SO Journal Date";
                Length = "10";
        }
        
        INOUT MIR-SEQ-NUM
        {
                Label = "Sequence Number";
                Length = "3";
         }
}
