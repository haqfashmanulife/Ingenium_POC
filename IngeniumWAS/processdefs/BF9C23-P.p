#*******************************************************************************
#*  Component:   BF9C23-P.p                                                    *
#*  Description: TD Reinstatement Information table(REIN) Delete step          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9C23-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C23";
        BusinessFunctionName = "TD Reinstatement Information Table Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9C20";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TREIN";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TREIN";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TREIN";
        DefaultSession = "MIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }
    
    IN MIR-INSRD-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TREIN";
        SType = "Text";
    }    


}
