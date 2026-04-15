# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF0984-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL11  TMC      Remove Address fields                                     *
#*  MP0016  01NOV05  2nd Bank Tranfer - Added Transfer Day 2                   * 
#*  M245K3  03APR14  Foreign currency indicator is added 
#*                                                                             *
#*******************************************************************************

P-STEP BF0984-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0984";
        BusinessFunctionName = "Bank Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM5000";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-BNK-BR-ID
    {
        Key;
        Length = "5";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Number";
    }

    INOUT MIR-BNK-ID
    {
        Key;
        Length = "4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Number";
    }

    OUT MIR-BNK-AGRE-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TBNKB";
        SType = "Indicator";
        Label = "VIP Group Indicator";
        Index = "1";
    }

    OUT MIR-BNK-BR-ID-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }

    OUT MIR-BNK-BR-STAT-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BNK-BR-STAT-CD";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-BNK-FIRM-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TBNKB";
        SType = "Indicator";
        Label = "Firm Banking Indicator";
        Index = "1";
    }

    OUT MIR-BNK-ID-T[12]
    {
        Length = "4";
        FieldGroup = "Table12";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    OUT MIR-BNK-NM-T[12]
    {
        Length = "36";
        FieldGroup = "Table12";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
        Index = "1";
    }

    OUT MIR-BNK-XFER-DY-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Transfer Day";
        Index = "1";
    }

    OUT MIR-BNK-XFER-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TBNKB";
        SType = "Indicator";
        Label = "Transfer Indicator";
        Index = "1";
    }

    OUT MIR-BNK-XFER-2-DY-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Transfer Day 2";
        Index = "1";
    }
#*M245K3 CHANGES START  
#*Label name "Foreign Currency Remittance Indicator (SWIFT Code Y/N)" is Added 
     
    OUT MIR-FRGN-CRCY-REMIT-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TBNKB";
        SType = "Indicator";
        Label = "Foreign Currency Remittance Indicator (SWIFT Code Y/N)";
        Index = "1";
    }
#*M245K3 CHANGES END    

}

