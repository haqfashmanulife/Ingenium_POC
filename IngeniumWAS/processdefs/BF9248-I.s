# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:08 PM EDT

#*******************************************************************************
#*  Component:   BF9248-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL106  HIN/CL   ASSOCIATE OTHER MASTER CLAIM                              *
#*                                                                             *
#*******************************************************************************

S-STEP BF9248-I
{
       ATTRIBUTES
       {
          BusinessFunctionType = "Retrieve";
          Type = "Input";
          FocusField = "MIR-CLM-ID";
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

       INOUT MIR-CLM-ID
       {
          Key;
          Length = "8";
          DefaultSession = "MIR-CLM-ID";
          SType = "Text";
          Label = "Master Claim ID";
       }
}
