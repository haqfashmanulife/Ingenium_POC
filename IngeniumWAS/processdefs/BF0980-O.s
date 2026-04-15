# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0980-O.s                                                    *
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

S-STEP BF0980-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-BNK-BR-ID
    {
        Key;
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    IN MIR-BNK-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-BNK-AGRE-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "VIP Group Indicator";
    }

    IN MIR-BNK-BR-LANG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Language";
    }

    IN MIR-BNK-BR-NM
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }

    IN MIR-BNK-BR-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BNK-BR-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-BNK-FIRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Firm Banking Indicator";
    }

    IN MIR-BNK-NM
    {
        DisplayOnly;
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    }

    IN MIR-BNK-XFER-DY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Transfer Day";
    }

    IN MIR-BNK-XFER-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Transfer Indicator";
    }

    IN MIR-BNK-XFER-2-DY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Transfer Day 2";
    }
#*M245K3 CHANGES START  
#*Label name "Foreign Currency Remittance Indicator (SWIFT Code Y/N)" is Added 
 
    IN MIR-FRGN-CRCY-REMIT-IND 
    { 
        Length = "1"; 
        DBTableName = "TBNKB"; 
        SType = "Indicator"; 
        Label = "Foreign Currency Remittance Indicator (SWIFT Code Y/N)"; 
    }
#*M245K3 CHANGES END
}

