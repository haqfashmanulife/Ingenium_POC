# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9962-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  FT2              Policy Inquiry - Coverage List for Client                 *
#*  MFFPI   JE       Add new column to reflect if a policy has SA Rider(s)     *
#*                   Add control variable for button functions                 *
#*  M241A3  CTS      FILTER SELECTION CHANGES TO IDENTIFY AGE OR DURATION      *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF9962-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Clicov";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-DV-SRCH-GR-CD";
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

    IN MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }
     
    IN MIR-INDV-CLI-NM
    {
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }


    IN MIR-POL-ID-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }


    IN MIR-CVG-NUM-T[10]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }
 
    IN MIR-PLAN-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }
     
    IN MIR-CVG-ISS-EFF-DT-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table4";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    IN MIR-CVG-CSTAT-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    IN MIR-CVG-FACE-AMT-T[10]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode="MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table4";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    IN MIR-CVG-STBL-1-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
#* M241A3 changes START here*  
        CodeSource = "CSOM9D29";        
	FilterFields = "2";
        FilterField1 = "MIR-PLAN-ID-T"; 
        FilterField2 = "MIR-CVG-STBL-1-CD-T";
#       CodeSource = "EDIT";
#       CodeType = "STB1";
#* M241A3 changes END here*  
        SType = "Text";
        Label = "Duration";
        Index = "1";
    }

    IN MIR-CVG-STBL-2-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table4";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Policy Age";
        Index = "1";
    }

###### *** MFFPI - JDLE - This will display the new column value
   IN MIR-FND-CVG-IND-TXT-T[10]
   {
       Length = "3";
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

