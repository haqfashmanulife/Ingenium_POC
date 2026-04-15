# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9331Payment.f                                               *
#*  Description:   Master Claim Payment                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL109  HIN/CL   Claim Payment                                             *
#*  R15582  CTS      AUTR FUNCTIONALITY CHANGES                                *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9330-I.s";
INCLUDE "BF9331-I.s";
INCLUDE "BF9330-O.s";
INCLUDE "BF9331-O.s";
INCLUDE "BF9330-P.p";
INCLUDE "BF9331-P.p";
#R15582 CHANGES START
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF9331Payment
{
    Title = STRINGTABLE.IDS_TITLE_BF9331Payment;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP KeyFields-S
    {
        USES S-STEP "BF9330-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;



    # Retrieve Claim Details  
    # Uses PRCES-STATE-CD to indicate it is being called
    # as part of the payment flow...

    STEP Retrieve
    {
        USES P-STEP "BF9330-P";
        "P" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;


    MIR-DV-PRCES-STATE-CD = " ";
WS-TEMP-ID3 = MIR-POL-ID-3-T[1];
WS-TEMP-ID4 = MIR-POL-ID-4-T[1];
WS-TEMP-ID5 = MIR-POL-ID-5-T[1];

MIR-POL-ID-3-T[1] = SUBSTRING (MIR-POL-ID-3-T[1],1,7);
MIR-POL-ID-4-T[1] = SUBSTRING (MIR-POL-ID-4-T[1],1,7);
MIR-POL-ID-5-T[1] = SUBSTRING (MIR-POL-ID-5-T[1],1,7);

    STEP Update-S
    {
        USES S-STEP "BF9331-I";
    }

    IF action == "ACTION_BACK"
    {
        MESSAGES-T[0] = "";
        ButtonBar = "ButtonBarOKCancel";

        EXIT;

    }
    IF action == "GoToListPayee"
    {
        STEP PayeeList
        {
            USES PROCESS "ClmPayeeList";
            ATTRIBUTES
            {
                GetMessages = "NO";
            }


            # Send Master Claim ID.

            MIR-CLM-ID -> MIR-CLM-ID;
        }

        BRANCH Update-S;

    }

 MIR-POL-ID-3-T[1] = WS-TEMP-ID3;
 MIR-POL-ID-4-T[1] = WS-TEMP-ID4; 
 MIR-POL-ID-5-T[1] = WS-TEMP-ID5;

    # Update the Claim                           

    STEP UpdateHost-P
    {
        USES P-STEP "BF9331-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;



    # Save any warnings to display on inquiry screen    

    temp-MSGS-T = MESSAGES-T;
    ButtonBar = "ButtonBarOK";


    # Display the output of the update process

    STEP Getit
    {
        USES P-STEP "BF9330-P";
    }
#123718 CHANGES START        
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
    
    }

    IF LSIR-RETURN-CD != "00"
          BRANCH Update-S;
#123718 CHANGES END 

    # Restore any warnings    

    MESSAGES-T = temp-MSGS-T;

#123718 CHANGES START
#R15582 CHANGES START        
  
   #STEP AUTROutput
    #{
        #USES P-STEP "BF9G99-P";
    
    #SESSION.MIR-USER-ID -> MIR-USER-ID;
    #SESSION.LSIR-BPF-ID  -> MIR-BFCN-ID;

    #MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
    
    #}

    #IF LSIR-RETURN-CD != "00"
          #BRANCH Update-S;
#R15582 CHANGES END  
#123718 CHANGES END

MIR-POL-ID-3-T[1] = SUBSTRING (MIR-POL-ID-3-T[1],1,7);
MIR-POL-ID-4-T[1] = SUBSTRING (MIR-POL-ID-4-T[1],1,7);
MIR-POL-ID-5-T[1] = SUBSTRING (MIR-POL-ID-5-T[1],1,7);

    STEP Output
    {
        USES S-STEP "BF9331-O";
    }

}

