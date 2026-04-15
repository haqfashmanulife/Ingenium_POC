# Converted from PathFinder 2.2 to 3.0 Jun 18, 3004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9H37-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*******************************************************************************

P-STEP BF9H37-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9H37";
        BusinessFunctionName = "Rider Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9H37";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Policy Id";
    }


    INOUT MIR-LARG-TYP
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Daishu";
    }

    OUT MIR-TOT-RDR-COUNT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider addition no. of cases";
    }

    OUT MIR-CVG-NUM-T[30]
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage number";
        Index = "1";
    }
	
    OUT MIR-RDR-LARG-TYP-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Larg Type";
        Index = "1";
    }

    OUT MIR-RDR-CD-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Code";
        Index = "1";
    }

    OUT MIR-DEL-CTL-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Delete Control";
        Index = "1";
    }

    OUT MIR-RDR-GRP-CTL-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Group Control";
        Index = "1";
    }

    OUT MIR-RDR-TYP-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Type";
        Index = "1";
    }

    OUT MIR-POL-BASE-DT-T[30]
    {
        DisplayOnly;
        Length = "08";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Issue Date";
        Index = "1";
    }

    OUT MIR-ADD-DT-T[30]
    {
        DisplayOnly;
        Length = "08";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Addition Date";
        Index = "1";
    }

    OUT MIR-RECPT-DT-T[30]
    {
        DisplayOnly;
        Length = "08";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Receipt Date";
        Index = "1";
    }

    OUT MIR-MVMT-CD-T[30]
    {
        DisplayOnly;
        Length = "03";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Movement Code";
        Index = "1";
    }
     
    OUT MIR-MVMT-DT-T[30]
    {
        DisplayOnly;
        Length = "08";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Movement Date";
    }
       
    OUT MIR-X1-AGE-T[30]
    {
        DisplayOnly;
        Length = "02";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Age";
        Index = "1";
    }
     
    OUT MIR-X2-AGE-T[30]
    {
        DisplayOnly;
        Length = "02";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "X2 Age";
        Index = "1";
    }
     
    OUT MIR-INS-DUR-1-T[30]
    {
        DisplayOnly;
        Length = "02";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Duration 1";
        Index = "1";
    }
     
    OUT MIR-INS-DUR-2-T[30]
    { 
        DisplayOnly;
        Length = "02";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "2nd Duration";
        Index = "1";
    } 

    OUT MIR-RDR-BNFT-AMT-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Benefit Amount";
    }
    
    OUT MIR-RDR-PREM-1-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Premium Amount";
    }
	
    OUT MIR-RDR-PREM-2-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Premium Amount 2";
    }
	
    OUT MIR-RDR-PYMT-MTHD-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        CodeSource = "DataModel";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Payment Mothed";
        Index = "1";
    }

    OUT MIR-ABC-RDR-SALE-TYP-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Sale Type";
        Index = "1";
    }

    OUT MIR-ANTY-INC-PROT-TYP-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Income protection annuity type";
        Index = "1";
    } 

    OUT MIR-ANTY-PYMT-PER-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Year of payment of annuity period";
        Index = "1";
    }

    OUT MIR-SUBSTD-CVG-DUR-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Substandard Coverage Duration";
        Index = "1";
    }    
    
    OUT MIR-SSTD-AGE-INC-DUR-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Age increase for substandard policies";
        Index = "1";
    }

    OUT MIR-SSTD-SPL-PREM-RT-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Substandard special premium rate";
        Index = "1";
    }

    OUT MIR-POLCTR-AT-ISU-IND-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "New policy level P contract flag";
        Index = "1";
    }

    OUT MIR-POLCTRT-IND-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "P contract flag";
        Index = "1";
    }
    OUT MIR-ANTY-AMT-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Annuity Amount";
    }

    OUT MIR-ANTY-RESRC-T[30]
    {
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Annuity Resources";
    }

    OUT MIR-MED-TRMT-BAS-BEN-T[30]
    {
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Medical Treatment Basic Benefit";
    }

    OUT MIR-PD-MED-BASIC-BENE-T[30]
    {
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Paid medical treatment basic benefit";
    }

    OUT MIR-FMLY-MED-BAS-BEN-T[30]
    {
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Family medical treatment basic benefit";
    }

    OUT MIR-HOSP-DCHG-DLY-BEN-T[30]
    {
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Hospitalization daily benefit";
    }

    OUT MIR-OP-DLY-BENE-T[30]
    {
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Outpatient daily benefit ";
    }

    OUT MIR-RECRUIT-EMP-T[30]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Recruited employee";
        Index = "1";    
	}

    OUT MIR-SAME-AGT-EMP-T[30]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Same agent employee";
        Index = "1";
    }

    OUT MIR-FMLY-SEX-CD-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Family gender";
        Index = "1";
	}
    

    OUT MIR-FMLY-BTH-DT-T[30]
    {
        DisplayOnly;
        Length = "8";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Family birthdate";

    }
       
    OUT MIR-RDR-FMLY-NM-CTL-T[30]
    {   DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";    
        Label = "Rider family name control";
        Index = "1";
    }
    
    OUT MIR-FMLY-NM-T[30]
    {
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table30";    
        DBTableName = "TU3P4";
        SType = "Text";   
        Label = "Family name";
        Index = "1";
    }
    
    OUT MIR-ANTY-GUAR-PER-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";    
        Label = "Annuity guarentee period";
        Index = "1";    
    }
    
    OUT MIR-RDR-GRP-CD-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider G group";
        Index = "1";
    }  


    OUT MIR-POL-BENE-AT-ISSU-T[30]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Benefit at the time of new policy";
        Index = "1";
    }
}

