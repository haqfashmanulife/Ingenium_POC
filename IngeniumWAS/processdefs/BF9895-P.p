# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:02 PM EDT

#*******************************************************************************
#*  Component:   BF9895-P.p                                                    *
#*  Description: Insured Claim Policy List                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL  HEAD AND BRANCH OFFICE CLAIM INQ (HAC002C)                  *
#* EN000224    GW  ADDED BENEFIT NAME & DECISION DROP DOWN BOXES               *
#*                 PLUS ADDED MIR-USER-BRANCH-CODE FIELD                       *
#*                                                                             *
#*******************************************************************************

P-STEP BF9895-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9895";
        BusinessFunctionName = "Insured Claim Policy List";
        BusinessFunctionType = "List";
        MirName = "CCWM9895";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Text";
        DefaultSession = "MIR-CLI-ID";        
        Label = "Insured Client ID";
    }

    INOUT MIR-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy ID";
    }

    OUT MIR-CLI-NM
    {
        Length = "60";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        SType = "Text";
        Label = "Birth Date";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }
     
    OUT MIR-USER-BRANCH-CODE
    {
        Length = "5";
        SType = "Hidden";
        Label = "Branch Code";
    }

    INOUT MIR-BNFT-NM-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BENNM";
        DBTableName = "TCLBN";
        SType = "Selection";
        Label = "Benefit Name";
    }
 
    INOUT MIR-BNFT-DECSN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLBN-BNFT-DECSN-CD";
        DBTableName = "TCLBN";
        SType = "Selection";
        Label = "Decision";
    }
 
    OUT MIR-POL-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";
    }

    OUT MIR-POL-ISS-EFF-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Issue Date";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD-T[50]
    {
        Length = "40";
        FieldGroup = "Table1";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
        Index = "1";
    }

}

