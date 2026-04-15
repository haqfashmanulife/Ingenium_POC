# Converted from PathFinder 2.2 to 3.0 Nov 24, 2014 3:13:52 PM EDT

#*******************************************************************************
#*  Component:   BF9B79-P.p                                                    *
#*  Description: Future CSV - Monthly                                          *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP269A  CTS      INITIAL VERSION                                           *
#*  MP280F  CTS      CHANGES FOR FUTURE CSV - ALL COVERAGES                    *
#*******************************************************************************

P-STEP BF9B79-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B79";
        BusinessFunctionName = "Rider Surrender/Rider FA Reduction List-Monthly";
        BusinessFunctionType = "List";
        MirName = "CCWM9B79";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT  MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT  MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT  MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT  MIR-APPL-CTL-PRCES-DT
    {
        Key;
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date Of Change";
    }

    INOUT  MIR-POL-SNDRY-AMT
    {
        Signed;
        Length = "14";
        DBTableName = "TPOL";
        SType = "Currency";
        Label = "Sundry Amount";
    }
    
    INOUT MIR-POL-BILL-MODE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Payment Mode";
    }
    
    IN  MIR-DV-EFF-DT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Effective Date";
    }
    
    IN MIR-MTHV-DT

    {
        Length = "10";
        SType = "Date";
        Label = "Anniversary Date Monthly";
    }
    IN MIR-INSRD-AGE-MTHLY

    {
        Length = "3";
        SType = "Number";
        Label = "Insured Age Monthly";
    }
    IN MIR-ELPSD-ISS-YR-NB
    {
        Length = "3";
        SType = "Number";
        Label = "Elapsed year for New Business";
    }
    IN MIR-CSV-RATIO-MNTHLY

    {
        Length = "3";
        SType = "Number";
        Label = "CSV Ratio derived";
    }
    IN MIR-TOT-CVG-NEW-MPREM-AMT

    {
        Length = "16";
        SType = "Currency";
        Label = "New total premium Amount";
    }
    IN MIR-TOT-ACCUM-AMT

    {
        Length = "16";
        SType = "Currency";
        Label = "Accumulated Amount of premium paid";
    }
    OUT MIR-MTHV-DT-T[12]
    {
        Length = "10";
        SType = "Date";
        Label = "Anniversary date";  
        Index = "1";        
    }
    
    OUT MIR-INSRD-AGE-MTHLY-T[12]
    {
        Length = "3";
        SType = "Number";
        Label = "Insured age";
        Index = "1"; 
    }
    
    OUT MIR-ELPSD-ISS-YR-NB-T[12]
    {
        Length = "3";
        SType = "Number";
        Label = "Number of Years Elapsed After New Business";
        Index = "1";         
    }
    
    OUT MIR-ELPSD-MO-ANNIV-T[12]
    {
        Length = "3";
        SType = "Number";
        Label = "Number of Months Elapsed After Anniversary Date";
        Index = "1";         
    }
    
    OUT MIR-ELPSD-MO-FA-RED-T[12]
    {
        Length = "3";
        SType = "Number";
        Label = "Number of Months Elapsed After FA Reduction";
        Index = "1";         
    }     
    
    OUT MIR-ELPSD-YR-FA-RED-T[12]
    {
        Length = "3";
        SType = "Number";
        Label = "Number of Years Elapsed After FA Reduction";
        Index = "1";         
    }     

    OUT MIR-CSV-AMT-MTHLY-T[12]
    {
        Length = "16";
        SType = "Currency";
        Label = "Cash Surrender Value";
        Index = "1";
    }
    
    OUT MIR-TOT-ACCUM-AMT-MTHLY-T[12]
    {
        Length = "16";
        SType = "Currency";
        Label = "cumulative Amount of  Premiums Paid";
        Index = "1";
    }    
      
    OUT MIR-CSV-RATIO-T[12]
    {
        Length = "3";
        SType = "Percent";
        Label = "Rate of CSV to Premium Paid";
        Index = "1";
    }      


    INOUT MIR-POL-CRCY-CD
    {  
         Length = "2";
         SType = "Hidden";
         Label = "Currency";
    } 

    IN MIR-DIFF-FA-ACC-CSV-MNTHLY


    {
         Length = "16";
         SType = "Currency";
         Label = "Amount";
     }
#MP280F CHANGES STARTS HERE   
#   IN MIR-NEW-BASE-CVG-FA-AMT
    IN MIR-NEW-CVG-FACE-AMT-T[90]
#MP280F CHANGES ENDS HERE    
    {
         Length = "16";
         SType = "Currency";
         Label = "Amount";
     }       
}