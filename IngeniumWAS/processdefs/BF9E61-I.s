# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF9E61-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  15997A  CTS      CHANGES FOR FRA PREMIUM REDUCTION SIMULATION SCREEN       *
#*  15997D  CTS      CR03 CHANGES FOR FRA PREMIUM REDUCTION SIMULATION SCREEN  *
#*******************************************************************************

S-STEP BF9E61-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";
        Type = "Input";

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

    IN MIR-POL-ID-BASE
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-SIMULTN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Simulation Date";
    }
    IN MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    IN MIR-SEQ-NO-T[7]
    {
        Length = "1";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "#";
        Index = "1";        
    }


    INOUT MIR-TRNXT-YR-MO-T[7]
    {
        Length = "7";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Transaction Year & Month";
        Index = "1";        
    }

    INOUT MIR-TRNXT-TYP-CD-T[7]
    {
        Length = "40";
        DBTableName = "TPOL";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "POL-TRNXT-TYP-CD";        
        SType = "Selection";
        Label = "Transaction Type";
        Index = "1";        
    }

    INOUT MIR-PREM-TRNXT-AMT-T[7]
    {
        Key;
        Length = "14";
        FieldGroup = "Table1";       
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Premium After Transaction";
        Index = "1";        
    }

    IN MIR-SC1-CRNT-RT
    {
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Same As Current Rate";
    }

    IN MIR-SC2-MIN-GUAR-RT
    {
        Length = "5";
        Decimals = "2";
        SType = "Percent";
        Label = "Minimum Guaranteed Rate";
    }

    INOUT MIR-SC3-OPTL-ENTR-RT
    {
        Length = "5";
        SType = "Text";
        Label = "Optional Entry Rate";
    }

    INOUT MIR-SC4-OPTL-ENTR-RT
    {
        Length = "5";
        SType = "Text";
        Label = "Optional Entry Rate";
    }
    
    INOUT MIR-NO-OF-EXT-YR
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "# of Extension years";
    }

    INOUT MIR-SEND-MTHD-CD
    {
        Length = "40";
        DBTableName = "TPOL";
        CodeSource = "DataModel";
        CodeType = "SEND-MTHD-CD";       
        SType = "Selection";
        Label = "Send Method";
    }

    INOUT MIR-SEND-TO-LAST-NM
    {
        Length = "25";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To Last Name";
    }

    IN MIR-SEND-TO-FIRST-NM
    {
        Length = "25";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To First Name";
    }

#15997D CHANGES STARTS HERE
    IN MIR-SEND-TO-CO-NM
    {
        Length = "50";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To Company Name";
    }
#15997D CHANGES ENDS HERE

    INOUT MIR-SEND-TO-PSTL-CD
    {
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To Postal Code";
    }
    INOUT MIR-SEND-TO-ADDR-TXT     
    {
        MixedCase;
#15997D CHANGES STARTS HERE        
#       Length = "71";
        Length = "60";
#15997D CHANGES ENDS HERE        
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To Address";
    }
    INOUT MIR-SEND-TO-ADDR-ADDL-TXT
    {
        MixedCase;
        Length = "72";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Send To Address(Samakata-bu)";
    }
    INOUT MIR-STRT-YR-MO
    {   
        Length = "7";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Start Year & Month";

    }
    INOUT MIR-END-YR-MO
    {   
        Length = "7";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "End Year & Month";
    
    }

}

