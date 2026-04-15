# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT
#*******************************************************************************
#*  Component:   BF9080-O.s                                                    *
#*  Description: Reset cancelled billing                                       *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN9547  CTS      COMMENTED OUT THE VARIABLE MIR-SEQ-NUM DUE TO THE         *
#*                   DUPLICATE DECLARATION                                     *
#*                                                                             *
#*******************************************************************************

S-STEP BF9085-O
{
	ATTRIBUTES
	{
		BusinessFunctionType = "Update";
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
		SType="Hidden";
	}

        INOUT MIR-POL-ID-BASE
        {
                Key;
                Mandatory;
                Length = "9";
                SType = "Text";
                Label = "Policy Id";
        }

        INOUT MIR-POL-ID-SFX
        {
                Key;
                Length = "1";
                SType = "Text";
                Label = "Suffix";
        }

        INOUT MIR-APPL-CTL-PRCES-DT 
        {
                Key;
                Length = "10";
                SType = "Date";
                Label = "Date";
        }

        INOUT MIR-SEQ-NUM 
        {
                Key;
                Length = "03";
                SType = "Text";
                Label = "Seq. Number";
        }

        IN MIR-BILL-TYP-CD 
        {
                DisplayOnly;
                Length = "15";
                CodeSource = "DataModel";
                CodeType = "BILL-TYP-CD";
                SType = "Text";
                Label = "Bill Method";
        }

        IN MIR-BILL-MODE-CD 
        {
                DisplayOnly;
                Length = "15";
                CodeSource = "DataModel";
                CodeType = "BILL-MODE-CD";
                SType = "Text";
                Label = "Bill Mode";
        }

        IN MIR-DRW-STAT-CD
        {
                DisplayOnly;
                Length = "15";
                CodeSource = "DataModel";
                CodeType = "DRW-STAT-CD";
                SType = "Text";
                Label = "Status";
        }

        IN MIR-PREV-UPDT-DT 
        {
                DisplayOnly;
                Length = "10";
                SType = "Date";
                Label = "Status Date";
        }

        IN MIR-A-RECPT-XPRY-DT 
        {
                DisplayOnly;
                Length = "10";
                SType = "Date";
                Label = "A Receipt Expiry Date";
        }

        IN MIR-DRW-DT 
        {
                DisplayOnly;
                Length = "10";
                SType = "Date";
                Label = "Draw Date";
        }

        IN MIR-CLI-ID 
        {
                DisplayOnly;
                Length = "10";
                SType = "Text";
                Label = "Payor ID";
        }

        IN MIR-CLI-NM 
        {
                DisplayOnly;
                Length = "30";
                SType = "Text";
                Label = "Name";
        }

        IN MIR-PAYR-CLI-ID 
        {
                DisplayOnly;
                Length = "10";
                SType = "Text";
                Label = "Payor ID";
        }

        IN MIR-PAYR-CLI-NM 
        {
                DisplayOnly;
                Length = "30";
                SType = "Text";
                Label = "Name";
        }

        IN MIR-GR-CLI-ID 
        {
                DisplayOnly;
                Length = "10";
                SType = "Text";
                Label = "Payor ID";
        }

        IN MIR-GR-CLI-NM 
        {
                DisplayOnly;
                Length = "30";
                SType = "Text";
                Label = "Name";
        }

        IN MIR-PREM-AMT
        {
                DisplayOnly;
                Length = "13";
                SType = "Currency";
                Label = "Total Billed";
        }

        IN MIR-RECV-AMT 
        {
                DisplayOnly;
                Length = "13";
                SType = "Currency";
                Label = "Total Received";
        }

#EN9547 CHANGES START HERE
#        IN MIR-SEQ-NUM 
#        {
#                DisplayOnly;
#                Length = "03";
#                SType = "Text";
#                Label = "Seq. Number";
#        }
#EN9547 CHANGES END HERE
  
        IN MIR-UNSUCS-REASN-CD
        {
                DisplayOnly;
                Length = "01";
                CodeSource = "DataModel";
                CodeType = "UNSUCS-REASN-CD";
                SType = "Text";
                Label = "Unsuccessful Reason Code";
        }

        IN MIR-FND-SRC-CD
        {
                DisplayOnly;
                Length = "01";
                CodeSource = "DataModel";
                CodeType = "FND-SRC-CD";
                SType = "Text";
                Label = "Source of Funds";
        }

        IN MIR-PREM-RQST-QTY
        {
                DisplayOnly;
                Length = "02";
                SType = "Text";
                Label = "Number of Payments Requested";
        }

        IN MIR-PREM-COLCT-QTY
        {
                DisplayOnly;
                Length = "02";
                SType = "Text";
                Label = "Number of Payments Collected";
        }

        IN MIR-RECV-DT
        {
                DisplayOnly;
                Length = "10";
                SType = "Date";
                Label = "Payment Received Date";
        }

        IN MIR-TBL-HDR 
        {
                DisplayOnly;
                Length = "29";
                SType = "Text";
                Label = "Header";
        }




}
