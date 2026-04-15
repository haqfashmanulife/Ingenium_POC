# Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:12:02 PM EDT

#*******************************************************************************
#*  Component:   MoneyDetail.f                                                 *
#*  Description: Display Policy Value details using comprehensive calculations *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016053  6.1      New for release 6.1                                       *
#*  PF30    PF 3.0   Corrected VARIABLES braces {} after converion             *
#*                                                                             *
#*******************************************************************************
# Display Policy Value Details, allow for date change
# Retrieve Policy Values

INCLUDE "BF6981Money-O.s";
INCLUDE "MoneyDetail-P.p";

PROCESS MoneyDetail
{
  VARIABLES
  {
    IN MIR-POL-ID-BASE;

    IN MIR-POL-ID-SFX;

    # Initial quote effective date = Date from Owner List

    IN QuoteEffectiveDate;


    OUT ReturnAction;

    OUT ReturnDate;
  }

    Title = STRINGTABLE.IDS_TITLE_MoneyDetail;
    TitleBar = "TitleBar";
    TitleBarSize = "70";
    ButtonBar = "MoneyDetailButtonBar";
    ButtonBarSize = "40";
    MessageFrame = "MessagesDisp";
    MessageFrameSize = "70";


    # Initialize quote effective date

    IF QuoteEffectiveDate != ""
        MIR-APPL-CTL-PRCES-DT = QuoteEffectiveDate;

    ELSE
        MIR-APPL-CTL-PRCES-DT = LSIR-PRCES-DT;


    STEP QuoteDetail
    {
        USES P-STEP "MoneyDetail-P";
    }


    # LSIR-RETURN-CD will not be checked.  Error messages will be displayed.

    STEP DisplayDetail
    {
        USES S-STEP "BF6981Money-O";
    }


    # ButtonBarMoney will provide links to other processes, but the actions will
    # be invoked through PageServer calls using a new window and will not set a 
    # page action.  This window should remain open for reference.

    IF action == "ACTION_BACK" || action == "ACTION_CANCEL"
    {
        ReturnAction = action;
        ReturnDate = MIR-APPL-CTL-PRCES-DT;

        EXIT;

    }

    # Change the quote effective date - ACTION_NEXT = "REQUOTE"

    IF action == "ACTION_NEXT"
        BRANCH QuoteDetail;

}

