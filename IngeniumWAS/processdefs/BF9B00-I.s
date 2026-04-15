# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9B00-I.s                                                    *
#*  Description: Death Claim Summary Sheet(for UL)                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCASS  CTS     INITIAL VERSION                                            *
#*******************************************************************************

S-STEP BF9B00-I
{
        ATTRIBUTES
        {
                BusinessFunctionType = "Retrieve";
                FocusField = "MIR-CLM-ID";
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

         INOUT MIR-CLM-ID
         {
                DefaultSession = "MIR-CLM-ID";
                Key;
                Mandatory;
                Length = "8";
                SType = "Text";
                Label = "Death Master Claim ID";
         }
}
