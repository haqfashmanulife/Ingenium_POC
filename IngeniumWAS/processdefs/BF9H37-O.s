# Converted from PathFinder 2.2 to 3.0 Jun 18, 3004 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9H37-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*******************************************************************************

S-STEP BF9H37-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-POL-ID";
        FocusFrame = "ContentFrame";
    }
    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN LSIR-RETURN-CD;

    IN MIR-RETRN-CD;
    
	OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }
	
    IN MIR-POL-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-LARG-TYP
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Daishu";
    }

    IN MIR-TOT-RDR-COUNT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Rider addition no. of cases";
    }

    IN MIR-CVG-NUM-T[30]
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage number";
        Index = "1";
    }

    IN MIR-RDR-LARG-TYP-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Larg Type";
        Index = "1";
    }

    IN MIR-RDR-CD-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Code";
        Index = "1";
    }

    IN MIR-DEL-CTL-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Delete Control";
        Index = "1";
    }

    IN MIR-RDR-GRP-CTL-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Group Control";
        Index = "1";
    }

    IN MIR-RDR-TYP-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Type";
        Index = "1";
    }

    IN MIR-POL-BASE-DT-T[30]
    {
        DisplayOnly;
        Length = "08";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Issue Date";
        Index = "1";
    }

    IN MIR-ADD-DT-T[30]
    {
        DisplayOnly;
        Length = "08";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Addition Date";
        Index = "1";
    }

    IN MIR-RECPT-DT-T[30]
    {
        DisplayOnly;
        Length = "08";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Receipt Date";
        Index = "1";
    }

    IN MIR-MVMT-CD-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Movement Code";
        Index = "1";
    }
     
    IN MIR-MVMT-DT-T[30]
    {
        DisplayOnly;
        Length = "1";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Movement Date";
    }
       
    IN MIR-X1-AGE-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Age";
        Index = "1";
    }
     
    IN MIR-X2-AGE-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "X2 Age";
        Index = "1";
    }
     
    IN MIR-INS-DUR-1-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Duration 1";
        Index = "1";
    }
     
    IN MIR-INS-DUR-2-T[30]
    { 
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "2nd Duration";
        Index = "1";
    } 

    IN MIR-RDR-BNFT-AMT-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Benefit Amount";
    }
    
    IN MIR-RDR-PREM-1-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Premium Amount";
    }
	
    IN MIR-RDR-PREM-2-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Premium Amount 2";
    }
	
    IN MIR-RDR-PYMT-MTHD-T[30]
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

    IN MIR-ABC-RDR-SALE-TYP-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Rider Sale Type";
        Index = "1";
    }

    IN MIR-ANTY-INC-PROT-TYP-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Income protection annuity type";
        Index = "1";
    } 

    IN MIR-ANTY-PYMT-PER-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Year of payment of annuity period";
        Index = "1";
    }

    IN MIR-SUBSTD-CVG-DUR-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Substandard Coverage Duration";
        Index = "1";
    }    
    
    IN MIR-SSTD-AGE-INC-DUR-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Age increase for substandard policies";
        Index = "1";
    }

    IN MIR-SSTD-SPL-PREM-RT-T[30]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Substandard special premium rate";
        Index = "1";
    }

    IN MIR-POLCTR-AT-ISU-IND-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "New policy level P contract flag";
        Index = "1";
    }

    IN MIR-POLCTRT-IND-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "P contract flag";
        Index = "1";
    }
    IN MIR-ANTY-AMT-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Annuity Amount";
    }

    IN MIR-ANTY-RESRC-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Annuity Resources";
    }

    IN MIR-MED-TRMT-BAS-BEN-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Medical Treatment Basic Benefit";
    }

    IN MIR-PD-MED-BASIC-BENE-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Paid medical treatment basic benefit";
    }

    IN MIR-FMLY-MED-BAS-BEN-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Family medical treatment basic benefit";
    }

    IN MIR-HOSP-DCHG-DLY-BEN-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Hospitalization daily benefit";
    }

    IN MIR-OP-DLY-BENE-T[30]
    {
        
        DisplayOnly;
        Length = "10";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "INpatient daily benefit ";
    }

    IN MIR-RECRUIT-EMP-T[30]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Recruited employee";
        Index = "1";    
	}

    IN MIR-SAME-AGT-EMP-T[30]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Same agent employee";
        Index = "1";
    }

    IN MIR-FMLY-SEX-CD-T[30]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Family gender";
        Index = "1";
	}
    

    IN MIR-FMLY-BTH-DT-T[30]
    {
        DisplayOnly;
        Length = "8";
        Index = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";
        Label = "Family birthdate";

    }
       
    IN MIR-RDR-FMLY-NM-CTL-T[30]
    {   DisplayOnly;
        Length = "1";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";    
        Label = "Rider family name control";
        Index = "1";
    }
    
    IN MIR-FMLY-NM-T[30]
    {
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table30";    
        DBTableName = "TU3P4";
        SType = "Text";   
        Label = "Family name";
        Index = "1";
    }
    
    IN MIR-ANTY-GUAR-PER-T[30]
    {
        DisplayOnly;
        Length = "2";           
        FieldGroup = "Table30";        
        DBTableName = "TU3P4";           
        SType = "Text";    
        Label = "Annuity guarentee period";
        Index = "1";    
    }
    
    IN MIR-RDR-GRP-CD-T[30]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table30";
        DBTableName = "TU3P4";
        SType = "Text";        
        Label = "Rider G group";
        Index = "1";
    }  


    IN MIR-POL-BENE-AT-ISSU-T[30]
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

