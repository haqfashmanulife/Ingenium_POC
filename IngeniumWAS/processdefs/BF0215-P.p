# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:17 PM EDT

#*******************************************************************************
#*  Component:   BF0215-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00541  VAN      ADD PRINT CERTICATE CHECKBOX                              *
#*  P01249  AT       ADD AGENT ID                                              *
#*  EN9547  CTS      COMMENTED OUT THE VARIABLE MIR-DV-CNTRCT-RQST-IND-T DUE   *
#*                   TO DUPLICATE DECLARATION                                  *
#*  C12395  CTS      ADDED NEW FIELD  POLICY CERTIFICATE ENDORSEMENT MESSAGE   *
#*  MP176C  CTS      ADDED NEW FIELD BULK APPLICATION ID                       *
#*******************************************************************************

P-STEP BF0215-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0215";
        BusinessFunctionName = "Print Request Other";
        BusinessFunctionType = "Prtothr";
        MirName = "NCWM0210";
    }

    OUT LSIR-USER-MSG-TEXT-T[10]
    {
        Message;
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TPRTX";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-AGT-ID
    {
        Key;
        Length = "6";
        DBTableName = "TPRTX";
        DefaultSession = "MIR-AGT-ID";
        SType = "Text";
        Label = "Agent Id";
    }
     
    IN MIR-DOC-ID
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TPRTX";
        SType = "Selection";
        Label = "Document Name";
    }

# C12395 CHANGES STARTS HERE    

    IN MIR-PCERT-MSG
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "PCERT";
        DBTableName = "TPRTX";
        SType = "Selection";
        Label = "Policy Certificate Endorsement Message";
    }    
# C12395 CHANGES ENDS HERE       
    
#EN9547 CHANGES START HERE
#    IN MIR-DV-CNTRCT-RQST-IND-T[17]
#    {
#        Length = "1";
#        FieldGroup = "Table17";
#        DBTableName = "Derived";
#        SType = "Indicator";
#        Label = "Contract Requests";
#        Index = "1";
#    }
#EN9547 CHANGES END HERE
    IN MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPRTX";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-TRNXT-DOC-CPY-QTY
    {
        Mandatory;
        Length = "2";
        DBTableName = "TPRTX";
        SType = "Text";
        Label = "Number of Copies";
    }

    IN MIR-TRNXT-LANG-CD
    {
        Key;
        Mandatory;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TPRTX";
        SType = "Selection";
        Label = "Language";
    }

    IN MIR-TRNXT-RPT-DSTRB-CD
    {
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        DBTableName = "TPRTX";
        SType = "Selection";
        Label = "Printer";
    }

    IN MIR-DV-CNTRCT-RQST-IND-T[17]
    {
        Length = "1";
        FieldGroup = "Table17";
        CodeSource = "DataModel";
        CodeType = "DV-CNTRCT-RQST-IND";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Contract Requests";
        Index = "1";
    }
# MP176C CHANGES STARTS HERE      
   IN MIR-POL-BULK-APP-ID
   {
           Key;
           Length = "15";
           DBTableName = "TPOL";           
           SType = "Text";
           Label = "Bulk Application Id";
   }
# MP176C CHANGES ENDS HERE  
}

