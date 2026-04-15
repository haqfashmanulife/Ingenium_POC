# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:14 PM EDT

#*******************************************************************************
#*  Component:   SignOnStart.s                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP SignOnStart
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-USER-ID";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    OUT action
    {
        SType = "Hidden";
    }


    #*****************************************************
    #  Field Definitions
    #*****************************************************

    INOUT MIR-CO-ID;

    INOUT MIR-USER-ID;

    INOUT MIR-USER-PSWD-TXT;

    OUT LSIR-MSG-SECUR-CLAS-CD;

    OUT LSIR-SECUR-CNFD-ACCS-CD;

    OUT LSIR-SECUR-CLAS-ID;

    OUT LSIR-BR-ID;

    OUT LSIR-USER-RPT-DSTRB-CD;

    OUT LSIR-USER-LANG-CD;

    OUT LSIR-BPF-SECUR-AUD-IND;

    OUT LSIR-SYS-TIME;

    OUT LSIR-SYS-DT-EXT;

    OUT LSIR-USER-SESN-ID;

    OUT LSIR-SECUR-LVL-CD;

    OUT LSIR-CO-ID;

    OUT LSIR-USER-ID;

    OUT LSIR-EDIT-LANG-CD;

    OUT LSIR-PRCES-DT;

    OUT LSIR-PRCES-DT-INT;

    OUT LSIR-PRCES-ID;

    OUT LSIR-BPF-ID;

    OUT LSIR-DT-FRMT-CD;

    OUT LSIR-DT-SPRT-CD;

    OUT LSIR-LEAD-ZERO-IND;

    OUT LSIR-MOS-ABBR-TXT;

    OUT LSIR-CRCY-SYMBL-CD;

    OUT LSIR-THOU-SPRT-CD;

    OUT LSIR-DCML-SPRT-CD;

    OUT LSIR-CRCY-NEG-PLACE-CD;

    OUT LSIR-CRCY-PLACE-CD;

    OUT LSIR-USER-SESN-CRCY-CD;

    OUT LSIR-USER-SESN-CTRY-CD;

    OUT LSIR-TASK-ID;

}

