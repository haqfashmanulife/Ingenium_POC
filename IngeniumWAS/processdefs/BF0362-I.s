# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0362-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB10  01AUG01  Add New Underwriting Form Type fields                     *
#*  B00070  DPK      Changed Min & Max Amt fields from Currency to Number      *
#*  B11144  BP       Add New My Kempo Process Code                             *
#*  MP171B  CTS      Add Linked Test Section                                   *
#*******************************************************************************

S-STEP BF0362-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-CCAS-TST-NM";
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

    INOUT MIR-APP-FORM-TYP-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Selection";
        Label = "Update Application Form Type";
        Index = "1";
    }

    INOUT MIR-UW-FORM-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table20";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "UFRM";
        SType = "Selection";
        Label = "Update Underwriting Form ID";
        Index = "1";
    }

    INOUT MIR-CCAS-TST-AGE-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-AGE-CD";
        SType = "Selection";
        Label = "Age Ranges - Include / Exclude";
    }

    INOUT MIR-CCAS-TST-FORM-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-FORM-CD";
        SType = "Selection";
        Label = "Form Type - Include / Exclude";
    }

    INOUT MIR-CCAS-TST-UW-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-UW-TYP-CD";
        SType = "Selection";
        Label = "Underwriting Form ID - Include / Exclude";
    }

    INOUT MIR-CCAS-TST-HIGH-AGE
    {
        Length = "2";
        Decimals = "0";
        SType = "Number";
        Label = "High";
    }

    INOUT MIR-CCAS-TST-LOW-AGE
    {
        Length = "2";
        Decimals = "0";
        SType = "Number";
        Label = "Low";
    }

    INOUT MIR-CCAS-TST-NM
    {
        Mandatory;
        Length = "45";
        SType = "Text";
        Label = "Test Name";
    }

    INOUT MIR-CCAS-TST-TYP-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-TYP-CD";
        SType = "Selection";
        Label = "Test Type";
    }

    INOUT MIR-DV-ANSWR-NO-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-ANSWR-ACT-CD";
        SType = "Selection";
        Label = "If Response is Yes/No";
    }

    INOUT MIR-DV-ANSWR-YES-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-ANSWR-ACT-CD";
        SType = "Selection";
        Label = "If Response is Yes/No";
    }

    INOUT MIR-DV-APP-DT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-APP-DT-TYP-CD";
        SType = "Selection";
        Label = "Date Application Signed / Received";
    }

    INOUT MIR-DV-FIND-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-FIND-ACT-CD";
        SType = "Selection";
        Label = "If Found";
    }

    INOUT MIR-DV-IN-RNG-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-IN-RNG-ACT-CD";
        SType = "Selection";
        Label = "Inside Numeric Range Action";
    }

    INOUT MIR-DV-IN-RNG-ACT-CD-2
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-IN-RNG-ACT-CD";
        SType = "Selection";
        Label = "Inside Date Range Action";
    }

    INOUT MIR-DV-NFIND-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-NFIND-ACT-CD";
        SType = "Selection";
        Label = "If Not Found";
    }

    INOUT MIR-DV-OUT-RNG-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-OUT-RNG-ACT-CD";
        SType = "Selection";
        Label = "Outside Numeric Range Action";
    }

    INOUT MIR-DV-OUT-RNG-ACT-CD-2
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-OUT-RNG-ACT-CD";
        SType = "Selection";
        Label = "Outside Date Range Action";
    }

    INOUT MIR-DV-TST-DT-CUT-DUR
    {
        Length = "3";
        SType = "Text";
        Label = "Cutoff Duration";
    }

    INOUT MIR-DV-TST-DT-DUR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TST-DT-DUR-CD";
        SType = "Selection";
        Label = "Duration";
    }

    INOUT MIR-DV-TST-ETBL-TYP-ID
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        SType = "Selection";
        Label = "Edit Table Type";
    }

    INOUT MIR-DV-TST-NUM-MAX-AMT
    {
        Length = "9";
        Decimals = "0";
        SType = "Number";
        Label = "Numeric Response - Maximum Amount";
    }

    INOUT MIR-DV-TST-NUM-MIN-AMT
    {
        Length = "9";
        Decimals = "0";
        SType = "Number";
        Label = "Numeric Response - Minimum Amount";
    }

    INOUT MIR-FAIL-MSG-REF-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Message Reference if Response Unacceptable";
    }

    INOUT MIR-MSG-REF-NUM
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Message Reference Number";
    }

    INOUT MIR-FLD-ID
    {
        Length = "10";
        SType = "Text";
        Label = "Defined Field Name";
    }

    INOUT MIR-LOC-GR-ID-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Selection";
        Label = "Location Group";
        Index = "1";
    }

    INOUT MIR-LOC-GRP-PRCES-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOC-GRP-PRCES-CD";
        SType = "Selection";
        Label = "Location Groups - Include / Exclude";
    }

    INOUT MIR-REQIR-ID-T[6]
    {
        Length = "5";
        FieldGroup = "Table6";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement Code";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-SBSDRY-CO-PRCES-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SBSDRY-CO-PRCES-CD";
        SType = "Selection";
        Label = "Sub Company - Include / Exlude";
    }

    INOUT MIR-UNANSWR-ACT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UNANSWR-ACT-CD";
        SType = "Selection";
        Label = "Action Taken if Question Unanswered";
    }

    INOUT MIR-UNANSWR-MSG-REF-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Message Reference if Question Unanswered";
    }

    IN MIR-CCAS-TST-ID
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Test Number";
    }

    IN MIR-CCAS-TST-SUBSET-ID
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Subset Test";
    }

    INOUT MIR-MY-KEMPO-PRCES-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MY-KEMPO-PRCES-CD";
        SType = "Selection";
        Label = "MY Kempo - Include / Exclude";
    }
#MP171B CHANGES STARTS HERE
    INOUT MIR-CCAS-LINK-TST-IND
    {
        DBTableName = "TUWMX";
        SType = "Indicator";
        Label = "Linked Test Indicator";
    }
        
    INOUT MIR-POS-LINK-TST-ID
    {
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Postive Link Test Number";
    }
    
    INOUT MIR-NEG-LINK-TST-ID
    {
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Negative Link Test Number";       
    }
    
   INOUT MIR-UNANSWR-LINK-TST-ID
    {
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Unanswered Linked Test Number ";       
    }
#MP171B CHANGES ENDS HERE  
}

