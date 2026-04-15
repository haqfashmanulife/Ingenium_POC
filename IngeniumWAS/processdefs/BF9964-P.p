# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:03 PM EDT

#*******************************************************************************
#*  Component:   BF9964-P.p                                                    *
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

P-STEP BF9964-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9964";
        BusinessFunctionName = "PA - Policy List";
        BusinessFunctionType = "General";
        MirName = "CCWM9964";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT  MIR-DV-MORE-IND;

###### *** MFFPI - JDLE - This will control the display of the error message    
#
    INOUT  MIR-DV-FND-VAR-IND;

    INOUT  MIR-POL-ID-BASE;

    INOUT  MIR-SCRN-PATH-IND;
#
###### *** MFFPI - JDLE - This ends the revision scope

    INOUT  MIR-PREV-REL-SYS-ID;
     
    INOUT  MIR-PREV-REL-SYS-REF-ID;
 
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }
     
#
# Note temporary setting of the Agent ID - This remains in place until the 
# new LDAP model that passes the Agent ID from ManuTouch is in place
#
    IN MIR-AGT-ID
    {
        Length = "6";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Agent ID";
        DefaultSession = "MIR-AGT-ID";
    }

    INOUT MIR-CLI-ID
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
     
    INOUT MIR-REL-TYP-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Rel Type Code";
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
     
    OUT MIR-POL-SNDRY-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table12";
        DBTableName = "TPOL";
        SType = "Currency";
        Decimals = "0";
        Label = "Sundry Amount";
        Index = "1";
    }
     
    OUT MIR-POL-MPREM-AMT-T[12]
    {
        DisplayOnly;
        Signed;
        Length = "17";
        FieldGroup = "Table12";
        SType = "Currency";
        Decimals = "0";
        Label = "Modal Premium";
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

###### *** MFFPI - JDLE - This will display the value for the new column
    OUT MIR-FND-CVG-IND-TXT-T[12]
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "PAI-HAS-VAR-CD";
        SType = "Text";
        Label = "Has Variable Accumulation Rider ";
        Index = "1";
    }
#M245B2 CHANGES START HERE     
    INOUT MIR-POL-CRCY-CD
    {   
         Length = "2";
         SType = "Hidden";
         Label = "Currency";        
    }     
#M245B2 CHANGES END HERE    
}

