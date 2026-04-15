# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppApplicationDataJPVUL.s                                     *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016824  611J     Move Effective date fields to Application Data page       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  NWLUWW  CTS      Remove MIR-APP-FORM-TYP-ID from the filter selection      *
#*                   program CSOM4900                                          *
#*                                                                             *
#*******************************************************************************

S-STEP AppApplicationDataJPVUL
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        DelEmptyRows;
        FocusField = "MIR-APP-FORM-TYP-ID";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }


    # the following 5 fields are used to provide input to a filtered
    # selection box for the products to be chosen.
    # each of fields will be defaulted to a value, allowing
    # codeserver to provide values to choose from in
    # the product selection box without user intervention.
    # should the values be different than what the user may
    # may have desired, they are available for entry.  If the
    # user changes any of the filter criteria, the product selection
    # box will need to be refreshed (a button will be provided to do
    # this).

    INOUT MIR-APP-FORM-TYP-ID
    {
        Length = "1";
        Mandatory;
        DefaultConstant = "V";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Selection";
        Label = "Application Form Type";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Length = "2";
        Mandatory;
        DefaultConstant = "S1";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-POL-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Selection";
        Label = "Issue Country";
    }

    INOUT MIR-POL-ISS-LOC-CD
    {
        Length = "2";
        Mandatory;
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-POL-CTRY-CD";
        SType = "Selection";
        Label = "Issue Location";
    }

    INOUT MIR-POL-APP-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Received Date";
    }


    # the following field is used to provide a filtered
    # selection box to the user, providing them only with
    # products that match their input criteria.

    INOUT MIR-PLAN-ID
    {
        Length = "50";
        Mandatory;
        CodeSource = "CSOM4900";
    # NWLUWW changes begin
    #    FilterFields = "4";
    #    FilterField1 = "MIR-APP-FORM-TYP-ID";
    #    FilterField2 = "MIR-SBSDRY-CO-ID";
    #    FilterField3 = "MIR-POL-ISS-LOC-CD";
    #    FilterField4 = "MIR-POL-APP-RECV-DT";
        FilterFields = "3";
        FilterField1 = "MIR-SBSDRY-CO-ID";
        FilterField2 = "MIR-POL-ISS-LOC-CD";
        FilterField3 = "MIR-POL-APP-RECV-DT";
    # NWLUWW changes end
        SType = "Selection";
        Label = "Product";
    }


    # the following fields are used to provide information
    # about policy replacement processing.

    INOUT ReplacementQuestion
    {
        DefaultConstant = "N";
        SType = "YesNo";
        Label = "Is this policy replacing another policy?";
    }

    INOUT MIR-REPL-POL-ID
    {
        Mandatory;
        Length = "20";
        SType = "Text";
        Label = "Replaced Policy Number";
    }

    INOUT ReplacementCodeQuestion
    {
        DefaultConstant = "Y";
        SType = "YesNo";
        Label = "Is This Policy With?";
    }


    # the following field is hidden and holds an Internal or External
    # replacement code as values.  Javascript on the page sets the value
    # for this field based on the user's selection of the
    # ReplacementCodeQuestion above.  Flow logic then takes this value
    # and assigns it to MIR-POL-REPL-TYP-CD as either I or E.

    OUT ReplacementCode
    {
        SType = "Hidden";
    }


    # link to invoke the search for the replacement company

    OUT ReplacementCompanySearchLink
    {
        Label = "Search for Replacement Company";
        Link;
        SType = "Text";
        Action = "ACTION_SEARCH";
    }

    IN MIR-REPL-CO-CLI-ID
    {

        # although a client number will be returned by the client search
        # an assignment of that number will occur in the flow to this
        # variable.  This is done to eliminate confusion as to what client
        # number means on this page.

        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Replaced Company Client Number";
    }

    INOUT MIR-DV-REPL-CO-CLI-NM
    {

        # although a client name will be returned by the client search
        # an assignment of that name will occur in the flow to this
        # variable.  This is done to eliminate confusion as to what client
        # name means on this page. This data is for information only - it
        # does not get sent to the p-step.

        ReadOnly;
        Length = "25";
        SType = "Text";
        Label = "Company Name";
    }

    INOUT ReplacementQuestion1035
    {
        Label = "This is a 1035 replacement";
        SType = "Indicator";
    }

    INOUT MIR-TAX-1035-ACB-AMT
    {
        Mandatory;
        Length = "15";
        SType = "Currency";
        Label = "Adjusted Cost Basis";
    }


    # the following fields are used to provide the user
    # with input areas for owner information.

    OUT OwnerIndividualAddLink
    {
        Label = "Search for Individual Owner";
        Link;
        SType = "Text";
        Action = "GoToIndividualSearch";
    }

    OUT OwnerCompanyAddLink
    {
        Label = "Search for Company Owner";
        Link;
        SType = "Text";
        Action = "GoToCompanySearch";
    }

    IN MIR-DV-OWN-CLI-NM-T[1]
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MailName
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Mail Name";
    }

    IN MIR-CLI-TAX-ID-T[1]
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "SSN";
    }

    INOUT MIR-CLI-ID-T[1]
    {
        Length = "10";
        SType = "Hidden";
        Label = "Client ID";
    }

    INOUT MIR-POL-CLI-INSRD-CD-T[1]
    {
        Length = "15";
        Mandatory;
        DefaultConstant = "SAME";
        CodeSource = "EDIT";
        CodeType = "OTOI";
        SType = "Selection";
        Label = "Relationship to Insured";
    }

    IN MailAddressLine-T[7]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "35";
        KeyColumn;
        SType = "Text";
        Label = "Mailing Address line 7";
        Index = "1";
    }

    OUT MailAddressChangeLink
    {
        Label = "Change Mailing Address for this Owner";
        Link;
        SType = "Text";
        Action = "ChangeMailingAddress";
    }

    INOUT MIR-CLI-ADDR-TYP-CD-T[1]
    {
        Length = "15";
        SType = "Text";
        Label = "Address Type";
    }


    # the following fields are used to control user-defined
    # policy id overrides.

    INOUT PolicyIDAssignmentOverride
    {
        SType = "Indicator";
        Label = "Override automatic Policy ID Assignment";
    }

    INOUT UserDefinedPolicyIDBase
    {
        Length = "10";
        Mandatory;
        SType = "Text";
        Label = "User-defined Policy ID Base";
    }

    INOUT UserDefinedPolicyIDSuffix
    {
        Length = "10";
        Mandatory;
        SType = "Text";
        Label = "User-defined Policy ID Suffix";
    }


    # the following fields are used to store temporary values for
    # original primary insured settings.  As the page is displayed for
    # the first time, the primary insured is set equal to the owner client.
    # if the user changes the primary insured to other and then back.
    # these temporary variables will be used to house the original values
    # preventing multiple server calls and simplifying the process flow.
    # these variables are not displayed to the user.

    IN PrimaryInsuredADDR-TYP-CD-T[1]
    {
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Hidden";
        Label = "Address Type";
    }

    IN PrimaryInsuredName
    {
        DisplayOnly;
        Length = "75";
        SType = "Hidden";
        Label = "Owner Name";
    }

    IN PrimaryInsuredMailName
    {
        DisplayOnly;
        Length = "75";
        SType = "Hidden";
        Label = "Mail Name";
    }

    IN PrimaryInsuredTAX-ID-T[1]
    {
        DisplayOnly;
        Length = "9";
        SType = "Hidden";
        Label = "SSN";
    }

    INOUT PrimaryInsuredOwnerClientID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Client ID";
    }

    IN PrimaryInsuredMailAddressLine-T[7]
    {
        DisplayOnly;
        FieldGroup = "Table1";
        Length = "60";
        SType = "Hidden";
        Label = "PrimaryInsuredMailing Address line 7";
        Index = "1";
    }


    # 16824 remove these fields from AppSignatures and add here

    INOUT MIR-POL-ISS-DT-TYP-CD
    {
        Length = "1";
        DefaultConstant = "E";
        CodeSource = "DataModel";
        CodeType = "POL-ISS-DT-TYP-CD";
        SType = "Selection";
        Label = "Issue Date Rules";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Issue Date of the Policy";
    }

}

