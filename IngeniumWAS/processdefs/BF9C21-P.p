#*******************************************************************************
#*  Component:   BF9C21-P.p                                                    *
#*  Description: TD Reinstatement Information  (REIN) Create step              *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  NWLGLR  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9C21-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C21";
        BusinessFunctionName = "TD Reinstatemnt Information Create";
        BusinessFunctionType = "Create";
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
        Length = "10";
        DBTableName = "TREIN";
        DefaultSession = "MIR-PRCES-DT";
        SType = "Date";
        Label = "Processing Date";
    }

}
