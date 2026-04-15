#*******************************************************************************
#*  Component:   BF9326-I.s                                                    *
#*  Description: Firm Banking Table (FBKC) Update Step                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP4     SC       Firm Banking (Coverage) Update                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9326-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-FBKC-U-STAT-CD";
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

       IN MIR-FBKC-U-POL-ID
       {
              Key;
              DisplayOnly;
              Length = "9";
              SType = "Text";
              Label = "Policy ID";
       }

       IN MIR-FBKC-U-REMIT-DT
       {
              Key;
              DisplayOnly;
              Length = "10";
              SType = "Date";
              Label = "Remittance Date";
       }

       IN MIR-FBKC-U-CVG-NUM
       {
              Key;
              DisplayOnly;
              Length = "2";
              SType = "Text";
              Label = "Coverage Number";
       }

       IN MIR-FBKC-U-SEQ-NUM
       {
              Key;
              DisplayOnly;
              Length = "3";
              SType = "Text";
              Label = "Sequence Number";
       }

       IN MIR-FBKC-U-FBNK-SEQ-NUM
       {
              Key;
              DisplayOnly;
              Length = "3";
              SType = "Text";
              Label = "FBNK Sequence Number";
       }

       IN MIR-FBKC-U-CAT-CD
       {
              Key;
              DisplayOnly;
              Length = "10";
              CodeSource = "DataModel";
              CodeType = "FBKC-CAT-CD";
              SType = "Text";
              Label = "Operation Category";
       }

       INOUT MIR-FBKC-U-STAT-CD
       {
              Length = "1";
              CodeSource = "DataModel";
              CodeType = "FBKC-STAT-CD";
              SType = "Selection";
              Label = "Firm Banking Status";
       }

       INOUT MIR-FBKC-U-FAIL-REASN-TXT
       {
              Key;
              Length = "40";
              SType = "Text";
              Label = "Fail Reason";
       }

}


