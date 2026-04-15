# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9241-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HCL103D HIN/CL   PRINT CONTACT CLIENT LABEL                                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9241-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9241";
        BusinessFunctionName = "Print Contact Client Label";
        BusinessFunctionType = "List";
        MirName = "CCWM9241";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TCLRL";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Claim Number";
    }

    OUT MIR-DV-ADDR-LN-1-TXT
    {
	Length = "54";
        DBTableName = "DERIVED";
        SType = "Text";
        Label = "Address Line 1";
    }

    OUT MIR-DV-ADDR-LN-2-TXT
    {
        Length = "54";
        DBTableName = "DERIVED";
        SType = "Text";
        Label = "Address Line 2";
    }

    OUT MIR-DV-ADDR-LN-3-TXT
    {
        Length = "54";
        DBTableName = "DERIVED";
        SType = "Text";
        Label = "Address Line 3";
    }

    OUT MIR-DV-CNTCT-CLI-NM
    {
        Length = "56";
        DBTableName = "DERIVED";
        SType = "Text";
        Label = "Contact Client Name";
    }
}

