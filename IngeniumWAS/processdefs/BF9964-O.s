# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9964-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  FT2001  AT       Initial version                                           *
#*  MFFPI   JE       Add new column to reflect if a policy has SA Rider(s)     *
#*                   Add control variable for button functions                 *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF9964-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "General";
        Type = "Output";
        DelEmptyRows;
#        FocusField = "moreButton";
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

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-AGT-ID
    {
        Length = "6";
        SType = "Hidden";
        Label = "Agent ID";
        DefaultSession = "MIR-AGT-ID";
    }

    INOUT MIR-CLI-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Client ID";
    }
     
    INOUT MIR-REL-SYS-ID
    {
        Length = "8";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Rel Sys ID";
    }
     
    INOUT MIR-REL-SYS-REF-ID
    {
        Length = "12";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Rel Sys Ref";
    }
     
    INOUT MIR-REL-TYP-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Rel Type Code";
    }

    IN MIR-POL-ID-T[12]
    {
        DisplayOnly;
        Length = "7";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM-T[12]
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-PRIM-INSRD-NM-T[12]
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Main Insured Name";
    }

    IN MIR-POL-SNDRY-AMT-T[12]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE      
        Signed;
        Length = "17";
        DBTableName = "TPOL";
        SType = "Currency";
        Decimals = "0";
        Label = "Sundry Amount";
    }
     
    IN MIR-POL-MPREM-AMT-T[12]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE      
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Decimals = "0";
        Label = "Modal Premium";
    }

    IN MIR-POL-STAT-TXT-T[12]
    {
        Length = "40";
        SType = "Text";
        Label = "Policy Status";
    }
    
###### *** MFFPI - JDLE - This will display the new column value
   IN MIR-FND-CVG-IND-TXT-T[12]
   {
       Length = "3";
       CodeSource = "DataModel";
       CodeType = "PAI-HAS-VAR-CD";
       SType = "Text";
       Label = "Has Variable Accumulation Rider ";
   }

#M245B2 CHANGES START HERE    
   IN MIR-POL-CRCY-CD
   {   
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
        
    } 
#M245B2 CHANGES END HERE      
}

