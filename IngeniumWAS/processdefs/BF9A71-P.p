# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A71-P.p                                                    *
#*  Description: Death Claim Note Create step                                  *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCACN  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A71-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A71";
        BusinessFunctionName = "Death Claim Note Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9A70";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    INOUT MIR-CLM-NOTE-SEQ-NUM
    {
        Key;
        Mandatory;  
        Length = "4";
        DBTableName = "TFTXT";        
        SType = "Number";
        Label = "Sequence Number";
    }

}
