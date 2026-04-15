#*******************************************************************************
#*  Component:   BF9362QuotePrint-O.s                                          *
#*  Description: CSV CERTIFICATE/QUOTE CREATE - PRINT SCREEN                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS304  01NOV23  Intial Version                                            *
#*******************************************************************************

S-STEP BF9362QuotePrint-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Quotecsv";
        Type = "Output";
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

    IN MIR-DV-OWN-CLI-NM
    {
       Length = "100";
       SType = "Text";
       Label = "Owner Name (Kanji)";
    }

    IN MIR-CLI-ADDR-TITL
    {
       Length = "10";
       SType = "Text";
       Label = "Address Title";
    }

    IN MIR-CLI-PSTL-CD
    {
       Length = "9";
       DBTableName = "TCLIA";
       SType = "Text";
       Label = "Postal Code";
       Index = "1";
    }
    
    IN MIR-CLI-PREFCT-TXT
    {
       Length = "11";
       SType = "Text";
       Label = "Prefecture";
    }
         
    IN MIR-CLI-CITY-NM-TXT
    {
       Length = "30";
       SType = "Text";
       Label = "City";
    }
         
    IN MIR-CLI-ADDR-LN-1-TXT
    {
       Label = "Address";
       Length = "30";
       SType = "Text";
    }
        
    IN MIR-CLI-ADDR-ADDL-TXT
    {
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

    IN MIR-CSV-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CERT-QUOT-TYP-CD";
#MOR341 CHANGES STARS HERE
#        Label = "Certificate/Quote Type";
        Label = "Certificate/Quote Select";
#MOR341 CHANGES ENDS HERE
    } 
#MOR254 CHANGES STARTS HERE
    IN MIR-CREAT-DT
    {
       Length = "10";
       SType = "Date";
       Label = "Creation Date";
    }
#MOR254 CHANGES STARTS HERE	

    IN MIR-SEQ-NUM-T[25]
    {
       DisplayOnly;
       Length = "03";
       FieldGroup = "Table25";
       SType = "Text";
       Label = "No";
       Index = "1";
    }
               
    IN MIR-POL-ISS-EFF-DT-T[25]
    {
       DisplayOnly;
       Length = "10";
       FieldGroup = "Table25";
       SType = "Date";
       Label = "Policy Issue Date";
       Index = "1";
    }
        
    IN MIR-PROD-APP-TYP-CD-T[25]
    {
       DisplayOnly;
       Length = "2";
       FieldGroup = "Table25";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Prod Typ";
       Index = "1";
    }
        
    IN MIR-LRG-PROD-CD-T[25]
    {
       DisplayOnly;
       Length = "3";
       FieldGroup = "Table25";
       SType = "Text";
#MOR343 STARTS HERE
#       Label = "Type";
       Label = "Plan Code";
#MOR343 ENSS HERE
       Index = "1";
    }

    IN MIR-POL-ID-T[25]
    {
       DisplayOnly;
       Length = "9";
       FieldGroup = "Table25";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Policy ID";
       Index = "1";
    }
        
    IN MIR-DV-INSRD-CLI-NM-T[25]
    {
       DisplayOnly;
       Length = "50";
       FieldGroup = "Table25";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Insured Name";
       Index = "1";
    }
          
    IN MIR-POL-CSTAT-CD-T[25]
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

    IN MIR-QUOT-TS-T[25]
    {
       DisplayOnly;
       Length = "17";
       FieldGroup = "Table25";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Quote Date Time";
       Index = "1";
    }
          
    IN MIR-CREAT-TS-T[25]
    {
       DisplayOnly;
       Length = "17";
       FieldGroup = "Table25";
       DBTableName = "TPOL";
       SType = "Text";
       Label = "Create Date Time";
       Index = "1";
    }

    IN MIR-PRCES-DT-T[25]
    {
       DisplayOnly;
       Length = "10";
       SType = "Date";
       FieldGroup = "Table25";
       Label = "Process Date";
       Index = "1";
    }
}
