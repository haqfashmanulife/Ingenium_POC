# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1192Update.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************
# Retrieve Input S Step
# Retreive P Step

INCLUDE "BF1190-I.s";

# Update Input S Step

INCLUDE "BF1190-P.p";

# Update P Step

INCLUDE "BF1192-I.s";

# Update Output S Step

INCLUDE "BF1192-P.p";
INCLUDE "BF1190-O.s";

# Parameterized Flow
# 23774A CHANGES BEGIN
#INCLUDE "GenUpdate.f";
INCLUDE "BF9G99-P.p";
#INCLUDE "GenUpdateAudCli.f";
# 23774A CHANGES END


# NOTE:  Name must match File Name

PROCESS BF1192Update
{
# 23774A CHANGES BEGIN
    IF DisplayInput == "FALSE"
        BRANCH Input;



    # Set One of the Radio Buttons As Default
    # Underwriting Requirements = 1
    # Issue Requirements = 2

    ReqtType = 1;

#    STEP Main
#    {
#         USES PROCESS "GenUpdate";        
#         USES PROCESS "GenUpdateAudCli";
#
#       ATTRIBUTES
#       {
#           GetMessages = "NO";
#       }
#
#       STRINGTABLE.IDS_TITLE_BF1192Update -> Title;
#
#       # Retrieve Input S Step
#
#       "BF1190-I" -> InputS;
#
#       # Retrieve P Step
#
#       "BF1190-P" -> RetrieveP;
#
#       # Update Input S Step
#
#       "BF1192-I" -> EditS;
#
#       # Update P Step
#
#       "BF1192-P" -> UpdateP;
#
#       # Update Output S Step
#
#       "BF1190-O" -> OutputS;
#   }

    Title = STRINGTABLE.IDS_TITLE_BF1192Update;     
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Enter the key(s) for the value that you'd like to create

    STEP Input
    {
        USES S-STEP "BF1190-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH Input;



    # Retrieve the record 

    STEP Retrieve
    {
        USES P-STEP "BF1190-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;


    STEP Edit
    {
        USES S-STEP "BF1192-I";
    }


    # If user selects Cancel and did not come from a list, then clear messages 
    # and branch back 1 step;
    # otherwise, exit to list.

    IF action == "ACTION_BACK"
    {
        IF DisplayInput != "FALSE"
        {
            ButtonBar = "ButtonBarOKCancel";
            MESSAGES-T[0] = "";

            BRANCH Input;

        }
        ELSE
            EXIT;


    }
    IF action == "ACTION_REFRESH"
        BRANCH Edit;



    # Update the record who's data was just entered.

    STEP Update
    {
        USES P-STEP "BF1192-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

   
    STEP AudOutput
    {
        USES P-STEP "BF9G99-P";

    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLI-ID  -> MIR-TRNX-DTL-INFO;
    "I" -> MIR-LOG-LEVL-CD;
    }


    IF LSIR-RETURN-CD != "00"
        BRANCH Edit;

    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Output
    {
        USES S-STEP "BF1190-O";
    }
        
        
    IF DisplayInput == "FALSE"
        EXIT;

    IF action == "ACTION_BACK"
        EXIT; 
        
    BRANCH Input;                

# 23774A CHANGES ENDS
    
}
