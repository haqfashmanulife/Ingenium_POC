// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//**************************************************************************************
//*  Component:   BF9F92.js                                                            *
//*  Description:                                                                      *
//*                                                                                    *
//**************************************************************************************
//*  Chg#    Release  Author  Description                                              *
//*                                                                                    *
//*          APR 04   CTS     ENABLE AND DISABLE OF FIELDS                             *
//*CA02CR    24APR19  CTS     CHANGES DONE FOR CR36 AND CR41                           *
//*23774A    10APR22  CTS     Changes done for ie retirement project to make it        *
//*                           compatible for microsoft edge. Changes in html include   *
//*                           adding "id" attribute for all input fields and changes in*
//*                           java scripts to modify certain functions/commands which  *
//*                           are no longer compatilble with edge.                     *
//**************************************************************************************
//-----------------------------------------------------------------------------
//
//  Custom scripts for BF9F92FB.htm   
//
//-----------------------------------------------------------------------------
//
//  Function:       BankdetailsCheck
//
//  Description:    Determine if Credit card details are required
//                  disable certain fields. 
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function BankdetailsCheck()
{	
mprem = document.getElementById("MIR-POL-MPREM-AMT").innerText;

		if ((document.getElementById("MIR-POL-BILL-TYP-CD").value == "C") ||
		(mprem == "￥0") || (mprem == "USD0.00") || (mprem == "AUD0.00"))

		{
	                document.getElementById("MIR-BNK-ID-1").value="  ";
		        document.getElementById("MIR-BNK-NM-1").value="   ";
		        document.getElementById("MIR-BNK-BR-ID-1").value="   ";
		        document.getElementById("MIR-BNK-BR-NM-1").value="   ";
			document.getElementById("MIR-BNK-ACCT-TYP-CD-1").value="   ";
			document.getElementById("MIR-BNK-ACCT-ID-1").value="   ";
			document.getElementById("MIR-BNK-ACCT-HLDR-NM-1").value="   ";
			document.getElementById("MIR-BNK-ID-1").disabled=true;
			document.getElementById("MIR-BNK-NM-1").disabled=true;
			document.getElementById("MIR-BNK-BR-ID-1").disabled=true;
			document.getElementById("MIR-BNK-BR-NM-1").disabled=true;
			document.getElementById("MIR-BNK-ACCT-TYP-CD-1").disabled=true;
			document.getElementById("MIR-BNK-ACCT-ID-1").disabled=true;
			document.getElementById("MIR-BNK-ACCT-HLDR-NM-1").disabled=true;
		}
		else
		{
			document.getElementById("MIR-BNK-ID-1").disabled=true;
			document.getElementById("MIR-BNK-NM-1").disabled=true;
			document.getElementById("MIR-BNK-BR-ID-1").disabled=true;
			document.getElementById("MIR-BNK-BR-NM-1").disabled=true;
			document.getElementById("MIR-BNK-ACCT-TYP-CD-1").disabled=false;
			document.getElementById("MIR-BNK-ACCT-ID-1").disabled=false;
			document.getElementById("MIR-BNK-ACCT-HLDR-NM-1").disabled=false;
			
			
		}

	return;

}


















































































