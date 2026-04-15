#*******************************************************************************
#*  Component:   BF9D43-P.p                                                    *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION DELETE SCREEN               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP251B  CTS     TRAD DEPOSIT HISTORY MODIFICATION DELETE SCREEN            *
#*******************************************************************************

P-STEP BF9D43-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D43";
        BusinessFunctionName = "Trad Deposit Modification Delete";
        BusinessFunctionType = "Delete";
        MirName = "CCWM9D40";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TDH";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TDH";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-TRAD-SO-JRNL-DT
    {
        Length = "10";
        Mandatory;
        DBTableName = "TDH";
        DefaultSession = "MIR-TRAD-SO-JRNL-DT";
        Label = "Trad SO Journal Date";
    }
            
    IN MIR-SEQ-NUM
     {
         Length = "3";
         Mandatory;
         DBTableName = "TDH";
         DefaultSession = "MIR-SEQ-NUM";         
         Label = "Sequence Number";
     }
     
 }
