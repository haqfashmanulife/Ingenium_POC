# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0360-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB10  01AUG01  Add New Underwriting Form Type fields                     *
#*  B00070  DPK      Changed Min & Max Amt fields from Currency to Number      *
#*  B00100  SC       Correct MIR-CCAS-TST-UW-TYP-CD table name from UWMU to    *
#*                   UWMX                                                      *
#*  B11144  BP       Add New My Kempo Process Code                             *
#*  MP171B  CTS      Add Linked Test Section                                   *
#*******************************************************************************

P-STEP BF0360-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0360";
        BusinessFunctionName = "Clear Case Test Table Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM0360";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CCAS-TST-ID
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Test Number";
    }

    INOUT MIR-CCAS-TST-SUBSET-ID
    {
        Key;
        Length = "1";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Subset Test";
    }

    OUT MIR-APP-FORM-TYP-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TUWMF";
        SType = "Text";
        Label = "Update Application Form Type";
        Index = "1";
    }

    OUT MIR-UW-FORM-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table20";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "UFRM";
        DBTableName = "TUWMU";
        SType = "Text";
        Label = "Update Underwriting Form ID";
        Index = "1";
    }

    OUT MIR-CCAS-TST-AGE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-AGE-CD";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Age Ranges - Include / Exclude";
    }

    OUT MIR-CCAS-TST-FORM-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-FORM-CD";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Form Type - Include / Exclude";
    }

    OUT MIR-CCAS-TST-UW-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-UW-TYP-CD";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Underwriting Form Type - Include / Exclude";
    }

    OUT MIR-CCAS-TST-HIGH-AGE
    {
        Length = "2";
        Decimals = "0";
        DBTableName = "TUWMX";
        SType = "Number";
        Label = "High";
    }

    OUT MIR-CCAS-TST-LOW-AGE
    {
        Length = "2";
        Decimals = "0";
        DBTableName = "TUWMX";
        SType = "Number";
        Label = "Low";
    }

    OUT MIR-CCAS-TST-NM
    {
        Length = "45";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Test Name";
    }

    OUT MIR-CCAS-TST-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-TYP-CD";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Test Type";
    }

    OUT MIR-DV-ANSWR-NO-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-ANSWR-ACT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "If Response is Yes/No";
    }

    OUT MIR-DV-ANSWR-YES-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-ANSWR-ACT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "If Response is Yes/No";
    }

    OUT MIR-DV-APP-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-APP-DT-TYP-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Date Application Signed / Received";
    }

    OUT MIR-DV-FIND-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-FIND-ACT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "If Found";
    }

    OUT MIR-DV-IN-RNG-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-IN-RNG-ACT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Inside Numeric Range Action";
    }

    OUT MIR-DV-IN-RNG-ACT-CD-2
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-IN-RNG-ACT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Inside Date Range Action";
    }

    OUT MIR-DV-NFIND-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-NFIND-ACT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "If Not Found";
    }

    OUT MIR-DV-OUT-RNG-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-OUT-RNG-ACT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Outside Numeric Range Action";
    }

    OUT MIR-DV-OUT-RNG-ACT-CD-2
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-OUT-RNG-ACT-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Outside Date Range Action";
    }

    OUT MIR-DV-TST-DT-CUT-DUR
    {
        Length = "3";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Cutoff Duration";
    }

    OUT MIR-DV-TST-DT-DUR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TST-DT-DUR-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Duration";
    }

    OUT MIR-DV-TST-ETBL-TYP-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Edit Table Type";
    }

    OUT MIR-DV-TST-NUM-MAX-AMT
    {
        Length = "9";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Numeric Response - Maximum Amount";
    }

    OUT MIR-DV-TST-NUM-MIN-AMT
    {
        Length = "9";
        Decimals = "0";
        DBTableName = "Derived";
        SType = "Number";
        Label = "Numeric Response - Minimum Amount";
    }

    OUT MIR-FAIL-MSG-REF-ID
    {
        Length = "6";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Message Reference if Response Unacceptable";
    }

    OUT MIR-FLD-ID
    {
        Length = "10";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Defined Field Name";
    }

    OUT MIR-LOC-GR-ID-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPLGR";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-LOC-GRP-PRCES-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOC-GRP-PRCES-CD";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Location Groups - Include / Exclude";
    }

    OUT MIR-MSG-REF-NUM
    {
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Message Number";
    }

    OUT MIR-REQIR-ID-T[6]
    {
        Length = "5";
        FieldGroup = "Table6";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "Requirement Code";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-PRCES-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SBSDRY-CO-PRCES-CD";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Sub Company - Include / Exlude";
    }

    OUT MIR-UNANSWR-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UNANSWR-ACT-CD";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Action Taken if Question Unanswered";
    }

    OUT MIR-UNANSWR-MSG-REF-ID
    {
        Length = "6";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Message Reference if Question Unanswered";
    }

    OUT MIR-MY-KEMPO-PRCES-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MY-KEMPO-PRCES-CD";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "My Kempo - Include / Exclude";
    }
#MP171B CHANGES STARTS HERE
    OUT MIR-CCAS-LINK-TST-IND
    {
        DBTableName = "TUWMX";
        SType = "Indicator";
        Label = "Linked Test Indicator";
     }   
    OUT MIR-POS-LINK-TST-ID
    {
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Postive Link Test Number";
    }
    
    OUT MIR-NEG-LINK-TST-ID
    {
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Negative Link Test Number";       
    }
    
   OUT MIR-UNANSWR-LINK-TST-ID
    {
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Unanswered Linked Test Number ";       
    }
#MP171B CHANGES ENDS HERE      
    }

