# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:04 PM EDT

#*******************************************************************************
#*  Component:   BF1191Create.f                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*                                                                             *
#*  Chg#    Date     Auth.  Description                                        *
#*                                                                             *
#*  EN1327  27Feb07  CLB    Add new fields for category code and comment.      *
#*  BU3283  26NOV08  CTS    MIR-CPREQ-EFF-DT is replaced by MIR-PREV-UPDT-DT   *
#*******************************************************************************

INCLUDE "BF1191-I.s";
INCLUDE "BF1190-O.s";
INCLUDE "BF1192-P.p";

PROCESS BF1191Create
{
    Title = STRINGTABLE.IDS_TITLE_BF1191Create;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "ButtonBarOKCancel";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";

    IF DisplayInput == "FALSE"
        BRANCH BF1191-I;



    # Set One of the Radio Buttons As Default
    # Underwriting Requirements = 1
    # Issue Requirements = 2

    ReqtType = 1;

    STEP BF1191-I
    {
        USES S-STEP "BF1191-I";
    }

    IF action == "ACTION_BACK"
        EXIT;

    # Reload the page when Category/Requirement code is selected
    IF action == "ACTION_REFRESH"
    {
        MIR-REQIR-COMNT-INFO-TXT = "";
        BRANCH BF1191-I;
    }

    STEP BF1192-P
    {
        USES P-STEP "BF1192-P";
    }

    IF LSIR-RETURN-CD != "00"
        BRANCH BF1191-I;


    STEP BF1190-O
    {
        USES S-STEP "BF1190-O";
    }

    IF action == "ACTION_BACK"
        EXIT;


    STEP BF1191-I-2
    {
        USES S-STEP "BF1191-I";
        " " -> MIR-REQIR-ID;
        " " -> MIR-REQIR-CAT-CD;
        LSIR-PRCES-DT -> MIR-CPREQ-CREAT-DT;
        " " -> MIR-CPREQ-STAT-CD;
        " " -> MIR-CPREQ-TST-RSLT-CD;
        " " -> MIR-CPREQ-DESGNT-ID;
        LSIR-USER-ID -> MIR-USER-ID;
        " " -> MIR-CPREQ-PD-IND;
#BU3283 CHANGES START        
#        LSIR-PRCES-DT -> MIR-CPREQ-EFF-DT;
         LSIR-PRCES-DT -> MIR-PREV-UPDT-DT;
#BU3283 CHANGES END         
        " " -> MIR-CPREQ-VALID-DT;
        " " -> MIR-CPREQ-TST-DT;
        " " -> MIR-CPREQ-FOLWUP-DT;
        " " -> MIR-CPREQ-FOLWUP-NUM;
        " " -> MIR-REQIR-COMNT-INFO-TXT;
    }

    IF action == "ACTION_BACK"
        EXIT;

    BRANCH BF1192-P;
}

