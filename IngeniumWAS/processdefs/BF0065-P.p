# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  (C) COPYRIGHT 2001 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED *
#*******************************************************************************
#*  Component:   BF0065-P.p                                                    *
#*  Description: WebSphere Sign On Notification - LDAP                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*	    New for release PathFinder 1.3                                     *
#*  CTS     MP161N CHANGES                                                     *
#*                                                                             *
#*******************************************************************************

P-STEP BF0065-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0065";
        BusinessFunctionName = "WebSphere Sign-On Notification";
        BusinessFunctionType = "Login";
        MirName = "XCWM0065";
        UpdateSession;
    }

    IN LSIR-PRCES-CD
    {
        Value = "1";
    }

    OUT LSIR-RETURN-CD;
    OUT MIR-RETRN-CD;

    IN  MIR-USER-ID;
    IN  MIR-SECUR-CLAS-ID;
    IN  MIR-BR-ID;
    IN  MIR-USER-RPT-DSTRB-CD;
#MP161N CHANGES START
    IN  MIR-CONCURRENT-IND;
#MP161N CHANGES END

    OUT  MIR-CO-ID;
    OUT  MIR-USER-SESN-CTRY-CD;           
    OUT  MIR-USER-SESN-CRCY-CD;             
    OUT  MIR-USER-SESN-BTCH-NUM;
    OUT  MIR-USER-SESN-PRCES-DT;
    OUT  MIR-DV-APPL-STAT-CD;
    OUT  MIR-USER-SESN-STAT-CD;
    OUT  MIR-CTRY-DT-FRMT-CD;
    OUT  MIR-CTRY-DT-SPRT-CD;
    OUT  MIR-CTRY-LEAD-ZERO-IND;
    OUT  MIR-CRCY-SYMBL-CD;
    OUT  MIR-CRCY-THOU-SPRT-CD;
    OUT  MIR-CRCY-DCML-SPRT-CD;
    OUT  MIR-CRCY-NEG-PLACE-CD;
    OUT  MIR-CRCY-PLACE-CD;
    OUT  MIR-CRCY-SCALE-QTY;
    OUT  MIR-DV-ISO-DT-FRMT-IND;

}




