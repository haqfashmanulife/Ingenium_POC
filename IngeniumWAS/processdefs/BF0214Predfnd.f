# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:03 PM EDT

#*******************************************************************************
#*  Component:   BF0214Predfnd.f                                               *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0214-I.s";
INCLUDE "BF0214-P.p";

PROCESS BF0214Predfnd
{
    Title = STRINGTABLE.IDS_TITLE_BF0214Predfnd;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    STEP BF0214-I
    {
        USES S-STEP "BF0214-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

#UY3004 CHANGES START

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
        BRANCH BF0214-I;
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

#UY3004 CHANGES END

    STEP BF0214-P
    {
        USES P-STEP "BF0214-P";
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[10];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[11];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[12];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[13];
        "N" -> MIR-DV-CNTRCT-RQST-IND-T[14];
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF0214-I;


    STEP BF0214-I2
    {
        USES S-STEP "BF0214-I";
        " " -> MIR-POL-ID-SFX;
        " " -> MIR-TRNXT-DOC-CPY-QTY;
        " " -> MIR-POL-ID-BASE;
        " " -> MIR-TRNXT-LANG-CD;
        " " -> MIR-TRNXT-RQST-END-DT;
        " " -> MIR-TRNXT-RQST-STRT-DT;
        " " -> MIR-TRNXT-RPT-DSTRB-CD;
    }

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH BF0214-P;
}

