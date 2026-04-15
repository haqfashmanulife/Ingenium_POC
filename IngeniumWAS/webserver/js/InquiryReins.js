// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   InquiryReins.js                                              *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Author  Description                                      *
//*                                                                            *
//*  TLB15C  MAR 14   CTS     Select checkbox disabling and enabling           *
//*  TL1109  JUL 06   CTS     Defect Fix for TLB-1109                          *
//*  ON1692  JUL 06   CTS     Defect Fix for ON1692                            *
//******************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom scripts for BF.htm   
//
//-----------------------------------------------------------------------------
//
//  Function:       SelectionCheck
//
//  Description:    To enable or disable the select checkbox 
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function SelectionCheck()
{
	numRows = document.all["ReinsInfo"].rows.length-2;

	for (i=1; i<= numRows; i++)
	{
//ON1692 CHANGES BEGIN
//TL1109 CHANGES BEGIN
//		if (document.all["MIR-PLAN-ID-T[" + i + "]"].value == "")
//		if (document.all["MIR-PLAN-ID-T[" + i + "]"].value == "32010")
//		|| (document.all["MIR-PLAN-ID-T[" + i + "]"].value == "32020")
//		|| (document.all["MIR-PLAN-ID-T[" + i + "]"].value == "32030")
		if (i === 1)

		{
			document.all["SELECT-T[" + i + "]"].disabled = false; // Always enable checkbox 1
		}
		else
		{
			document.all["SELECT-T[" + i + "]"].disabled = true;  // Disable all others
		}
//TL1109 CHANGES BEGIN
//ON1692 CHANGES END
	}
}