# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0982-I.s                                                    *
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

S-STEP BF0982-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-BNK-NM";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-BNK-AGRE-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "VIP Group Indicator";
    }

    INOUT MIR-BNK-BR-LANG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Selection";
        Label = "Language";
    }

    INOUT MIR-BNK-BR-NM
    {
        Mandatory;
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }

    INOUT MIR-BNK-BR-STAT-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BNK-BR-STAT-CD";
        SType = "Selection";
        Label = "Status";
    }

    INOUT MIR-BNK-FIRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Firm Banking Indicator";
    }

    INOUT MIR-BNK-NM
    {
        Mandatory;
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    }

    INOUT MIR-BNK-XFER-DY
    {
        Length = "2";
        SType = "Text";
        Label = "Transfer Day";
    }

    INOUT MIR-BNK-XFER-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Transfer Indicator";
    }

    INOUT MIR-BNK-XFER-2-DY
    {
        Length = "2";
        SType = "Text";
        Label = "Transfer Day 2";
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
#*M245K3 CHANGES START  
#*Label name "Foreign Currency Remittance Indicator (SWIFT Code Y/N)" is Added    
    INOUT MIR-FRGN-CRCY-REMIT-IND 
    {
        Length = "1";
        SType = "Indicator";
        Label = "Foreign Currency Remittance Indicator (SWIFT Code Y/N)";
    }
#*M245K3 CHANGES END    

}

