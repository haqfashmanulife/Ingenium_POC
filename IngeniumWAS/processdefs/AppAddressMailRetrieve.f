# Converted from PathFinder 2.2 to 3.0 on May 4, 2004 3:50:13 PM EDT

#*******************************************************************************
#*  Component:   AppAddressMailRetrieve                                        *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************

INCLUDE "BF4913-P.p";

PROCESS AppAddressMailRetrieve
{
  VARIABLES
  {
      OUT MIR-DV-OWN-CLI-NM-T[1];
      OUT MailAddressLine-T[7];
  }


    #*****************************************************************
    # For any client ID and address type, this process will output
    # a name and 6 address lines, formatted as they would be for
    # mailing purposes.  This information is for display only, and is not
    # sent to the server for processing.
    #*****************************************************************
    # regardless of the relationship of the owner to the insured or at
    # what point an address retrieve is requested, the only required
    # inputs for the address retrieve are a client id and address type code.
    # the owner client id will arrive in this flow (MIR-CLI-ID-T-1), but the
    # address type may not.
    # evaluate a field that would normally reside on the policy, to determine
    # if an address type code has been selected or used so far.
    # the address type field for the owner will tell us this.  on the policy
    # record, the field corresponding to this value for the owner is
    # MIR-CLI-ADDR-TYP-CD-T-1.
    # if the policy record field is blank, we assume that we will use
    # the primary address type for this owner record, to retrieve the
    # mailing address

    IF MIR-CLI-ADDR-TYP-CD-T[1] == ""
    {
        MIR-CLI-ADDR-TYP-CD = "PR";

        BRANCH RetrieveList;

    }


    # if the policy record field is not blank, then a value (perhaps
    # PR, perhaps other) exists and we will retrieve the mailing address
    # that corresponds to the owner relationship.

    MIR-CLI-ADDR-TYP-CD = MIR-CLI-ADDR-TYP-CD-T[1];

    STEP RetrieveList
    {
        USES P-STEP "BF4913-P";
        MIR-CLI-ID-T[1] -> MIR-CLI-ID;

        # prevent a return to the main flow of the field
        # mir-dv-cli-nm, which could be confused with
        # a name returned by a search process.

        MIR-DV-OWN-CLI-NM-T[1] <- MIR-DV-CLI-NM;
    }

    IF LSIR-RETURN-CD == "01" || LSIR-RETURN-CD == "02" || LSIR-RETURN-CD == "05"
        EXIT;


    MailAddressLine-T[1] = MIR-CLI-ADDR-LN-1-TXT-T[1];
    MailAddressLine-T[2] = MIR-CLI-ADDR-LN-1-TXT-T[2];
    MailAddressLine-T[3] = MIR-CLI-ADDR-LN-1-TXT-T[3];
    MailAddressLine-T[4] = MIR-CLI-ADDR-LN-1-TXT-T[4];
    MailAddressLine-T[5] = MIR-CLI-ADDR-LN-1-TXT-T[5];
    MailAddressLine-T[6] = MIR-CLI-ADDR-LN-1-TXT-T[6];
    MailAddressLine-T[7] = MIR-CLI-ADDR-ADDL-TXT;
}

