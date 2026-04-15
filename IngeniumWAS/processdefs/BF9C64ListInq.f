#*******************************************************************************
#*  Component:   BF9C64ListInq.f                                               *
#*  Description: CSOM9C60                                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *                                                
#*  R16394  CTS      New Flow created similar to Credit card list screen with  *
#*                   INQUIRE/CANCEL button bar so that the Callcenter security *
#*                   class can use them without the CRUD function              *
#*******************************************************************************

INCLUDE "BF9C64-I.s";
INCLUDE "BF9C64-P.p";
INCLUDE "BF9C64-O.s";
INCLUDE "BF9C60Retrieve.f";

PROCESS BF9C64ListInq
{
    Title = STRINGTABLE.IDS_TITLE_BF9C64ListInq;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
  
    STEP ListStart
    {
        USES S-STEP "BF9C64-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9C64-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
        
       ButtonBar = "ButtonBarInquireCancel";  
    
    STEP DisplayList
    {
        USES S-STEP "BF9C64-O";
        STRINGTABLE.IDS_TITLE_BF9C64ListInq -> Title;
    }
    
    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_MORE"
        BRANCH RetrieveList;
    
    IF index == "0"
        BRANCH DisplayList;

    # Build the key ID from the row that the user selected

    MIR-POL-ID-BASE = MIR-POL-ID-BASE;
    MIR-POL-ID-SFX = MIR-POL-ID-SFX;
    MIR-CRC-SEQ-NUM = MIR-CRC-SEQ-NUM-T[index];
      
    IF action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9C60Retrieve";
            
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
            MIR-CRC-SEQ-NUM -> MIR-CRC-SEQ-NUM;
            
        }

        BRANCH RetrieveList;
    }

}

