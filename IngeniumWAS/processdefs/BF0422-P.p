# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:21 PM EDT


#*******************************************************************************
#*  Component:   BF0422-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016227  602J      CODE CLEANUP                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*******************************************************************************

P-STEP BF0422-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0422";
        BusinessFunctionName = "Medical Questions Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM0420";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

#   This MIR-FLD-ID field is required as an input to the process in order
#   to determine the question to which details are required.  Typically,
#   a basic question will result in medical details for that basic question.
#   The MIR-FLD-ID below represents that basic question.  The same fields
#   may apply to a number of medical disorders (for example, the doctor, medication,
#   treatment, tests, results,...) so this field is required to form part of
#   the key to where the detailed responses are housed.

    INOUT MIR-FLD-ID
    {
        Mandatory;
        Length = "10";
        DBTableName = "TDFLD";
        SType = "Text";
        Label = "Base Question Field Name";
    }

#   These next fields (MIR-FLD-ID-nnn) are required as inputs to the process in order
#   for the host to determine what detailed data is to be extracted from
#   its storage location on the host.  The output from this process will be
#   returned to the flow in the form of the MIR-DV-QSTN-RESP-TXT-nnn fields.

#   The value of this field is used to locate the defined field (DFLD)
#   entry.  The DFLD entry is then used to locate the table, and location within
#   that table, where the data is stored.

#   Additional details may be retrieved by adding separate input fields to
#   transport the data from host to client (i.e. add ...-005 and so on).  The values
#   contained within this P-Step are a sample of data that may be requested and
#   returned to the flow.


    IN MIR-FLD-ID-001
    {
        Value = "MED-DOCTOR";
    }

    IN MIR-FLD-ID-002
    {
        Value = "MED-ONSET";
    }

    IN MIR-FLD-ID-003
    {
        Value = "MED-DIAG";
    }

    IN MIR-FLD-ID-004
    {
        Value = "MED-TREAT";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "02";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

    OUT MIR-LOC-GR-ID
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TLGAS";
        SType = "Text";
        Label = "Location Group";
    }

    OUT MIR-APP-FORM-TYP-ID
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Form Type";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

#   Ultimately, it is the question responses that are the desired objective of this
#   business function.  These fields represent the detailed medical questions
#   based on the basic question asked.  It is essential that the numeric identifier
#   (the last 3 characters of the field name itself) correspond to the input
#   field for these medical details.  For example, the output for the field
#   MED-DOCTOR (requested via field MIR-FLD-ID-001), will be returned in the
#   MIR-DV-QSTN-TXT-001 field below.  The process driver for this business
#   function expects this and performs the mapping of input field to output
#   field.

#   Additional responses may be retrieved by adding separate output fields to
#   transport the data from host to client (i.e. add ...-005 and so on)

    INOUT MIR-DV-QSTN-RESP-TXT-001
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-002
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-003
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

    INOUT MIR-DV-QSTN-RESP-TXT-004
    {
        Length = "20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Response to Variable Questions";
    }

}


