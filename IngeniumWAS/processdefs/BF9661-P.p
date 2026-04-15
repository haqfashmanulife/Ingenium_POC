# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9661-P.p                                                    *
#*  Description: Benefit Support Table (BENS) Create step                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HPR102  HIN/CL   BENEFIT SUPPORT                                           *
#*  RP211d  RP2      ADDED SUBTABLE 4 CODE                                     *
#*                                                                             *
#*******************************************************************************

P-STEP BF9661-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9661";
        BusinessFunctionName = "Benefit Support Table Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM9661";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Plan Name";
    }

    IN MIR-BNFT-NM-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Benefit Name";
    }
    
    IN MIR-STBL-2-CD
    {
        Key;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Sub-table 2";
    }

#RP211d - Changes start

    IN MIR-STBL-4-CD
    {
        Key;
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TBENS";
        SType = "Selection";
        Label = "Sub-table 4";
    }

#RP211d - Changes end


}
