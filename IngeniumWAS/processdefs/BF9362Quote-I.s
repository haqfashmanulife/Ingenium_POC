#*******************************************************************************
#*  Component:   BF9362-I.s                                                    *
#*  Description: CSV CERTIFICATE/QUOTE CREATE - POLICY SELECTION SCREEN        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS304  01NOV23  Intial Version                                            *
#*  MOR432  25JUN24  FIX DONE FOR FIELD ADDRESS TITLE                          *
#*******************************************************************************

S-STEP BF9362Quote-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Quotecsv";
        Type = "Input";
        FocusField = "MIR-PRCES-DT";
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

    INOUT MIR-DV-OWN-CLI-NM
    {
       Mandatory;
       Length = "100";
       SType = "Text";
       Label = "Owner Name (Kanji)";
    }

    INOUT MIR-CLI-ADDR-TITL
    {
#MOR432 STARTS HERE
       Mandatory;
#MOR432 ENDS HERE
       Length = "10";
       SType = "Text";
       Label = "Address Title";
    }

    INOUT MIR-CLI-PSTL-CD
    {
       Mandatory;
       Length = "9";
       DBTableName = "TCLIA";
       SType = "Text";
       Label = "Postal Code";
       Index = "1";
    }
    
    INOUT MIR-CLI-PREFCT-TXT
    {
       Mandatory;
       Length = "11";
       SType = "Text";
       Label = "Prefecture";
    }
         
    INOUT MIR-CLI-CITY-NM-TXT
    {
       Mandatory;
       Length = "30";
       SType = "Text";
       Label = "City";
    }
         
    INOUT MIR-CLI-ADDR-LN-1-TXT
    {
       Mandatory;
       Label = "Address";
       Length = "30";
       SType = "Text";
    }
        
    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Mandatory;
       Length = "90";
       SType = "Text";
       Label = "Samakata-bu";
    }
    
    IN MIR-CLI-ID
    {
       DisplayOnly;
       Length = "10";
       SType = "Text";
       Label = "Client ID";
    }  
        
    IN MIR-CREAT-DT
    {
       Length = "10";
       SType = "Date";
       Label = "Creation Date";
    }

    INOUT MIR-CSV-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CERT-QUOT-TYP-CD";
        SType = "Selection";
        Label = "Certificate/Quote Type";
    } 

    INOUT MIR-PRCES-DT
    {
       Mandatory;
       Length = "10";
       SType = "Date";
       Label = "Process Date";
    } 

    INOUT MIR-VIR-SCREEN-IND
    {
       Length = "1";
       SType = "Indicator";
       Label = "Check in case of implementing virtual quote";
    }

    INOUT MIR-BULK-IND
    {
       Length = "1";
       SType = "Indicator";
       Label = "Bulk";
    }    

    INOUT MIR-NXT-POL-ID
    {
       Length = "10";
       SType = "Text";
       Label = "Next Policy ID";
    }

    INOUT MIR-SEQ-NUM-T[25]
    {
       DisplayOnly;
       Length = "03";
       FieldGroup = "Table25";
       SType = "Text";
       Label = "No";
       Index = "1";
    }
               
    INOUT MIR-POL-ISS-EFF-DT-T[25]
    {
       DisplayOnly;
       Length = "10";
       FieldGroup = "Table25";
       SType = "Date";
       Label = "Policy Issue Date";
       Index = "1";
    }
        
    INOUT MIR-PROD-APP-TYP-CD-T[25]
    {
       DisplayOnly;
       Length = "2";
       FieldGroup = "Table25";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Prod Typ";
       Index = "1";
    }
        
    INOUT MIR-LRG-PROD-CD-T[25]
    {
       DisplayOnly;
       Length = "3";
       FieldGroup = "Table25";
       SType = "Text";
       Label = "Type";
       Index = "1";
    }

    IN MIR-POL-ID-T[25]
    {
       DisplayOnly;
       Length = "10";
       FieldGroup = "Table25";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy ID";
       Index = "1";
    }
        
    INOUT MIR-DV-INSRD-CLI-NM-T[25]
    {
       DisplayOnly;
       Length = "50";
       FieldGroup = "Table25";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Insured Name";
       Index = "1";
    }
          
    INOUT MIR-POL-CSTAT-CD-T[25]
    {
       DisplayOnly;
       Length = "40";
       FieldGroup = "Table25";
       CodeSource = "DataModel";
       CodeType = "POL-CSTAT-CD";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy Status";
       Index = "1";
    }

    INOUT MIR-QUOT-TS-T[25]
    {
       DisplayOnly;
       Length = "17";
       FieldGroup = "Table25";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Quote Date Time";
       Index = "1";
    }
          
    INOUT MIR-CREAT-TS-T[25]
    {
       DisplayOnly;
       Length = "17";
       FieldGroup = "Table25";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Create Date Time";
       Index = "1";
    }
}
