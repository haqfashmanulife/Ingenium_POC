# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   BF1214ListInq.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************
# Change this to the S that starts the list

INCLUDE "BF1214-I.s";

# Change this to the P that retrieves the list

INCLUDE "BF1214-O.s";
INCLUDE "BF1214-P.p";
INCLUDE "BF1210Retrieve.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END


PROCESS BF1214ListInq
{
  VARIABLES
  {
    IN DisplayInput;
    OUT action;
  }


    Title = STRINGTABLE.IDS_TITLE_BF1214List;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH RetrieveList;



    # Ask the user where they'd like to start the list

    STEP ListStart
    {
        USES S-STEP "BF1214-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP RetrieveList
    {
        USES P-STEP "BF1214-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;

    Title = STRINGTABLE.IDS_TITLE_BF1214List;
    ButtonBar = "ButtonBarListsCRUD1";
#23774A CHANGES BEGIN

      
    temp-DTL-INFO  = MIR-RTBL-ID + " " + MIR-RTBL-IDT-NUM;   

    STEP AUTROutput
     {
        USES P-STEP "BF9G99-P";
    
      SESSION.MIR-USER-ID -> MIR-USER-ID;
      SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

       temp-DTL-INFO -> MIR-TRNX-DTL-INFO; 
      "I" -> MIR-LOG-LEVL-CD;
    
     }

    IF LSIR-RETURN-CD != "00"
        BRANCH ListStart;
        

#23774A CHANGES END


    STEP DisplayList
    {
        USES S-STEP "BF1214-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


   
    # REMOVE EXTRA KEY FIELDS BELOW AND THEN USER SEARCH TO
    # SKIP TO NEXT SECTION OF KEY FIELDS TO MAINTAIN

    MIR-DPOS-TRM-DY-DUR = MIR-DPOS-TRM-DY-DUR-T[index];
    MIR-DPOS-TRM-MO-DUR = MIR-DPOS-TRM-MO-DUR-T[index];
    MIR-INT-RT-EFF-DT = MIR-INT-RT-EFF-DT-T[index];
    MIR-INT-RT-ID = MIR-INT-RT-ID-T[index];
    MIR-INT-RT-MAX-AMT = MIR-INT-RT-MAX-AMT-T[index];

   
    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_INQUIRE if they pressed the inquire button.

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {
        STEP SelectItem
        {
            USES PROCESS "BF1210Retrieve";
            ATTRIBUTES
            {
                Explicit;
                GetMessages = "NO";
            }

            MIR-RTBL-AGE -> MIR-RTBL-AGE;
            MIR-RTBL-DB-OPT-CD -> MIR-RTBL-DB-OPT-CD;
            MIR-DPOS-TRM-DY-DUR -> MIR-DPOS-TRM-DY-DUR;
            MIR-DPOS-TRM-MO-DUR -> MIR-DPOS-TRM-MO-DUR;
            MIR-RTBL-JNT-LIFE-CD -> MIR-RTBL-JNT-LIFE-CD;
            MIR-LOC-GR-ID -> MIR-LOC-GR-ID;
            MIR-RTBL-PAR-CD -> MIR-RTBL-PAR-CD;
            MIR-RTBL-PNSN-QUALF-CD -> MIR-RTBL-PNSN-QUALF-CD;
            MIR-RTBL-RT-TYP-CD -> MIR-RTBL-RT-TYP-CD;
            MIR-RTBL-ID -> MIR-RTBL-ID;
            MIR-RTBL-SEX-CD -> MIR-RTBL-SEX-CD;
            MIR-RTBL-SMKR-CD -> MIR-RTBL-SMKR-CD;
            MIR-RTBL-STBL-1-CD -> MIR-RTBL-STBL-1-CD;
            MIR-RTBL-STBL-2-CD -> MIR-RTBL-STBL-2-CD;
            MIR-RTBL-STBL-3-CD -> MIR-RTBL-STBL-3-CD;
            MIR-RTBL-STBL-4-CD -> MIR-RTBL-STBL-4-CD;
            MIR-RTBL-IDT-NUM -> MIR-RTBL-IDT-NUM;
            "000" -> MIR-RTBL-AGE-DUR;
            "999" -> MIR-DV-END-RTBL-AGE-DUR;
            "FALSE" -> DisplayInput;
        }

        BRANCH RetrieveList;

    }

}

