# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT
#*******************************************************************************
#*  (C) COPYRIGHT 2003 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED *
#*******************************************************************************
#*  Component:   SignOffHeadless.f                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF0062-P.p";

PROCESS SignOffHeadless
{
    ATTRIBUTES
    {
        SkipEpilog;
    }

    STEP SignOff
    {
        USES P-STEP "BF0062-P";
    }

    IF LSIR-RETURN-CD == "00"
        EXIT;
}

