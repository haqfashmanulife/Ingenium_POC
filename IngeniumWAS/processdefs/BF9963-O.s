# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9963-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  FT2001  AT       Initial version                                           *
#*  MFFPI   JE       Add new column to reflect if a policy has SA Rider(s)     *
#*                   Add control variable for button functions                 *
#*                                                                             *
#*******************************************************************************

S-STEP BF9963-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "General";
        Type = "Output";
        DelEmptyRows;
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

    IN MIR-AGT-ID
    {
        Length = "6";
        SType = "Hidden";
        Label = "Agent ID";
        DefaultSession = "MIR-AGT-ID";
    }

    IN MIR-CLI-ID
    {
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

    IN MIR-DV-OWN-CLI-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Owner ID";
    }

    IN MIR-DV-PRIM-INSRD-NM-T[12]
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Main Insured Name";
    }

    IN MIR-DV-PRIM-INSRD-CLI-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Main Insured ID";
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
       FieldGroup = "Table12";
       CodeSource = "DataModel";
       CodeType = "PAI-HAS-VAR-CD";
       DBTableName = "TDMAD";
       SType = "Text";
       Label = "Has Variable Accumulation Rider ";
   }
}

