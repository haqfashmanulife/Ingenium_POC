# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF0984-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL11  TMC      Remove Address fields                                     *
#*  MP0016  01NOV05  2nd Bank Tranfer - Added Transfer Day 2                   *  
#*  M245K3  03APR14  Foreign currency indicator is added                       *
#*                                                                             *
#*******************************************************************************

S-STEP BF0984-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-BNK-ID";
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

    INOUT MIR-BNK-BR-ID
    {
        Key;
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
    }

    INOUT MIR-BNK-ID
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    IN MIR-BNK-AGRE-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "VIP Group Indicator";
        Index = "1";
    }

    IN MIR-BNK-BR-ID-T[12]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Branch Number";
        Index = "1";
    }

    IN MIR-BNK-BR-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "BNK-BR-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    IN MIR-BNK-FIRM-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Firm Banking Indicator";
        Index = "1";
    }

    IN MIR-BNK-ID-T[12]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Bank Number";
        Index = "1";
    }

    IN MIR-BNK-NM-T[12]
    {
        DisplayOnly;
        Length = "36";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Bank Name";
        Index = "1";
    }

    IN MIR-BNK-XFER-DY-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Transfer Day";
        Index = "1";
    }

    IN MIR-BNK-XFER-IND-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Transfer Indicator";
        Index = "1";
    }

    IN MIR-BNK-XFER-2-DY-T[12]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Transfer Day 2";
        Index = "1";
    }
#*M245K3 CHANGES START  
#*Label name "Foreign Currency Remittance Indicator (SWIFT Code Y/N)" is Added 
 
    IN MIR-FRGN-CRCY-REMIT-IND-T[12] 
    { 
        DisplayOnly;
	Length = "1";
	FieldGroup = "Table12";
        SType = "Indicator";
        Label = "Foreign Currency Remittance Indicator (SWIFT Code Y/N)";
        Index = "1";
    }
#*M245K3 CHANGES END    

}

