# Converted from PathFinder 2.2 to 3.0 MAR 28, 2022 3:12:39 PM EDT

#*******************************************************************************
#*  Component:   BF9362QuotePrintPolicy-O.s                                    *
#*  Description: CSV CERTIFICATE/QUOTE CREATE - POLICY PRINT SELECTION         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS304  01JUN24  INTIAL VERSION                                            *
#*******************************************************************************

S-STEP BF9362QuotePrintPolicy-O
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

    OUT index
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
#MOR345 CHANGES STARTS HERE
#        Label = "Certificate/Quote Type";
        Label = "Certificate/Quote Select";
    } 
#MOR254 CHANGES STARTS HERE
    IN MIR-CREAT-DT
    {
       Length = "10";
       SType = "Date";
       Label = "Creation Date";
    } 
#MOR254 CHANGES STARTS HERE		

    INOUT MIR-SELECT-T1[25]
    {       
        FieldGroup = "Table25";
        DBTableName = "Derived";
        Index = "1";
        Label = "Creation Target checkbox indicator";
        Length = "1";
        SType = "checkbox";
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

    INOUT MIR-PRCES-DT-T[25]
    {
       DisplayOnly;
       Length = "10";
       SType = "Date";
       FieldGroup = "Table25";
       Label = "Process Date";
       Index = "1";
    }
}
