#*******************************************************************************
#*  Component:   BF9C94HC.f                                                    *
#*  Description: Deferment Payment List Process                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  U3C120  CTS      Intial Version                                            *
#*******************************************************************************

# Change this to the P that retrieves the list

INCLUDE "BF9C94SM-O.s";
INCLUDE "BF9C94-P.p";
INCLUDE "BF9C90HC.f";
INCLUDE "BF9C91HC.f";
INCLUDE "BF9C92HC.f";
INCLUDE "BF9C93HC.f";

PROCESS BF9C94HC
{
       
    Title = STRINGTABLE.IDS_TITLE_BF9C94List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    STEP RetrieveList
    {
        USES P-STEP "BF9C94-P";
        "HC" -> MIR-DV-POL-FUT-ACTV-TYP-CD;        
    }

    Title = STRINGTABLE.IDS_TITLE_BF9C94List;

    IF LSIR-RETURN-CD != "00"
    {     
       EXIT;
    } 
    
    ButtonBar = "ButtonBarListsCRUD";    
    
    STEP DisplayList
    {
        USES S-STEP "BF9C94SM-O";
    }

    IF action == "ACTION_BACK"
    {
	MESSAGES-T[0] = "";
        EXIT;
    }

    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
    {
      IF MIR-FTRQ-PREV-UPDT-DT !=""
      {
        MIR-DV-PRCES-STATE-CD = "2"; 
        IF MESSAGES-T[1] == "END OF FILE REACHED" || MESSAGES-T[1] == "ファイルの終端に達しました"
        {
          BRANCH DisplayList;
        }        
      }       
        BRANCH RetrieveList;
     }
    
    MIR-DV-PRCES-STATE-CD = "1"; 

    # The user has indicated that they want to add an element to the list

    IF action == "ACTION_ADD"
    {
     
      STEP ACTION_ADD
        {
            USES PROCESS "BF9C91Create";
            ATTRIBUTES
            {
                GetMessages = "NO";
                SendMessages = "NO";
            }

            " " -> MIR-PBRQ-EFF-DT;
            " " -> MIR-DV-POL-FUT-ACTV-TYP-CD;
            " " -> MIR-POL-ID-BASE;
            " " -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }
        
        IF MIR-FTRQ-PREV-UPDT-DT !=""
        {
        MIR-POL-ID-BASE = " ";
        MIR-POL-ID-SFX = " ";
        MIR-PBRQ-EFF-DT = " ";
        
        }

        BRANCH RetrieveList;

    }

    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # You will have to build all of the key variables that will be required
    # by the following steps and pass them to each step. 
    
    MIR-PBRQ-EFF-DT = MIR-PBRQ-EFF-DT-T[index];
    MIR-POL-ID-BASE = MIR-POL-ID-BASE-T[index];

    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9C90HC";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
   
            MIR-PBRQ-EFF-DT -> MIR-PBRQ-EFF-DT;
            MIR-DV-POL-FUT-ACTV-TYP-CD -> MIR-DV-POL-FUT-ACTV-TYP-CD;
            MIR-POL-ID-BASE -> MIR-POL-ID-BASE;
            MIR-POL-ID-SFX -> MIR-POL-ID-SFX;
            "FALSE" -> DisplayInput;
        }

        IF MIR-FTRQ-PREV-UPDT-DT !=""
        {
        BRANCH DisplayList;
        }        

        BRANCH RetrieveList;
        
    }

    # The user wants to update an item in the list

    IF action == "ACTION_UPDATE"
    {
    STEP Main
    {
        USES PROCESS "BF9C92HC";
        ATTRIBUTES
        {
            GetMessages = "NO";
        }
  
        STRINGTABLE.IDS_TITLE_BF9C92UpdateList -> Title;
        MIR-PBRQ-EFF-DT -> MIR-PBRQ-EFF-DT;
        MIR-DV-POL-FUT-ACTV-TYP-CD -> MIR-DV-POL-FUT-ACTV-TYP-CD;
        "FALSE" -> DisplayInput;
    }


        IF MIR-FTRQ-PREV-UPDT-DT !=""
        {
        MIR-POL-ID-BASE = " ";
        MIR-POL-ID-SFX = " ";
        MIR-PBRQ-EFF-DT = " ";
        }        
        
        BRANCH RetrieveList;

    }

    # The user wants to delete an item in the list

    IF action == "ACTION_DELETE"
    {
        STEP ACTION_DELETE
        {
            USES PROCESS "BF9C93HC";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }
   
            MIR-PBRQ-EFF-DT -> MIR-PBRQ-EFF-DT;
            MIR-DV-POL-FUT-ACTV-TYP-CD -> MIR-DV-POL-FUT-ACTV-TYP-CD;
 
        }

        IF MIR-FTRQ-PREV-UPDT-DT !=""
        {
        MIR-POL-ID-BASE = " ";
        MIR-POL-ID-SFX = " ";
        MIR-PBRQ-EFF-DT = " ";
        }        

        BRANCH RetrieveList;

    }

    EXIT;
}

