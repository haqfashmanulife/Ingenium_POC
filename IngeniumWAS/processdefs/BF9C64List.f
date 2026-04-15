#*******************************************************************************
#*  Component:   BF9C64List.f                                                  *
#*  Description: CSOM9C60                                                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  M161CA  CTS     Implementing the Screen changes for the Credit card        *
#*  M161CA          processing                                                 *
#*  UY3004  STREAM3 UNISYS POST MIGRATION DUPLICATION POLICY                   *
#*******************************************************************************

INCLUDE "BF9C64-I.s";
INCLUDE "BF9C64-P.p";
INCLUDE "BF9C64-O.s";
INCLUDE "BF9C60Retrieve.f";
INCLUDE "BF9C61Create.f";
INCLUDE "BF9C62Update.f";
INCLUDE "BF9C63Delete.f";

PROCESS BF9C64List
{
    Title = STRINGTABLE.IDS_TITLE_BF9C64List;
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

#UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP Retrieve
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER  <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH ListStart;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX   = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX   = WS-POL-ID-SFX ;
      }

# for more button moving and checking the policy
    TEST-POL-ID-BASE = MIR-POL-ID-BASE;
    TEST-POL-ID-SFX  = MIR-POL-ID-SFX ;

#UY3004 CHANGES END

    STEP RetrieveList
    {
        USES P-STEP "BF9C64-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
        
     ButtonBar = "ButtonBarListsCRUD";    
    
    STEP DisplayList
    {
        USES S-STEP "BF9C64-O";
        STRINGTABLE.IDS_TITLE_BF9C64List -> Title;
    }
    
    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_MORE"
    #UY3004 CHANGES START
    #UY3004 BRANCH RetrieveList;
      {
       IF  TEST-POL-ID-BASE == MIR-POL-ID-BASE && TEST-POL-ID-SFX   == MIR-POL-ID-SFX
           BRANCH RetrieveList;
       ELSE
           UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
           UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
           BRANCH Retrieve;
      }
    #UY3004 CHANGES ENDS
  
    IF action == "ACTION_ADD"
    {
        STEP ACTION_ADD
        {
            USES PROCESS "BF9C61Create";
            
            ATTRIBUTES
            {
                SendMessages = "NO";
            }

        }

        BRANCH RetrieveList;
    }
    
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

    IF action == "ACTION_UPDATE"
    {
        STEP ACTION_UPDATE
        {
            USES PROCESS "BF9C62Update";
            
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
            MIR-CRC-SEQ-NUM -> MIR-CRC-SEQ-NUM;
        }

        BRANCH RetrieveList;
    }
    
    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9C63Delete";
            
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
            MIR-CRC-SEQ-NUM -> MIR-CRC-SEQ-NUM;
        }

        BRANCH RetrieveList;
    }

   IF action == "ACTION_CANCEL"
       EXIT;
}

