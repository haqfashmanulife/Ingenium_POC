# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF0980-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL11  TMC      Remove Address fields and added 3 indicators and xfer day *
#*  MP0016  01NOV05  2nd Bank Transfer - Added Transfer Day 2                  *    
#*  M245K3  03APR14  Foreign currency indicator is added                       *
#*                                                                             *
#*******************************************************************************

P-STEP BF0980-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0980";
        BusinessFunctionName = "Bank Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM5000";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-BNK-BR-ID
    {
        Key;
        Mandatory;
        Length = "5";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Number";
    }

    OUT MIR-BNK-AGRE-IND
    {
        Length = "1";
        DBTableName = "TBNKB";
        SType = "Indicator";
        Label = "VIP Group Indicator";
    }

    OUT MIR-BNK-BR-LANG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Language";
    }

    OUT MIR-BNK-BR-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
    }

    OUT MIR-BNK-BR-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BNK-BR-STAT-CD";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Status";
    }

    OUT MIR-BNK-FIRM-IND
    {
        Length = "1";
        DBTableName = "TBNKB";
        SType = "Indicator";
        Label = "Firm Banking Indicator";
    }

    OUT MIR-BNK-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }

    OUT MIR-BNK-XFER-DY
    {
        Length = "2";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Transfer Day";
    }

    OUT MIR-BNK-XFER-IND
    {
        Length = "1";
        DBTableName = "TBNKB";
        SType = "Indicator";
        Label = "Transfer Indicator";
    }

    OUT MIR-BNK-XFER-2-DY
    {
        Length = "2";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Transfer Day 2";
    }
#*M245K3 CHANGES START 
#*Label name "Foreign Currency Remittance Indicator (SWIFT Code Y/N)" is Added

    OUT MIR-FRGN-CRCY-REMIT-IND 
    {
        Length = "1";
        DBTableName = "TBNKB";
        SType = "Indicator";
        Label = "Foreign Currency Remittance Indicator (SWIFT Code Y/N)";
    }
#*M245K3 CHANGES END

 }
