# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:05 PM EDT

#*******************************************************************************
#*  Component:   BF1367Quoterpu.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  RPU001           ADDED CHANGES FOR RPU QUOTE INQUIRY SCREEN                *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*  UYS043  CTS      CHANGES MADE AS PART OF VIRTUAL QUOTE SCREEN              *
#*  S22291  CTS      CHANGES DONE AS PART OF UDSD-2291                         *
#*  S22578  CTS      CHANGES DONE AS PART OF UDSD-2578                         *
#*  S25516  CTS      FIX FOR UDSD-5516,5518,5502,3997                          *
#*  R19898  CTS      FIX DONE FOR JBIPS-83 RPU VIRTUAL QUOTE                   *
#*******************************************************************************

INCLUDE "BF1367-P.p";
INCLUDE "BF1367-I.s";
#UYS043 CHANGES START
INCLUDE "BF1367VIR-I.s";
INCLUDE "BF1367VIR-O.s";
#UYS043 CHANGES END
INCLUDE "BF1367-O.s";
INCLUDE "GenProcess.f";

#RPU001 CHANGES STARTS FROM HERE 
PROCESS BF1367Quoterpu
{
#    STEP Main
#    {
#        USES PROCESS "GenProcess";
#        ATTRIBUTES
#        {
#            GetMessages = "NO";
#        }
#
#        STRINGTABLE.IDS_TITLE_BF1367Quoterpu -> Title;
#        "BF1367-I" -> InputS;
#        "BF1367-P" -> ProcessP;
#        "BF1367-O" -> OutputS;
#    }
#
#    IF DisplayInput == "FALSE"
#        EXIT;
#
#    IF action == "ACTION_CANCEL"
#        EXIT;
#
#
#    BRANCH Main;
#}


    Title = STRINGTABLE.IDS_TITLE_BF1367Quoterpu;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";
     

     
    STEP Input
    {
        USES S-STEP "BF1367-I";
        STRINGTABLE.IDS_TITLE_BF1367Quoterpu -> Title;
    }

    IF action == "ACTION_BACK"
        EXIT;

    # UY3004 CHANGES START

    UserDefinedPolicyIDBase   = MIR-POL-ID-BASE;
    UserDefinedPolicyIDSuffix = MIR-POL-ID-SFX;
    
    STEP RetrieveList
    {
        USES PROCESS "BF9D34List";

        UserDefinedPolicyIDBase -> MIR-POL-ID-BASE;
        UserDefinedPolicyIDSuffix -> MIR-POL-ID-SFX;
        WS-POL-ID-BASE <- WS9D34-POL-ID-BASE;
        WS-POL-ID-SFX  <- WS9D34-POL-ID-SFX;
        WS-POL-COUNTER <-WS9D34-POL-COUNTER;
        WS-CANCEL-IND  <- WS9D34-CANCEL-IND;
        WS-RETURN-CD   <- WS9D34-RETURN-CD;
        UserDefinedPolicyIDBase <- WS9D34-POL-ID-BASE;
        UserDefinedPolicyIDSuffix <- WS9D34-POL-ID-SFX;
    }

    IF  WS-CANCEL-IND == "Y" || WS-RETURN-CD !="00"
       {
        BRANCH Input;
       }

    IF WS-POL-COUNTER <="01"
      {
       MIR-POL-ID-BASE = UserDefinedPolicyIDBase;
       MIR-POL-ID-SFX  = UserDefinedPolicyIDSuffix ;
      }

    IF WS-POL-COUNTER >"01"
      {
       MIR-POL-ID-BASE = WS-POL-ID-BASE;
       MIR-POL-ID-SFX  = WS-POL-ID-SFX;
      }

    # UY3004 CHANGES END 

    STEP Retrieve
    {
        USES P-STEP "BF1367-P";
# S25516 CHANGES BEGIN
    "1" -> MIR-DV-PRCES-STATE-CD;

# S25516 CHANGES ENDS
    }
    

    IF LSIR-RETURN-CD != "00" && (MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N")
        BRANCH Input;

#UYS043 CHANGES STARTS

    temp-trad-pd-to-mo-num = MIR-VIR-TRAD-PD-TO-MO-NUM;
    temp-ci-frst-elaps-yrs-dur = MIR-VIR-CI-FRST-ELAPS-YRS-DUR;
    temp-loan-amt = MIR-VIR-LOAN-AMT;
    temp-apl-loan-amt = MIR-VIR-APL-LOAN-AMT;
#S25516 CHANGES BEGIN
    temp-bill-mode-cd = MIR-VIR-BILL-MODE-CD;
#S25516 CHANGES ENDS
#R19898 CHANGES STARTS-THIS CHANGES FOR MAXMIUM NO.OF.CVGS. THIS FIX FOR VIR RPU QUOTE SCREEN. 
#IF WE ARE CHANGEING ANY INPUTS IN VIR RPU QUOTE ITEMS SHOULD DISPLAY VIR RESULTS SCREEN.
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[1] 	=   MIR-VIR-CVG-FACE-AMT-T[1];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[2] 	=   MIR-VIR-CVG-FACE-AMT-T[2];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[3] 	=   MIR-VIR-CVG-FACE-AMT-T[3];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[4] 	=   MIR-VIR-CVG-FACE-AMT-T[4];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[5] 	=   MIR-VIR-CVG-FACE-AMT-T[5];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[6] 	=   MIR-VIR-CVG-FACE-AMT-T[6];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[7] 	=   MIR-VIR-CVG-FACE-AMT-T[7];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[8] 	=   MIR-VIR-CVG-FACE-AMT-T[8];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[9] 	=   MIR-VIR-CVG-FACE-AMT-T[9];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[10]   =   MIR-VIR-CVG-FACE-AMT-T[10];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[11]   =   MIR-VIR-CVG-FACE-AMT-T[11];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[12]   =   MIR-VIR-CVG-FACE-AMT-T[12];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[13]   =   MIR-VIR-CVG-FACE-AMT-T[13];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[14]   =   MIR-VIR-CVG-FACE-AMT-T[14];
    MIR-VIR-HIDDEN-CVG-FACE-AMT-T[15]   =   MIR-VIR-CVG-FACE-AMT-T[15];

#R19898 CHANGES ENDS
    TRACE ("MIR-VIR-TRAD-PD-TO-MO-NUM" + MIR-VIR-TRAD-PD-TO-MO-NUM);
    TRACE ("MIR-VIR-CI-FRST-ELAPS-YRS-DUR" + MIR-VIR-CI-FRST-ELAPS-YRS-DUR);
    TRACE ("MIR-VIR-LOAN-AMT" + MIR-VIR-LOAN-AMT);
    TRACE ("MIR-VIR-APL-LOAN-AMT" + MIR-VIR-APL-LOAN-AMT);
    TRACE ("MIR-VIR-ACTV-IND" + MIR-VIR-ACTV-IND);

    TRACE ("temp-trad-pd-to-mo-num" + temp-trad-pd-to-mo-num);
    TRACE ("temp-ci-frst-elaps-yrs-dur" + temp-ci-frst-elaps-yrs-dur);
    TRACE ("temp-loan-amt" + temp-loan-amt);
    TRACE ("temp-apl-loan-amt" + temp-apl-loan-amt);

#S25516 CHANGES BEGIN
#    IF MIR-VIR-SCREEN-IND == "Y"
#       BRANCH InputS;
##UYS043 CHANGES ENDS
#
#    ButtonBar = "ButtonBarOK";
#    STEP DisplayOutput
#    {
#        USES S-STEP "BF1367-O";
#        STRINGTABLE.IDS_TITLE_BF1367Phase1 -> Title;
#    }
#         
#    EXIT;       

#UYS043 CHANGES STARTS
    IF MIR-VIR-SCREEN-IND == "Y"
    {
#S25516  CHANGES ENDS
    STEP InputS
    {
        USES S-STEP "BF1367VIR-I";
        STRINGTABLE.IDS_TITLE_BF1367Quoterpu -> Title;
#S25516 CHANGES BEGIN
        " " -> MIR-VIR-BILL-MODE-CD;
#S25516  CHANGES ENDS
#S22291 CHANGES STARTS
#        "" -> MIR-VIR-INT-STR-DT;
#S22291 CHANGES ENDS
#S22578 CHANGES STARTS
#        "" -> MIR-VIR-POL-LOAN-EFF-DT;
#S22578 CHANGES ENDS
    }

    IF action == "ACTION_BACK"
        EXIT;

    STEP ProcessP
    {
        USES P-STEP "BF1367-P";
         "2" -> MIR-DV-PRCES-STATE-CD;
    }

    IF LSIR-RETURN-CD != "00" && (MIR-DV-UNDO-VALID-CD != "N" || MIR-DV-COMMIT-CD != "N")
        BRANCH Input;

    TRACE ("MIR-VIR-TRAD-PD-TO-MO-NUM1" + MIR-VIR-TRAD-PD-TO-MO-NUM);
    TRACE ("MIR-VIR-CI-FRST-ELAPS-YRS-DUR1" + MIR-VIR-CI-FRST-ELAPS-YRS-DUR);
    TRACE ("MIR-VIR-LOAN-AMT1" + MIR-VIR-LOAN-AMT);
    TRACE ("MIR-VIR-APL-LOAN-AMT1" + MIR-VIR-APL-LOAN-AMT);
    TRACE ("MIR-VIR-ACTV-IND1" + MIR-VIR-ACTV-IND);

    TRACE ("temp-trad-pd-to-mo-num1" + temp-trad-pd-to-mo-num);
    TRACE ("temp-ci-frst-elaps-yrs-dur1" + temp-ci-frst-elaps-yrs-dur);
    TRACE ("temp-loan-amt1" + temp-loan-amt);
    TRACE ("temp-apl-loan-amt1" + temp-apl-loan-amt);


    IF MIR-VIR-TRAD-PD-TO-MO-NUM == temp-trad-pd-to-mo-num
    && MIR-VIR-CI-FRST-ELAPS-YRS-DUR == temp-ci-frst-elaps-yrs-dur
#    && MIR-VIR-BILL-MODE-CD == ""
    && MIR-VIR-LOAN-AMT == temp-loan-amt
    && MIR-VIR-APL-LOAN-AMT == temp-apl-loan-amt
    && MIR-VIR-ACTV-IND == "N"
#S25516 CHANGES BEGIN
    && MIR-VIR-BILL-MODE-CD == temp-bill-mode-cd
#S25516 CHANGES ENDS
#R19898 CHANGES STARTS
    && MIR-VIR-CVG-FACE-AMT-T[1] ==  MIR-VIR-HIDDEN-CVG-FACE-AMT-T[1] 
    && MIR-VIR-CVG-FACE-AMT-T[2] ==  MIR-VIR-HIDDEN-CVG-FACE-AMT-T[2] 
    && MIR-VIR-CVG-FACE-AMT-T[3] ==  MIR-VIR-HIDDEN-CVG-FACE-AMT-T[3] 
    && MIR-VIR-CVG-FACE-AMT-T[4] ==  MIR-VIR-HIDDEN-CVG-FACE-AMT-T[4] 
    && MIR-VIR-CVG-FACE-AMT-T[5] ==  MIR-VIR-HIDDEN-CVG-FACE-AMT-T[5] 
    && MIR-VIR-CVG-FACE-AMT-T[6] ==  MIR-VIR-HIDDEN-CVG-FACE-AMT-T[6] 
    && MIR-VIR-CVG-FACE-AMT-T[7] ==  MIR-VIR-HIDDEN-CVG-FACE-AMT-T[7] 
    && MIR-VIR-CVG-FACE-AMT-T[8] ==  MIR-VIR-HIDDEN-CVG-FACE-AMT-T[8] 
    && MIR-VIR-CVG-FACE-AMT-T[9] ==  MIR-VIR-HIDDEN-CVG-FACE-AMT-T[9] 
    && MIR-VIR-CVG-FACE-AMT-T[10] == MIR-VIR-HIDDEN-CVG-FACE-AMT-T[10]
    && MIR-VIR-CVG-FACE-AMT-T[11] == MIR-VIR-HIDDEN-CVG-FACE-AMT-T[11]
    && MIR-VIR-CVG-FACE-AMT-T[12] == MIR-VIR-HIDDEN-CVG-FACE-AMT-T[12]
    && MIR-VIR-CVG-FACE-AMT-T[13] == MIR-VIR-HIDDEN-CVG-FACE-AMT-T[13]
    && MIR-VIR-CVG-FACE-AMT-T[14] == MIR-VIR-HIDDEN-CVG-FACE-AMT-T[14]
    && MIR-VIR-CVG-FACE-AMT-T[15] == MIR-VIR-HIDDEN-CVG-FACE-AMT-T[15]
 
#R19898 CHANGES ENDS
           
        Output = "BF1367-O";

    ELSE
        Output = "BF1367VIR-O";
#S25516 CHANGES BEGIN
    }
    ELSE
       Output  = "BF1367-O";    
#S25516  CHANGES ENDS

    ButtonBar = "ButtonBarOK";
    STEP OutputS
    {
        USES S-STEP Output;
        STRINGTABLE.IDS_TITLE_BF1367Phase1 -> Title;
    }

#UYS043 CHANGES ENDS
         
    EXIT;
   
#RPU001 CHANGES ENDS HERE   
}