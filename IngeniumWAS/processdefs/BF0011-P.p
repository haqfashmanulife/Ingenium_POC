# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:15 PM EDT

#*******************************************************************************
#*  Component:   BF0011-P.p                                                    *

# Single P-Step Security Check Information.

P-STEP BF0011-P
{
    ATTRIBUTES
    {
		BusinessFunctionId = "0011";
        MirName = "XCWM0011";
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

    # The password.
    IN MIR-USER-PSWD-TXT;
}

