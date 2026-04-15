# Converted from PathFinder 2.2 to 3.0 May 28, 2008 3:13:37 PM EDT

#*******************************************************************************
#*  Component:   BF9557-P.p                                                    *
#*  Description: Issue Rversal                                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Author Description                                        *
#*                                                                             *
#*  FEID11  28MAY08  CTS  CHANGES FOR ISSUE REVERSA SYSTEM                     *
#*                                                                             *
#*******************************************************************************

P-STEP BF9557-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9557";
        BusinessFunctionName = "Policy Issue Reversal";
        BusinessFunctionType = "Reversal";
        MirName = "NCWM9557";
    }

    OUT LSIR-RETURN-CD;
    
    OUT MIR-RETRN-CD;
                
    OUT MIR-POL-ISS-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-ISS-DT-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Policy Issue Date Type";
    }
        
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    } 
    
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }
    
    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
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
    
    OUT MIR-CLI-SUR-NM-T[20]
    {
        Length = "25";
        FieldGroup = "Table20";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Last Name";
        Index = "1";
    }
    
    OUT MIR-CLI-UWGDECN-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Underwriting Decision";
        Index = "1";
    }
    
    OUT MIR-CLI-UWGDECN-TYP-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Decision Type";
        Index = "1";
    }
    
    OUT MIR-CVG-CSTAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }
    
    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
    
    OUT MIR-CVG-UWGDECN-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Decision";
        Index = "1";
    }
    
    OUT MIR-CVG-UWGDECN-SUB-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "CODEC";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }
    
    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }
    
    OUT MIR-INSRD-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        KeyColumn;
        DBTableName = "TCVGC";
        SType = "Text";
        Label = "Client Number of Lives Insured";
        Index = "1";
    }
    
    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    
    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Subsidiary Company ID";
    }
        
           
 }
    


