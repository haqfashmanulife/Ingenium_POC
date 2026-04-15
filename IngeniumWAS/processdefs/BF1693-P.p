# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1693-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1693-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1693";
        BusinessFunctionName = "Unmatched Client Lab Tests Delete";
        BusinessFunctionType = "Delete";
        MirName = "NCWM1690";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-LTST-SEQ-NUM
    {
        Mandatory;
        Length = "3";
        DBTableName = "TLABU";
        SType = "Hidden";
        Label = "Sequence";
    }

    INOUT MIR-CLI-LTST-SUR-NM
    {
        Key;
        Mandatory;
        Length = "25";
        DBTableName = "TLABU";
        SType = "Text";
        Label = "Last Name";
    }

}

