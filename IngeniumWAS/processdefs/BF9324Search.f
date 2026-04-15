# Converted from PathFinder 2.0 to 2.2 on Jan 15, 2004 11:10:00 AM EST

#*******************************************************************************
#*  Component:   BF9324Search.f                                                *
#*  Description: Firm Banking (FBNK - ) Search function                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HAC002  HIN/CL   FIRM BANKING - ONLINE            (HAC002A)                *
#*  PF13    PF 1.3   correct array processing from Pathfinder conversion       *
#*  MP4FB1  SC       Firm Banking Remittance - new logic for FB CVG info       *
#*  ABF230  CTS      Add FBKC-CAT-CD as key field                              *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9320-P.p";
INCLUDE "BF9322-P.p";
INCLUDE "BF9324-P.p";
INCLUDE "BF8000-P.p";
INCLUDE "BF9320-O.s";
INCLUDE "BF9322-I.s";
INCLUDE "BF9324-O.s";
INCLUDE "BF9324-I.s";
# * * *
# * * * MP4FB1
# * * *
INCLUDE "BF9325-P.p";
INCLUDE "BF9325-O.s";
INCLUDE "BF9326-I.s";

PROCESS BF9324Search
{
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Enter the key(s) for the value that you'd like to work with

    StartPoint:

    Title = STRINGTABLE.IDS_TITLE_FirmBankingEntries;
    ButtonBar = "ButtonBarOKCancel";

    STEP ListStart
    {
        USES S-STEP "BF9324-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_LANGCHANGE"
        BRANCH ListStart;

    IF action == "ACTION_REFRESH"
        BRANCH ListStart;

#UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID;
        MIR-POL-ID-SFX = SUBSTRING (UserDefinedPolicyIDBase,10,1);    
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        WS-POL-ID-BASE <- WS9D34-POL-ID;

        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID;
    # UY3049 CHANGES STARTS
        WS-STR3-PAYO-IND <- WS9D34-STR3-PAYO-IND;
        WS-10-POL-ID <- WS9D34-10-POL-ID;
    # UY3049 CHANGES ENDS
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

        IF WS-POL-COUNTER <="01"
          {
           MIR-POL-ID = UserDefinedPolicyIDBase;
          }

        IF WS-POL-COUNTER >"01"
          {
           MIR-POL-ID = WS-POL-ID-BASE;
          }

    # UY3049 CHANGES STARTS
    IF WS-STR3-PAYO-IND == "Y"
      {
          MIR-STR3-PAYO-IND = WS-STR3-PAYO-IND;
          MIR-10-POL-ID = WS-10-POL-ID;
      }
    # UY3049 CHANGES ENDS
#UY3004 CHANGES END

#   * * * MP4FB1
#   * * * More new values have been assigned to FBNK-CAT-CD
#   * * * The value is selected by user from the list on the first input screen
#   * * *
#   MIR-FBNK-CAT-CD = "CLAIM";


    # Search for all Firm Banking Records that match the search criteria

    STEP FirmBankingInitialSearch
    {
        USES P-STEP "BF9324-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH StartPoint;

    # PF13 - move array in one stmt

#    STORED-MSG-TEXT-01 = MESSAGES-T[1];
#    STORED-MSG-TEXT-02 = MESSAGES-T[2];
#    STORED-MSG-TEXT-03 = MESSAGES-T[3];
#    STORED-MSG-TEXT-04 = MESSAGES-T[4];
#    STORED-MSG-TEXT-05 = MESSAGES-T[5];
#    STORED-MSG-TEXT-06 = MESSAGES-T[6];
#    STORED-MSG-TEXT-07 = MESSAGES-T[7];
#    STORED-MSG-TEXT-08 = MESSAGES-T[8];
#    STORED-MSG-TEXT-09 = MESSAGES-T[9];
#    STORED-MSG-TEXT-10 = MESSAGES-T[10];

     STORED-MSG-TEXT = MESSAGES-T;

    BRANCH DisplayFirmBankingList;

    STEP FirmBankingSearch
    {
        USES P-STEP "BF9324-P";
    }

    # PF13 - move array in one stmt

#    STORED-MSG-TEXT-01 = MESSAGES-T[1];
#    STORED-MSG-TEXT-02 = MESSAGES-T[2];
#    STORED-MSG-TEXT-03 = MESSAGES-T[3];
#    STORED-MSG-TEXT-04 = MESSAGES-T[4];
#    STORED-MSG-TEXT-05 = MESSAGES-T[5];
#    STORED-MSG-TEXT-06 = MESSAGES-T[6];
#    STORED-MSG-TEXT-07 = MESSAGES-T[7];
#    STORED-MSG-TEXT-08 = MESSAGES-T[8];
#    STORED-MSG-TEXT-09 = MESSAGES-T[9];
#    STORED-MSG-TEXT-10 = MESSAGES-T[10];

    STORED-MSG-TEXT = MESSAGES-T;

    DisplayFirmBankingList:

    Title = STRINGTABLE.IDS_TITLE_FirmBankingEntries;
    ButtonBar = "ButtonBarListsRU";

    STEP DisplayList
    {
        USES S-STEP "BF9324-O";
    }

    IF action == "ACTION_LANGCHANGE"
        BRANCH DisplayList;

    IF action == "ACTION_BACK"
        EXIT;


    # Check in case of change of Key

    IF MIR-FBNK-REMIT-DT != MIR-PREV-FBNK-REMIT-DT || MIR-FBNK-REF-ID != MIR-PREV-FBNK-REF-ID || MIR-POL-ID != MIR-PREV-POL-ID || MIR-FB-CLI-ID != MIR-PREV-CLI-ID
    {
        BRANCH FirmBankingSearch;

    }

    # If the user has pressed the more button, go back and reget the list

    IF action == "ACTION_MORE" || action == "ACTION_NEXT"
        BRANCH FirmBankingSearch;


    # If the user hasn't selected an item to work with.  Go back.

    IF index == "0"
        BRANCH DisplayList;



    # Build the key ID from the row that the user selected
    # Build all of the key variables that will be required
    # by the following steps and pass them to each step.

    MIR-FBNK-REMIT-DT = MIR-FBNK-REMIT-DT-T[index];
    MIR-FBNK-REF-ID = MIR-FBNK-REF-ID-T[index];
    MIR-POL-ID = MIR-POL-ID-T[index];
    MIR-POL-ID-BASE = MIR-POL-ID-T[index];
    MIR-FB-CLI-ID = MIR-FB-CLI-ID-T[index];
    MIR-FBNK-SEQ-NUM = MIR-FBNK-SEQ-NUM-T[index];
    MIR-SELECTED-FBNK-STAT-CD = MIR-FBNK-STAT-CD-T[index];
    MIR-FBNK-CAT-CD = MIR-FBNK-CAT-CD-T[index];
#UY3004 CHANGES START
    MIR-POL-ID-SFX = SUBSTRING (MIR-POL-ID-T[index],10,1);    
#UY3004 CHANGES END
   
    # action will be "SelectItem" if the user clicks on a hyperlink in the
    # row.  It will be ACTION_UPDATE if they pressed the update button and
    # ACTION_INQUIRE if they select the Retrieve button

    IF action == "SelectItem" || action == "ACTION_INQUIRE"
    {

        # The user wants to look at details of a Firm Banking record

        STEP RetrievePolicyDetails
        {
            USES P-STEP "BF8000-P";
        }

        IF LSIR-RETURN-CD != "00"
        {
            MIR-FBNK-REMIT-DT = MIR-PREV-FBNK-REMIT-DT;
            MIR-FBNK-REF-ID = MIR-PREV-FBNK-REF-ID;
            MIR-POL-ID = MIR-PREV-POL-ID;
            MIR-FB-CLI-ID = MIR-PREV-CLI-ID;
# MP4FB1    MIR-FBNK-CAT-CD = "CLAIM";
            MIR-FBNK-CAT-CD = MIR-PREV-FBNK-CAT-CD;

            BRANCH DisplayList;

        }

        MIR-ACTION-TO-TAKE-CD = "GETDETAILS";

        STEP RetrieveFirmBankingDetails
        {
            USES P-STEP "BF9320-P";
        }

        IF LSIR-RETURN-CD != "00"
        {
            MIR-FBNK-REMIT-DT = MIR-PREV-FBNK-REMIT-DT;
            MIR-FBNK-REF-ID = MIR-PREV-FBNK-REF-ID;
            MIR-POL-ID = MIR-PREV-POL-ID;
            MIR-FB-CLI-ID = MIR-PREV-CLI-ID;
# MP4FB1    MIR-FBNK-CAT-CD = "CLAIM";
            MIR-FBNK-CAT-CD = MIR-PREV-FBNK-CAT-CD;

            BRANCH DisplayFirmBankingList;

        }

        ButtonBar = "ButtonBarOK";
        Title = STRINGTABLE.IDS_TITLE_FirmBankingEntryInquiry;
        STORE-MIR-FBNK-SEQ-NUM = MIR-FBNK-SEQ-NUM;

        STEP DisplayDetails
        {
            USES S-STEP "BF9320-O";
        }

        IF action == "ACTION_LANGCHANGE"
            BRANCH DisplayDetails;


        ReturnToSearchScreen:

        MIR-FBNK-REMIT-DT = MIR-PREV-FBNK-REMIT-DT;
        MIR-FBNK-REF-ID = MIR-PREV-FBNK-REF-ID;
        MIR-POL-ID = MIR-PREV-POL-ID;
        MIR-FB-CLI-ID = MIR-PREV-CLI-ID;
# MP4FB1 MIR-FBNK-CAT-CD = "CLAIM";
        MIR-FBNK-CAT-CD = MIR-PREV-FBNK-CAT-CD;
        MIR-MORE-FBNK-SEQ-NUM = STORE-MIR-FBNK-SEQ-NUM;

    # PF13 - move array in one stmt
    #   MESSAGES-T[1] = STORED-MSG-TEXT-01;
        MESSAGES-T = STORED-MSG-TEXT;

        BRANCH DisplayFirmBankingList;
    }

    #**********************************************************************
    # * * * MP4FB1                                                        *
    # * * * A new hyperlink is added to the screen and the action will be *
    # * * * "ViewFirmBankingCoverageDetails" when user clicks on it.      *
    #**********************************************************************

    MIR-SAVE-FBNK-REMIT-DT = MIR-FBNK-REMIT-DT;
    MIR-SAVE-FBNK-REF-ID = MIR-FBNK-REF-ID;
    MIR-SAVE-POL-ID = MIR-POL-ID;
    MIR-SAVE-FB-CLI-ID = MIR-FB-CLI-ID;
    MIR-SAVE-FBNK-CAT-CD = MIR-FBNK-CAT-CD;

    IF action == "ViewFirmBankingCoverageDetails"
    {

    #******************************************************************************
    # SET FBKC REQUEST ACTION ID TO 'RET' ==> CALL CSOM9325 TO RETRIEVE FBKC RECORD
    #******************************************************************************

        STEP ViewFirmBankingCoverageDetails
        {
             USES P-STEP "BF9325-P";
             "RET" -> MIR-FBKC-REQUEST-ACT-CD;
        }

        IF LSIR-RETURN-CD != "00"
        {
            MIR-FBNK-REMIT-DT = MIR-PREV-FBNK-REMIT-DT;
            MIR-FBNK-REF-ID = MIR-PREV-FBNK-REF-ID;
            MIR-POL-ID = MIR-PREV-POL-ID;
            MIR-FB-CLI-ID = MIR-PREV-CLI-ID;
            MIR-FBNK-CAT-CD = MIR-PREV-FBNK-CAT-CD;
            MIR-MORE-FBNK-SEQ-NUM = STORE-MIR-FBNK-SEQ-NUM;

            BRANCH DisplayFirmBankingList;
        }

        Title = STRINGTABLE.IDS_TITLE_FirmBankingCoverageDetails;
        ButtonBar = "ButtonBarUpdateCancelMore";

        STEP DisplayFBKCList
        {
             USES S-STEP "BF9325-O";
        }
        TRACE ("FBKC FBNK SEQ NUM = " + MIR-FBKC-FBNK-SEQ-NUM);

        IF action == "ACTION_BACK"
        EXIT;

    #**********************************************************************
    # If the user has pressed the more button, go back and reget the list
    #**********************************************************************

        IF action == "ACTION_MORE" || action == "ACTION_NEXT"
           BRANCH ViewFirmBankingCoverageDetails;

    #**********************************************************************
    # If the user hasn't selected an item to work with.  Go back.
    #**********************************************************************

        IF index == "0"
           BRANCH DisplayFBKCList;

    #**********************************************************************
    # Build Key for following select update step
    #**********************************************************************

        MIR-FBKC-U-POL-ID = MIR-FBKC-POL-ID-T[index];
        MIR-FBKC-U-CVG-NUM = MIR-FBKC-CVG-NUM-T[index];
        MIR-FBKC-U-REMIT-DT = MIR-FBKC-IDT-NUM-T[index];
    #ABF230 STARTS
        MIR-FBKC-U-CAT-CD = MIR-FBKC-CAT-CD-T[index];
    #ABF230 ENDS
        MIR-FBKC-U-FBNK-SEQ-NUM = MIR-FBKC-FBNK-SEQ-NUM-T[index];
        MIR-FBKC-U-SEQ-NUM = MIR-FBKC-SEQ-NUM-T[index];

        TRACE ("Index  = " + index);
        TRACE ("FBKC FBNK SEQ NUM = " + MIR-FBKC-U-FBNK-SEQ-NUM);
        TRACE ("FBKC SEQ NUM = " + MIR-FBKC-U-SEQ-NUM);
    #**********************************************************************
    # Action will be ACTION_UPDATE if the check box is selected and
    # pressed on the 'UPDATE' button
    #**********************************************************************

        IF action == "ACTION_UPDATE"
        {

            MIR-ACTION-TO-TAKE-CD = "CHCKSTATUS";

    #******************************************************************************
    # SET FBKC REQUEST ACTION ID TO 'UPD' ==> CALL CSOM9325 TO UPDATE FBKC RECORD
    #******************************************************************************
            STEP UpdateFirmBankingCoverageStatus
            {
                USES P-STEP "BF9325-P";
                "UPD" -> MIR-FBKC-REQUEST-ACT-CD;
            }

            IF LSIR-RETURN-CD != "00"
            {
               MIR-FBNK-REMIT-DT = MIR-PREV-FBNK-REMIT-DT;
               MIR-FBNK-REF-ID = MIR-PREV-FBNK-REF-ID;
               MIR-POL-ID = MIR-PREV-POL-ID;
               MIR-FB-CLI-ID = MIR-PREV-CLI-ID;
               MIR-FBNK-CAT-CD = MIR-PREV-FBNK-CAT-CD;

               BRANCH ViewFirmBankingCoverageDetails;
            }

    #**********************************************************************
    #  Edit FBKC status and fail reason
    #**********************************************************************

            ButtonBar = "ButtonBarOKCancel";
            Title = STRINGTABLE.IDS_TITLE_FirmBankingCoverageUpdate;

            STEP UpdateFBKCEdit
            {
                 USES S-STEP "BF9326-I";
            }

    #**********************************************************************
    # If pressed on 'Cancelled' button
    #**********************************************************************

            IF action == "ACTION_BACK"
            {
               MIR-FBNK-REMIT-DT = MIR-PREV-FBNK-REMIT-DT;
               MIR-FBNK-REF-ID = MIR-PREV-FBNK-REF-ID;
               MIR-POL-ID = MIR-PREV-POL-ID;
               MIR-FB-CLI-ID = MIR-PREV-CLI-ID;
               MIR-FBNK-CAT-CD = MIR-PREV-FBNK-CAT-CD;

               BRANCH ViewFirmBankingCoverageDetails;
            }

    #**********************************************************************
    # If pressed on 'OK' button
    #**********************************************************************

            STEP FBKC_ACTION_UPDATE
            {
                USES P-STEP "BF9325-P";
                "UPD" -> MIR-FBKC-REQUEST-ACT-CD;
            }

            IF LSIR-RETURN-CD != "00"
               BRANCH UpdateFBKCEdit;

    #**********************************************************************
    # Return to Firm Banking Search
    #**********************************************************************

        MIR-MORE-POL-ID = MIR-POL-ID;
        MIR-MORE-CLI-ID = MIR-FB-CLI-ID;
        MIR-MORE-FBNK-REMIT-DT = MIR-FBNK-REMIT-DT;
        MIR-MORE-FBNK-REF-ID = MIR-FBNK-REF-ID;
        MIR-MORE-FBNK-SEQ-NUM = MIR-FBNK-SEQ-NUM-T[1];
        MIR-MORE-FBNK-CAT-CD = "CLAIM";
        MIR-FBNK-REMIT-DT = MIR-PREV-FBNK-REMIT-DT;
        MIR-FBNK-REF-ID = MIR-PREV-FBNK-REF-ID;
        MIR-POL-ID = MIR-PREV-POL-ID;
        MIR-FB-CLI-ID = MIR-PREV-CLI-ID;
        MIR-FBNK-CAT-CD = MIR-PREV-FBNK-CAT-CD;

        BRANCH FirmBankingSearch;
        }
    }

    #**********************************************************************
    # The user wants to update Status of a Firm Banking Record
    #**********************************************************************

    IF action == "ACTION_UPDATE"
    {
        MIR-ACTION-TO-TAKE-CD = "CHCKSTATUS";

        STEP UpdateStatus
        {
            USES P-STEP "BF9320-P";
        }

        IF LSIR-RETURN-CD != "00"
        {
            MIR-FBNK-REMIT-DT = MIR-PREV-FBNK-REMIT-DT;
            MIR-FBNK-REF-ID = MIR-PREV-FBNK-REF-ID;
            MIR-POL-ID = MIR-PREV-POL-ID;
            MIR-FB-CLI-ID = MIR-PREV-CLI-ID;
#MP4FB1     MIR-FBNK-CAT-CD = "CLAIM";
            MIR-FBNK-CAT-CD = MIR-PREV-FBNK-CAT-CD;

            BRANCH DisplayFirmBankingList;
        }

        # Edit the record

        ButtonBar = "ButtonBarOKCancel";
        Title = STRINGTABLE.IDS_TITLE_FirmBankingEntryUpdate;
        STORE-MIR-FBNK-SEQ-NUM = MIR-MORE-FBNK-SEQ-NUM;

        STEP UpdateEdit
        {
            USES S-STEP "BF9322-I";
        }

        # Return to STEP Edit if changing Language

        IF action == "ACTION_LANGCHANGE"
        {
            BRANCH UpdateEdit;
        }

        # Action to Take if Edit Cancelled

        IF action == "ACTION_BACK"
        {
            MIR-FBNK-REMIT-DT = MIR-PREV-FBNK-REMIT-DT;
            MIR-FBNK-REF-ID = MIR-PREV-FBNK-REF-ID;
            MIR-POL-ID = MIR-PREV-POL-ID;
            MIR-FB-CLI-ID = MIR-PREV-CLI-ID;
#MP4FB1     MIR-FBNK-CAT-CD = "CLAIM";
            MIR-FBNK-CAT-CD = MIR-PREV-FBNK-CAT-CD;
            MIR-MORE-FBNK-SEQ-NUM = STORE-MIR-FBNK-SEQ-NUM;
       # PF13 - move array in one stmt
       #   MESSAGES-T[1] = STORED-MSG-TEXT-01;
           MESSAGES-T = STORED-MSG-TEXT;

            BRANCH DisplayFirmBankingList;

        }

        STEP ACTION_UPDATE
        {
            USES P-STEP "BF9322-P";
        }

        IF LSIR-RETURN-CD != "00"
            BRANCH UpdateEdit;



        # Return to list

        MIR-MORE-POL-ID = MIR-POL-ID;
        MIR-MORE-CLI-ID = MIR-FB-CLI-ID;
        MIR-MORE-FBNK-REMIT-DT = MIR-FBNK-REMIT-DT;
        MIR-MORE-FBNK-REF-ID = MIR-FBNK-REF-ID;
        MIR-MORE-FBNK-SEQ-NUM = MIR-FBNK-SEQ-NUM-T[1];
        MIR-MORE-FBNK-CAT-CD = "CLAIM";
        MIR-FBNK-REMIT-DT = MIR-PREV-FBNK-REMIT-DT;
        MIR-FBNK-REF-ID = MIR-PREV-FBNK-REF-ID;
        MIR-POL-ID = MIR-PREV-POL-ID;
        MIR-FB-CLI-ID = MIR-PREV-CLI-ID;
#MP4FB1 MIR-FBNK-CAT-CD = "CLAIM";
        MIR-FBNK-CAT-CD = MIR-PREV-FBNK-CAT-CD;

        BRANCH FirmBankingSearch;

    }
}

