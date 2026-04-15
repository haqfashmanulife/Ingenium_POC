# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:10 PM EDT

#*******************************************************************************
#*  Component:   BF9830Retrieve.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  Q29539  MP211B - LIEN RATE INQUIRY                                         *
#*******************************************************************************
INCLUDE "BF9799-O.s";
INCLUDE "BF1210-P.p";
INCLUDE "BF1214-P.p";

PROCESS BF9799LienRateInq
{
    Title = STRINGTABLE.IDS_TITLE_BF9799LienRateInq;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOK";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

# Display the Lien Rate Inquiry Screen 

    STEP RetrieveList
    {
        USES P-STEP "BF1214-P";
    }
    
      
    MIR-RTBL-RT-TYP-CD = MIR-RTBL-RT-TYP-CD-T[1];
    MIR-RTBL-ID = MIR-RTBL-ID-T[1];
    MIR-DPOS-TRM-MO-DUR = "000";
    MIR-DPOS-TRM-DY-DUR = "000";
    MIR-RTBL-IDT-NUM = MIR-RTBL-IDT-NUM-T[1];
    MIR-RTBL-AGE-DUR = "000";
    MIR-DV-END-RTBL-AGE-DUR = "999";
#Q29539 CHANGES STARTS     
    MIR-RTBL-AGE = MIR-RTBL-AGE-T[1];
    MIR-RTBL-PAR-CD = MIR-RTBL-PAR-CD-T[1];
    MIR-RTBL-PNSN-QUALF-CD = MIR-RTBL-PNSN-QUALF-CD-T[1];
    MIR-RTBL-SEX-CD = MIR-RTBL-SEX-CD-T[1];
    MIR-RTBL-SMKR-CD = MIR-RTBL-SMKR-CD-T[1];
    MIR-RTBL-STBL-1-CD = MIR-RTBL-STBL-1-CD-T[1];
    MIR-RTBL-STBL-2-CD = MIR-RTBL-STBL-2-CD-T[1];
    MIR-RTBL-STBL-3-CD = MIR-RTBL-STBL-3-CD-T[1];
    MIR-RTBL-STBL-4-CD = MIR-RTBL-STBL-4-CD-T[1];    
#Q29539 CHANGES ENDS  
    STEP Getinfo
    {
        USES  P-STEP "BF1210-P";
    }

    STEP Outputinfo
    {
        USES S-STEP "BF9799-O";
    }

    MESSAGES-T[0] = "";

        
    }

    