# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:03 PM EDT

#*******************************************************************************
#*  Component:   BF9963-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  FT2001  AT       Initial version                                           *
#*  MFFPI   JE       Add new column to reflect if a policy has SA Rider(s)     *
#*                   Add control variables for button functions                *
#*                                                                             *
#*******************************************************************************

P-STEP BF9963-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9963";
        BusinessFunctionName = "PA - Policy List For Client";
        BusinessFunctionType = "General";
        MirName = "CCWM9963";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT  MIR-DV-MORE-IND;

#* MFFPI
    INOUT  MIR-DV-FND-VAR-IND;
    
#* MFFPI
    INOUT  MIR-POL-ID-BASE;

#* MFFPI
    INOUT  MIR-SCRN-PATH-IND;

    INOUT  MIR-PREV-REL-SYS-ID;
     
    INOUT  MIR-PREV-REL-SYS-REF-ID;
     
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }
     
# Note temporary setting of the Agent ID - This remains in place until the 
# new LDAP model that passes the Agent ID from ManuTouch is in place
    IN MIR-AGT-ID
    {
        Length = "6";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Agent ID";
        DefaultSession = "MIR-AGT-ID";
    }

    IN MIR-KEY-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
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
     
    IN MIR-REL-TYP-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Rel Type Code";
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
     
     
    OUT MIR-POL-ID-T[12]
    {
        DisplayOnly;
        Length = "7";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }
     
    OUT MIR-DV-OWN-CLI-NM-T[12]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }
     
    OUT MIR-DV-OWN-CLI-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Owner ID";
        Index = "1";
    }
     
    OUT MIR-DV-PRIM-INSRD-NM-T[12]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table12";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Main Insured Name";
        Index = "1";
    }
     
    OUT MIR-DV-PRIM-INSRD-CLI-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Main Insured ID";
        Index = "1";
    }
     
    OUT MIR-POL-STAT-TXT-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

#* MFFPI
    OUT MIR-FND-CVG-IND-TXT-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "PAI-HAS-VAR-CD";
        DBTableName = "TDMAD";
        SType = "Text";
        Label = "Has Variable Accumulation Rider ";
        Index = "1";
    }

}

