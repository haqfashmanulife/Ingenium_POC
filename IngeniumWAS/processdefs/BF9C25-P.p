#*******************************************************************************
#*  Component:   BF9C25-P.p                                                    *
#*  Description: TD Reinstatement Information table(REIN) Print step           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLLR2  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9C25-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C25";
        BusinessFunctionName = "TD Reinstatement Information print";
        BusinessFunctionType = "Print";
        MirName = "CCWM9C20";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TREIN";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TREIN";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TREIN";
        DefaultSession = "MIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }
    
    INOUT MIR-INSRD-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TREIN";
        SType = "Text";
    }    


}
