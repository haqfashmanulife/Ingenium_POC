# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  (C) COPYRIGHT 2001 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED *
#*******************************************************************************
#*  Component:   BF0067-P.p                                                    *
#*  Description: Expedited sign-on for single p-step processing                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*******************************************************************************

# Single P-Step Security Check Information.

P-STEP BF0067-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0067";
        MirName = "XCWM0067";
    }

    OUT LSIR-RETURN-CD;

    # The INGENIUM function code for the single P-Step interface is 5.
    IN LSIR-PRCES-CD
    {
        Value="5";
    }
  
    # The client application must supply these input fields for each
    # P-Step executed:

    # The company code.
    IN MIR-CO-ID;

    # The INGENIUM user ID.
    IN MIR-USER-ID;

    # The Country Code effective for this transaction.
    IN  MIR-USER-SESN-CTRY-CD;

    # The currency code effective for this transaction.
    IN  MIR-USER-SESN-CRCY-CD;

    # The Ingenium security class.
    IN  MIR-SECUR-CLAS-ID;

    # The user's Branch ID.
    IN  MIR-BR-ID;

    # The user's report distribution code.
    IN  MIR-USER-RPT-DSTRB-CD;
}







