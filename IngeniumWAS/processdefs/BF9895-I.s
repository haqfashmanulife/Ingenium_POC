# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9895-I.s                                                    *
#*  Description: Insured Claim Policy List - Input                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   HEAD AND BRANCH OFFICE CLAIM INQ (HAC002C)                 *
#*                                                                             *
#*******************************************************************************

S-STEP BF9895-I
{
        ATTRIBUTES
        {
            BusinessFunctionType = "List";
            Type = "Input";
            FocusField = "MIR-CLI-ID";
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

        INOUT MIR-CLI-ID
        {
            Key;
            Mandatory;
            Length = "10";
            SType = "Text";
            DefaultSession = "MIR-CLI-ID";		            
            Label = "Insured Client ID";
        }

        INOUT MIR-POL-ID
        {
            Length = "10";
            SType = "Hidden";
            Label = "Policy ID";
        }
}
