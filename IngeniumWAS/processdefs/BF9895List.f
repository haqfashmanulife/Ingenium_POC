# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9895List.f                                                  *
#*  Description: Insured Claim Policy List function                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL  HEAD AND BRANCH OFFICE CLAIM INQ (HAC002C)                  *
#* EN000224    GW  ADDED BENEFIT NAME & DECISION TO RETRIEVE STEP FOR H.O.     *
#*                 INQUIRY ONLY,  ADDED BF9895HO-O.s                           *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************
# S-step that starts the list

INCLUDE "BF9895-I.s";

# P-step that retrieves the list

INCLUDE "BF9895-P.p";

# S-step that displays the list

INCLUDE "BF9895HO-O.s";
INCLUDE "BF9895-O.s";

# Insured Claim Inquiry

INCLUDE "BF9896Retrieve.f";

#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END


PROCESS BF9895List
{
    Title = STRINGTABLE.IDS_TITLE_BF9896Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Get Client ID 

    STEP ListStart
    {
        USES S-STEP "BF9895-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF9895-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;

# 23774A CHANGES BEGIN
    
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLI-ID -> MIR-TRNX-DTL-INFO;    
    "I" -> MIR-LOG-LEVL-CD;    
    }
      
    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
        
# 23774A CHANGES END

    # Determine if Head Office or Branch Office user and 
    # display the appropriate page
    # This view displays screen for Head Office - EN000224

    IF  MIR-USER-BRANCH-CODE == ""
        DisplayListS = "BF9895HO-O";
 
    ELSE

        # This view displays screen for Branch - EN000224
         
        IF  MIR-USER-BRANCH-CODE != ""
            DisplayListS = "BF9895-O";

    Title = STRINGTABLE.IDS_TITLE_BF9895List;          
    ButtonBar = "ButtonBarSelectCancelMore";            
                                                            
    STEP DisplayList-S                                    
    {                                                     
        USES S-STEP DisplayListS;                           
    }                                                        

    IF action == "ACTION_BACK"
        EXIT;


    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH RetrieveList;


    # The user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList-S;



    # Build the key ID from the row that the user selected.
    # These key variables will be passed to the next step

    MIR-POL-ID = MIR-POL-ID-T[index];


    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_SELECT if they pressed the select button.

    IF action == "SelectItem" || action == "ACTION_SELECT"
    {
        STEP SelectItem
        {
            USES PROCESS "BF9896Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-CLI-ID -> MIR-CLI-ID;
            MIR-POL-ID -> MIR-POL-ID;
            " " -> MIR-CLM-ID;
            " " -> MIR-CVG-NUM;
            "000" -> MIR-CLM-AGG-NUM;
            MIR-BNFT-NM-ID -> MIR-BNFT-NM-ID; 
            MIR-BNFT-DECSN-CD -> MIR-BNFT-DECSN-CD;
            "FALSE" -> DisplayInput;
             
        }

        BRANCH RetrieveList;

    }
}

