# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9D74-P.p                                                    *
#*  Description: Rider Surrender/Rider FA Reduction List                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  UYS014   CTS     INITIAL VERSION                                           *
#*******************************************************************************
P-STEP BF9D74-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9D74";
        BusinessFunctionName = "Rider Surrender/Rider FA Reduction List";
        BusinessFunctionType = "List";
        MirName = "CCWM9D74";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN  MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN  MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    INOUT   MIR-NEW-FACE-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "New Amount";
        Index = "1";
    }    
    INOUT MIR-CRNT-INCR-FACE-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "Current Increased Face Amount";
        Index = "1";
    }
    OUT MIR-NEW-INCR-FACE-AMT-T[90]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        SType = "Currency";
        Label = "New Increased Face Amount";
        Index = "1";
    }
}