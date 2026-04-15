# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:33 PM EDT

#*******************************************************************************
#*  Component:   BF1062-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFFFU4  ACR      ADD MIR-CLI-FIN-ASSET-CD, remove CLI-NET-WRTH-AMT         *
#*                   ADD MIR-BUS-FCN-SUB-ID                                    *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  26878B   CTS      CHANGES DONE FOR ADDITION OF NEW FIELD                   *
#*                    AS PART OF ELDERLY PHASE 2                               *
#*******************************************************************************

P-STEP BF1062-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1062";
        BusinessFunctionName = "Client Income Information Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM6130";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-BUS-FCN-SUB-ID
    {
        Length = "6";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Function Code";
    }

    INOUT MIR-CLI-EARN-INCM-AMT
    {
        Length = "13";
#M245B2 CHANGES START HERE         
#        Decimals = "0";
#M245B2 CHANGES END HERE 
        DBTableName = "TCLII";
        SType = "Currency";
        Label = "Earned Income";
    }

#    INOUT MIR-CLI-NET-WRTH-AMT
#    {
#        Length = "15";
#        Decimals = "0";
#        DBTableName = "TCLII";
#        SType = "Currency";
#        Label = "Net Worth";
#    }

    INOUT MIR-CLI-OTHR-INCM-AMT
    {
        Length = "13";
#M245B2 CHANGES START HERE         
#        Decimals = "0";
#M245B2 CHANGES END HERE 
        DBTableName = "TCLII";
        SType = "Currency";
        Label = "Other Income";
    }

    INOUT MIR-EARN-INCM-MODE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EARN-INCM-MODE-CD";
        DBTableName = "TCLII";
        SType = "Selection";
        Label = "Earned Income Mode";
    }

    INOUT MIR-OTHR-INCM-MODE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OTHR-INCM-MODE-CD";
        DBTableName = "TCLII";
        SType = "Selection";
        Label = "Other Income Mode";
    }

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-INCM-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLII";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date";
    }

    INOUT MIR-CLI-FIN-ASSET-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "FASST";
        DBTableName = "TCLII";
        SType = "Selection";
#26878B CHANGES START HERE	
#       Label = "Total Financial Assets";
        Label = "Total Financial Assets Code";
#26878B CHANGES END HERE
    }
#M245B2 CHANGES START HERE      
    INOUT MIR-POL-CRCY-CD
       {
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
   }
#M245B2 CHANGES END HERE     
#26878B CHANGES START HERE
    INOUT MIR-CLI-FIN-ASSET-AMT
    {
        Length = "13";
        DBTableName = "TCLII";
        SType = "Currency";
        Label = "Total Financial Assets Amount";
    }
#26878B CHANGES END HERE
}


#	OUT MIR-DV-INSRD-CLI-NM
#	{
#		Length = "75";
#		DBTableName = "Derived";
#		SType = "Text": RT;
#		Label = "Insured Name";
#	}

