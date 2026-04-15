# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9A52Update.f                                                *
#*  Description: Death Master Medical Claim Update                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *
#*  IPCAPM  CTS      Added "Payee List" Button                                 *
#*  R15582  CTS      AUDIT LOG RELATED  CHNAGES                                *
#*  123718  CTS      BUG FIX FOR AUDIT LOG RELATED CHANGES                     *
#*  23774A  CTS      AUDIT LOG RELATED  CHANGES                                *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF9A50-I.s";
INCLUDE "BF9A52-I.s";
INCLUDE "BF9A50-O.s";
INCLUDE "BF9A50-P.p";
INCLUDE "BF9A52-P.p";
#R15582 CHANGES BEGIN
INCLUDE "BF9G99-P.p";
#R15582 CHANGES END

PROCESS BF9A52Update
{
    Title = STRINGTABLE.IDS_TITLE_BF9A52Update;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH Retrieve;
        
    STEP KeyFields-S
    {
        USES S-STEP "BF9A50-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    IF action == "ACTION_REFRESH"
        BRANCH KeyFields-S;

    

    # Retrieve Claim Details

    STEP Retrieve
    {
        USES P-STEP "BF9A50-P";
    }

    IF LSIR-RETURN-CD != "00" && LSIR-RETURN-CD != "03"
        BRANCH KeyFields-S;



    # Default update..
    ButtonBar = "ButtonBarPayeeListOkCan";  
    
    STEP Update-S
    { 
        USES S-STEP "BF9A52-I";
       
    }

        
    IF action == "ACTION_BACK"
    {
       IF DisplayInput != "FALSE"
       {
           MESSAGES-T[0] = "";
           ButtonBar = "ButtonBarOKCancel";
           BRANCH KeyFields-S;
       }
       ELSE
           EXIT;

    }       
   
    IF action == "ACTION_PAYEELIST"
    {
        STEP PayeeList
        {
            USES PROCESS "DthPayee";
            
            ATTRIBUTES
            {
                GetMessages = "NO";
             
            }
            
            # Send Master Claim ID.
             MIR-CLM-ID -> MIR-CLM-ID;
       } 

         ButtonBar = "ButtonBarPayeeListOkCan";       
         BRANCH Update-S;
     }    
    
     
    IF action == "ACTION_REFRESH"
    {
        MIR-CAUSE-DESC-TXT = "";
        BRANCH Update-S;
    }
    
    # Update the Claim                           

    STEP UpdateHost-P
    {
        USES P-STEP "BF9A52-P";
        "3" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH Update-S;
        ButtonBar = "ButtonBarOK";
    temp-MSGS-T[1] = MESSAGES-T[1];
    temp-MSGS-T[2] = MESSAGES-T[2];
    temp-MSGS-T[3] = MESSAGES-T[3];
    temp-MSGS-T[4] = MESSAGES-T[4];
    temp-MSGS-T[5] = MESSAGES-T[5];
    temp-MSGS-T[6] = MESSAGES-T[6];
    temp-MSGS-T[7] = MESSAGES-T[7];
    temp-MSGS-T[8] = MESSAGES-T[8];
    temp-MSGS-T[9] = MESSAGES-T[9];
    temp-MSGS-T[10] = MESSAGES-T[10];
   
    # Display the output of the update process

    STEP Getit
    {
        USES P-STEP "BF9A50-P";
    }

#123718 CHANGES BEGIN
  
   STEP AUTROutput
    {
        USES P-STEP "BF9G99-P";
    
    SESSION.MIR-USER-ID -> MIR-USER-ID;
    SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;

    MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
#23774A CHANGES BEGIN
   "C" -> MIR-LOG-LEVL-CD;    
#23774A CHANGES END
    
    }

    IF LSIR-RETURN-CD != "00"
#23774A CHANGES BEGIN
#      BRANCH output: 
       BRANCH Update-S;
#23774A CHANGES END       
#123718 CHANGES END

      MESSAGES-T[1] = temp-MSGS-T[1];
      MESSAGES-T[2] = temp-MSGS-T[2];
      MESSAGES-T[3] = temp-MSGS-T[3];
      MESSAGES-T[4] = temp-MSGS-T[4];
      MESSAGES-T[5] = temp-MSGS-T[5];
      MESSAGES-T[6] = temp-MSGS-T[6];
      MESSAGES-T[7] = temp-MSGS-T[7];
      MESSAGES-T[8] = temp-MSGS-T[8];
      MESSAGES-T[9] = temp-MSGS-T[9];
      MESSAGES-T[10] = temp-MSGS-T[10];
    STEP Output
    {
        USES S-STEP "BF9A50-O";
    }


    # Go and ask for another Claim to update
#123718 CHANGES BEGIN
#R15582 CHANGES BEGIN
  
   #STEP AUTROutput
    #{
        #USES P-STEP "BF9G99-P";
    
    #SESSION.MIR-USER-ID -> MIR-USER-ID;
    #SESSION.LSIR-BPF-ID -> MIR-BFCN-ID;

    #MIR-CLM-ID ->MIR-TRNX-DTL-INFO; 
    
    #}

    #IF LSIR-RETURN-CD != "00"
       #BRANCH Output;
#R15582 CHANGES END       
#123718 CHANGES END

      ButtonBar = "ButtonBarOK";
      
      EXIT;

}

