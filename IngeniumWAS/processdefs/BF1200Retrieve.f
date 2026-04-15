# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1200Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF1200-P.p";
INCLUDE "BF1200-I.s";
INCLUDE "BF1200-O.s";
INCLUDE "GenRetrieve.f";
INCLUDE "BF1214List.f";
#23774A CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#23774A CHANGES END

PROCESS BF1200Retrieve
{
    Title = STRINGTABLE.IDS_TITLE_BF1200Retrieve;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
    index = "0";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;



    # Collect the key value 

    STEP Input
    {
        USES S-STEP "BF1200-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Retrieve the data for the key value

    STEP Retrieve
    {
        USES P-STEP "BF1200-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Input;
# 23774A CHANGES STARTS

    temp-DTL-INFO  = MIR-RH-ID + " " + MIR-RH-EFF-DT; 
  
   STEP AudOutput
    {
      USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;
    temp-DTL-INFO  ->MIR-TRNX-DTL-INFO;
    
    "I" -> MIR-LOG-LEVL-CD;
    
    }
      
    IF LSIR-RETURN-CD != "00"
        BRANCH Input;             

    ButtonBar = "ButtonBarOK";

# 23774A CHANGES ENDS



    # Display the record retrieved

    STEP Output
    {
        USES S-STEP "BF1200-O";
    }

    IF action == "ACTION_BACK"
    {
        IF DisplayInput == "False"
            EXIT;

        ELSE
            BRANCH Input;


    }
    IF action == "ACTION_NEXT"
        EXIT;



    #  action == "SelectItem"  BRANCH to Rate List

    MIR-RTBL-ID = MIR-RTBL-1-ID-T[index];
    MIR-RTBL-RT-TYP-CD = MIR-RH-RT-TYP-CD;

    STEP SelectItem
    {
        USES PROCESS "BF1214List";
        ATTRIBUTES
        {
            Explicit;
            GetMessages = "NO";
        }

        MIR-RTBL-ID -> MIR-RTBL-ID;
        MIR-RTBL-RT-TYP-CD -> MIR-TRBL-TYP-CD;
        SESSION.LSIR-PRCES-DT -> MIR-RTBL-IDT-NUM;
        " " -> MIR-RTBL-AGE;
        " " -> MIR-RTBL-DB-OPT-CD;
        "000" -> MIR-DPOS-TRM-DY-DUR;
        "000" -> MIR-DPOS-TRM-MO-DUR;
        " " -> MIR-RTBL-JNT-LIFE-CD;
        " " -> MIR-LOC-GR-ID;
        " " -> MIR-RTBL-PAR-CD;
        " " -> MIR-RTBL-PNSN-QUALF-CD;
        " " -> MIR-RTBL-SEX-CD;
        " " -> MIR-RTBL-SMKR-CD;
        " " -> MIR-RTBL-STBL-1-CD;
        " " -> MIR-RTBL-STBL-2-CD;
        " " -> MIR-RTBL-STBL-3-CD;
        " " -> MIR-RTBL-STBL-4-CD;
        "000" -> MIR-RTBL-AGE-DUR;
        "999" -> MIR-DV-END-RTBL-AGE-DUR;
        "FALSE" -> DisplayInput;
    }

    IF action == "ACTION_BACK"
        EXIT;

}

