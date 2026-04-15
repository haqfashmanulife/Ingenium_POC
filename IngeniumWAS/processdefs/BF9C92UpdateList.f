# *******************************************************************************
# *  Component:   BF9C91UpdateList.f                                            *
# *  Description: Future request Table(FTRQ) Update Process Through List Screen *
# *                                                                             *
# *******************************************************************************
# *  Chg#    Release  Description                                               *
# *                                                                             *
#*  M117PB  CTS      Intial Version                                             *
#*  Q01721  CTS      Changes to Display "ButtonBarConfirmCancel" Button         *
# *                                                                             *
# *******************************************************************************
PROCESS BF9C92UpdateList
{
        Title = STRINGTABLE.IDS_TITLE_BF9C92UpdateList;
        TitleBar = "TitleBar";
        TitleBarSize = "70";
        ButtonBar = "ButtonBarOKCancel";
        ButtonBarSize = "40";
        MessageFrame = "MessagesDisp";
        MessageFrameSize = "70";
        # FTRQ Create Part 1
        
        STEP BF9C90-P1
        {
          USES P-STEP "BF9C90-P";
        }
        
        IF LSIR-RETURN-CD != "00"
           EXIT;

        
        ButtonBar = "ButtonBarOKCancel";
        # FTRQ Update Part 1
        STEP BF9C92-I
        {
          USES S-STEP "BF9C92-I";
          STRINGTABLE.IDS_TITLE_BF9C92Update1 -> Title;
        }
        
        IF action == "ACTION_BACK"
            EXIT;
        
        STEP BF9C92-P2
        {
            USES P-STEP "BF9C92-P";
            "1" -> MIR-DV-PRCES-STATE-CD;
        }
        
        IF LSIR-RETURN-CD != "00"
        {
             BRANCH BF9C92-I;
        }
        
        ButtonBar = "ButtonBarConfirmCancel";
        # FTRQ Update Part 2
        STEP BF9C90-O
        {
             USES S-STEP "BF9C90-O";
             STRINGTABLE.IDS_TITLE_BF9C91CreateConfirm -> Title;
        }
        
        IF action == "ACTION_BACK"
        {
               BRANCH BF9C90-P1;
        }
        
        STEP BF9C92-P3
        {
             USES P-STEP "BF9C92-P";
            "2" -> MIR-DV-PRCES-STATE-CD;
        }
        
}
