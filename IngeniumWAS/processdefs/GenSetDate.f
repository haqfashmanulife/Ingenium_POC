# *  Description:                                                               *
# *                                                                             *
# *******************************************************************************
# *  Chg#    Release  Description                                               *
# *                                                                             *
# *  NWLPLP  CTS      POLICY LOAN PROCESSING                                    *
# *                                                                             *
# *******************************************************************************
INCLUDE "BF9A56-P.p";

PROCESS GenSetDate
{
  VARIABLES
  {
      OUT Datevalue;
  }

  STEP Getdate
  {
      USES P-STEP "BF9A56-P";
      Datevalue <- MIR-PRCES-DT;
  }

}