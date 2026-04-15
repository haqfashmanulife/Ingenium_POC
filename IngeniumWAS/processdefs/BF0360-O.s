# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:21 PM EDT

#*******************************************************************************
#*  Component:   BF0360-O.s                                                    *
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

S-STEP BF0360-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
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

    IN MIR-APP-FORM-TYP-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Text";
        Label = "Update Application Form Type";
        Index = "1";
    }

    IN MIR-UW-FORM-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "UFRM";
        SType = "Text";
        Label = "Update Underwriting Form ID";
        Index = "1";
    }

    IN MIR-CCAS-TST-AGE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-AGE-CD";
        SType = "Text";
        Label = "Age Ranges - Include / Exclude";
    }

    IN MIR-CCAS-TST-FORM-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-FORM-CD";
        SType = "Text";
        Label = "Form Type - Include / Exclude";
    }

    IN MIR-CCAS-TST-UW-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-UW-TYP-CD";
        SType = "Text";
        Label = "Underwriting Form ID - Include / Exclude";
    }

    IN MIR-CCAS-TST-HIGH-AGE
    {
        DisplayOnly;
        Length = "2";
        Decimals = "0";
        SType = "Number";
        Label = "High";
    }

    IN MIR-CCAS-TST-LOW-AGE
    {
        DisplayOnly;
        Length = "2";
        Decimals = "0";
        SType = "Number";
        Label = "Low";
    }

    IN MIR-CCAS-TST-NM
    {
        DisplayOnly;
        Length = "45";
        SType = "Text";
        Label = "Test Name";
    }

    IN MIR-CCAS-TST-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CCAS-TST-TYP-CD";
        SType = "Text";
        Label = "Test Type";
    }

    IN MIR-DV-ANSWR-NO-ACT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-ANSWR-ACT-CD";
        SType = "Text";
        Label = "If Response is Yes/No";
    }

    IN MIR-DV-ANSWR-YES-ACT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-ANSWR-ACT-CD";
        SType = "Text";
        Label = "If Response is Yes/No";
    }

    IN MIR-DV-APP-DT-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-APP-DT-TYP-CD";
        SType = "Text";
        Label = "Date Application Signed / Received";
    }

    IN MIR-DV-FIND-ACT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-FIND-ACT-CD";
        SType = "Text";
        Label = "If Found";
    }

    IN MIR-DV-IN-RNG-ACT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-IN-RNG-ACT-CD";
        SType = "Text";
        Label = "Inside Numeric Range Action";
    }

    IN MIR-DV-IN-RNG-ACT-CD-2
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-IN-RNG-ACT-CD";
        SType = "Text";
        Label = "Inside Date Range Action";
    }

    IN MIR-DV-NFIND-ACT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-NFIND-ACT-CD";
        SType = "Text";
        Label = "If Not Found";
    }

    IN MIR-DV-OUT-RNG-ACT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-OUT-RNG-ACT-CD";
        SType = "Text";
        Label = "Outside Numeric Range Action";
    }

    IN MIR-DV-OUT-RNG-ACT-CD-2
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-OUT-RNG-ACT-CD";
        SType = "Text";
        Label = "Outside Date Range Action";
    }

    IN MIR-DV-TST-DT-CUT-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Cutoff Duration";
    }

    IN MIR-DV-TST-DT-DUR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TST-DT-DUR-CD";
        SType = "Text";
        Label = "Duration";
    }

    IN MIR-DV-TST-ETBL-TYP-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "EDIT";
        SType = "Text";
        Label = "Edit Table Type";
    }

    IN MIR-DV-TST-NUM-MAX-AMT
    {
        DisplayOnly;
        Length = "9";
        Decimals = "0";
        SType = "Number";
        Label = "Numeric Response - Maximum Amount";
    }

    IN MIR-DV-TST-NUM-MIN-AMT
    {
        DisplayOnly;
        Length = "9";
        Decimals = "0";
        SType = "Number";
        Label = "Numeric Response - Minimum Amount";
    }

    IN MIR-FAIL-MSG-REF-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Message Reference if Response Unacceptable";
    }

    IN MIR-FLD-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Defined Field Name";
    }

    IN MIR-LOC-GR-ID-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    IN MIR-LOC-GRP-PRCES-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOC-GRP-PRCES-CD";
        SType = "Text";
        Label = "Location Groups - Include / Exclude";
    }

    IN MIR-MSG-REF-NUM
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Message Number";
    }

    IN MIR-REQIR-ID-T[6]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table6";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement Code";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-ID-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-SBSDRY-CO-PRCES-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SBSDRY-CO-PRCES-CD";
        SType = "Text";
        Label = "Sub Company - Include / Exlude";
    }

    IN MIR-UNANSWR-ACT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "UNANSWR-ACT-CD";
        SType = "Text";
        Label = "Action Taken if Question Unanswered";
    }

    IN MIR-UNANSWR-MSG-REF-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Message Reference if Question Unanswered";
    }

    IN MIR-MY-KEMPO-PRCES-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MY-KEMPO-PRCES-CD";
        SType = "Text";
        Label = "MY Kempo - Include / Exclude";
    }
#MP171B CHANGES STARTS HERE    
   IN  MIR-CCAS-LINK-TST-IND
    {
        DBTableName = "TUWMX";
        SType = "Indicator";
        Label = "Linked Test Indicator";
    }    
    IN  MIR-POS-LINK-TST-ID
    {
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Postive Link Test Number";
    }
    
    IN  MIR-NEG-LINK-TST-ID
    {
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Negative Link Test Number";       
    }
    
   IN  MIR-UNANSWR-LINK-TST-ID
    {
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Unanswered Linked Test Number ";       
    }
#MP171B CHANGES ENDS HERE    

}

