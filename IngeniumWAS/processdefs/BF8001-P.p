# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF8001-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB01  PHASE 1  Added MIR-APP-FORM-TYP-ID                                 *
#*  01NB01  PHASE 1  Added MIR-POL-APP-CALC-DT                                 *
#*  B01027  DPK      ADDED POL-APP-REASN-CD                                    *
#*  1CNB02  DEL      ADD  MIR-POL-CNVR-TYP-CD                                  *
#*  PR006D  BP       ADD MIR-PROD-APP-TYP-CD                                   *
#*  PR006Q  FB       ADD MIR-MY-KEMPO-TYP-CD                                   *
#*  UY3100  15MAR24   CTS    JIKKO POLICY CHANGES                              *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

P-STEP BF8001-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "8001";
        BusinessFunctionName = "Policy Create";
        BusinessFunctionType = "Create";
        MirName = "CCWM8001";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-APPL-CTL-CD
    {
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application System Code";
    }
#UY3100 STARTS
    INOUT MIR-POL-ID
    {
        Key;
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID";
        SType = "Text";
        Label = "Policy ID";
    }
#UY3100 ENDS
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
#UY3100 STARTS
    IN MIR-SMAL-TYP
    {
        Length = "3";
        SType = "Text";
        Label = "Small Type Code";
    }
#UY3100 ENDS

    IN MIR-PLAN-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Plan ID";
    }

    # Added to allow random Policy Number to be generated - GW Apr. 2001

    INOUT MIR-APP-FORM-TYP-ID
    {
        Length = "1";
        Mandatory;
        DefaultConstant = "L";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TPD";
        SType = "Selection";
        Label = "Application Form Type";
    }

    IN MIR-POL-APP-SIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Signed Date";
    }

    # Added new field - GW June 2001

    IN MIR-POL-APP-CALC-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Illustration Calculation date";
    }

    IN MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Issue Effective Date";
    }

    IN MIR-POL-ISS-LOC-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Issue Location";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Sub Company";
    }
    
    IN MIR-POL-APP-REASN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-APP-REASN-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Reason for Application";
    }
 
    IN MIR-POL-CNVR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Conversion Policy Type Code";
    }    

    IN MIR-PROD-APP-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Product Application Type Code";
    }    
 
    INOUT MIR-MY-KEMPO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MY-KEMPO-TYP-CD";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "My Kempo Type Code";
    }
#UY3049 CHANGES STARTS
    INOUT MIR-PAYO-CHK-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS
}

