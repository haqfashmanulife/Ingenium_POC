# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT
#*******************************************************************************
#*  (C) COPYRIGHT 2003 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED *
#*******************************************************************************
#*  Component:   SignOnHeadless.f                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0064-P.p";
INCLUDE "BF0061-P.p";

PROCESS SignOnHeadless
{
    ATTRIBUTES
    {
        SkipProlog;
    }

    VARIABLES
    {
        IN MIR-CO-ID;
        IN MIR-USER-ID;
        IN MIR-USER-PSWD-TXT;
        OUT LSIR-RETURN-CD;
    }

    #*****************************************************************
    # Sign On - provide userid, password and company code
    #*****************************************************************

    # process code for sign on is different from other processes
    # this process code bypasses all normal security checking.  Since
    # the user has not yet signed on to INGENIUM, we cannot perform
    # these checks.

    LSIR-PRCES-CD = "1";

    STEP LoginProcess
    {
        USES P-STEP "BF0064-P";
    }

    # check to see if the sign on process failed(userid, password, or
    # company code error).

    IF LSIR-RETURN-CD != "00"
    {
        EXIT;
    }

    # check to see if the user's password has expired.

    IF MIR-DV-PSWD-XPRD-IND == "Y"
    {
  # set the return code to LSIR-SECURITY-CHECK-FAILED

        LSIR-RETURN-CD = "09";
        EXIT;
    }

}

