# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9A70-P.p                                                    *
#*  Description: Death Claim Note (FTXT) Retrieve step                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCACN  CTS      Intial Version                                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF9A70-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A70";
        BusinessFunctionName = "Claim Note Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9A70";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Death Master Claim ID";
    }

    INOUT MIR-CLM-NOTE-SEQ-NUM
    {
        Key;
        Mandatory;  
        Length = "4";
        DBTableName = "TFTXT";        
        SType = "Number";
        Label = "Sequence Number";
    }

    OUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Insured Client ID";
    }

    OUT MIR-INSRD-CLI-NM
    {
        Length = "51";
        DBTableName = "TCLNM";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";       
        SType = "Date";
        Label = "Birth Date";
    }
    
    OUT MIR-CLI-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    
    OUT MIR-CLM-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }
    
    OUT MIR-CLM-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim Status";
    }
    
    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TFTXT";
        SType = "Date";
        Label = "Previous Update Date";
    }
    
    OUT MIR-PREV-UPDT-USER-ID
    {
        Length = "8";
        DBTableName = "TFTXT";
        SType = "Text";
        Label = "Previous Update User ID";
    } 
    
    OUT MIR-CLM-NOTE-TXT
    {
        Length = "500";
        DBTableName = "TFTXT";        
        SType = "Text";
        Label = "Claim Note";
    }     
}
