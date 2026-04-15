// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:02 PM EDT
//******************************************************************************
//*  Component:   AppAllocationsUL.js                                         *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016423  602J     New for release 602J                                     *
//*  PF30    PF 3.0   Manual changes for array format after conversion         *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
//******************************************************************************
 
//******************************************************************************
// THE SOFTWARE COMPRISING THIS SYSTEM IS THE PROPERTY OF INSURANCE SOFTWARE
// SOLUTIONS CORP. OR ITS LICENSORS.
//
// ALL COPYRIGHT, PATENT, TRADE SECRET, AND OTHER INTELLECTUAL PROPERTY RIGHTS
// IN THE SOFTWARE COMPRISING THIS SYSTEM ARE, AND SHALL REMAIN, THE VALUABLE
// PROPERTY OF INSURANCE SOFTWARE SOLUTIONS CORP. OR ITS LICENSORS.
//
// USE, DISCLOSURE, OR REPRODUCTION OF THIS SOFTWARE IS STRICTLY PROHIBITED,
// EXCEPT UNDER WRITTEN LICENSE FROM INSURANCE SOFTWARE SOLUTIONS CORP. OR ITS
// LICENSORS.
// 
// (C) COPYRIGHT 1999 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED
//******************************************************************************


//-----------------------------------------------------------------------------
//
//  Functions for the AppAllocationsUL.htm page
//
//-----------------------------------------------------------------------------

var bSubAllocation = true;
var bDCA = false;
var undefined;  // special value to allow detection of undefined values

//-----------------------------------------------------------------------------
//
//  Function:       onLoadAppAllocationsUL()
//
//  Description:  Custom onload handler.  Restore U.I. state based on
//                      settings of radios buttons, and recalculate percentages.
//
//  Arguments:  none
//
//  Returns:  Nothing
//
//-----------------------------------------------------------------------------

function onLoadAppAllocationsUL()
{
  // Simulate click on appropriate InitialSubsequent radio button to restore state.
  if (inputForm.InitialSubsequent[0].checked)
  {
    inputForm.InitialSubsequent[0].click();
  }
  else
  {
    inputForm.InitialSubsequent[1].click();
  }

  // Simulate click on appropriate DollarCostAvg radio button to restore state.
  if (inputForm.DollarCostAvg[0].checked)
  {
    inputForm.DollarCostAvg[0].click();
  }
  else
  {
    inputForm.DollarCostAvg[1].click();
  }

  // If INDEX contains a valid value, use it to restore appropriate "From" checkbox.
  // This will typically happen if the user proceeded to the next screen,
  // then returned by way of the "PREVIOUS" button.
  if (undefined !== document.forms[0].index)
  {
    ctl = document.getElementById("index");

    if (null != ctl.value && "" != ctl.value && "0" != ctl.value)
    {
      document.getElementById("SELECT-T[" + ctl.value + "]").checked = true;
    }
  }

  // Calculate total percentages.  Should be 0 on entry, but not on re-entry.
  TotalPercentages('allocationTable', 1, 'Total_Initial_Pct');
  TotalPercentages('allocationTable', 2, 'Total_Subseq_Pct');
  TotalPercentages('allocationTable', 4, 'Total_SourceFund_Pct');
}

//-----------------------------------------------------------------------------
//
//  Function:       disableAllocationColumn2
//
//  Description:    Enable or disable the second allocation column for input
//                      If asset rebalance, then disable the column for input;
//                      otherwise, enable the column for input
//
//  Arguments:      ctl - subsequent allocation radio button that has been checked
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function disableAllocationColumn2(ctl)
{
  allocTable = document.getElementById("allocationTable");

  if (allocTable != null)
  {
    // Do not allow allocation column 2 for input if asset rebalancing
    if (ctl.value == "Y")
    {
      bSubAllocation = true;

      for (i = 1; i < allocTable.rows.length; i++)
      {
        allocTable.rows[i].cells[2].children[0].readOnly = true;
        allocTable.rows[i].cells[2].children[0].tabIndex = "-1";

        // Copy the value of column 1 to column 2
        duplicateColumnValue(allocTable.rows[i].cells[1].children[0]);
      }

      // Subsequent allocation should equal initial allocation
      inputForm.Total_Subseq_Pct.value = inputForm.Total_Initial_Pct.value;
    }
    else
    {
      bSubAllocation = false;

      for (i = 1; i < allocTable.rows.length; i++)
      {
        allocTable.rows[i].cells[2].children[0].readOnly = false;
        allocTable.rows[i].cells[2].children[0].tabIndex = "0";
      }
    }

  }
}

//-----------------------------------------------------------------------------
//
//  Function:       hideSourceFundColumns
//
//  Description:    Show or Hide the last two columns
//                      If DCA, then show the last two columns;
//                      otherwise, hide the last two columns
//
//  Arguments:      ctl - dollar cost averaging radio button that has been checked
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function hideSourceFundColumns(ctl)
{
  allocTable = document.getElementById("allocationTable");
  totalTable = document.getElementById("totalPercentagesTable");

  if (allocTable != null)
  {
    // Hide the last two columns for dollar cost averaging
    if (ctl == null || ctl.value == "N")
    {
      bDCA = false;
      for (i = 0; i < allocTable.rows.length; i++)
      {
        aRow = allocTable.rows[i];
        aRow.cells[4].children[0].value = "0%";
        aRow.cells[4].style.display = "none";
        aRow.cells[3].style.display = "none";
      }

      // Hide the source fund total percentages table
      totalTable.rows[0].cells[4].style.display = "none";
      totalTable.rows[0].cells[5].style.display = "none";

      // Make sourcefund percentage no mandatory so edit will be bypassed
      // document.getElementById("Total_SourceFund_Pct").setAttribute("mandatory","no");

      // Erase the source fund total percentages
      totalTable.rows[0].cells[5].children[0].value = "0";
    }
    if (ctl != null && ctl.value == "Y")
    {
      bDCA = true;
      for (i = 0; i < allocTable.rows.length; i++)
      {
        aRow = allocTable.rows[i];
        aRow.cells[4].style.display = "";
        aRow.cells[3].style.display = "";
      }
    
      // Show the source fund total percentages table
      totalTable.rows[0].cells[4].style.display = "";
      totalTable.rows[0].cells[5].style.display = "";

      // Make sourcefund percentage mandatory so edit will happen
      // document.getElementById("Total_SourceFund_Pct").setAttribute("mandatory","yes");

      // scroll to the first check box for ease of use
      allocTable.rows[0].cells[3].children[0].scrollIntoView();
      allocTable.rows[1].cells[3].children[0].focus();
    }
  }
}

//-----------------------------------------------------------------------------
//
//  Function:       duplicateColumnValue 
//
//  Description:    Copy the allocation in column 1 to column 2
//                      if asset rebalancing
//
//  Arguments:      ctl - allocation in column 1
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function duplicateColumnValue(ctl)
{
  if (bSubAllocation)
  {
    ctlName = ctl.name;
    // what is the index of this field in the table
    lastDash = ctlName.lastIndexOf("[");
    ctlIndex = ctlName.substr(lastDash + 1);
    
          col2Name = "MIR-CDI-ALLOC-PCT-S-T[" + ctlIndex;
    // Copy the value over to column 2; value should already be formatted
    document.getElementById(col2Name).value = ctl.value;
  }
}

//-----------------------------------------------------------------------------
//
//  Function:       copyOver 
//
//  Description:    Copy the allocation in column 1 to column 2
//                      if subsequent Initial is set to yes
//
//  Arguments:      ctl - allocation in column 1
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function copyOver(ctl)
{
  if (bSubAllocation)
  {
    ctlName = ctl.name;
    // what is the index of this field in the table
    lastDash = ctlName.lastIndexOf("[");
    ctlIndex = ctlName.substr(lastDash + 1);
    
    col2Name = "MIR-CDI-ALLOC-PCT-S-T[" + ctlIndex;
    // Copy the value over to column 2; value should not yet be formatted, so
    // create the right format
    var afield = new Field(ctl);
    document.getElementById(col2Name).value = NumberFormat(afield);
  }
}

//-----------------------------------------------------------------------------
//
//  Function:       selectSourceFund
//
//  Description:    Disable amount / percent if the associated source fund is
//                      selected
//
//  Arguments:      nothing
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function selectSourceFund()
{
  if (bDCA)
  {
    var source = window.event.target;
    var thisIndex = source.getAttribute("Index");
                var sourceFundPercentName = "MIR-CDI-ALLOC-AMT-T[";

    // If the checkbox doesn't have an Index attribute...

    if (thisIndex == null)
    {
      return;
    }

    // Find out if a row was previously checked.

    var previousIndex = inputForm.index.value;

    if (previousIndex > 0)
    {
      // If a previous row was checked, then we have to turn it off.
      // We'll build a field name by parsing the name of the field
      // that just got checked.

      var previousCheckedField = source.name;
                        var tokenStart = previousCheckedField.search("-T");
  
      // Build the name of the previously checked field by isolating
      // the characters before (and including) the "-T[" characters and 
      // adding the previous index to the end.

               previousCheckedField = previousCheckedField.substr(0, tokenStart + 3) + previousIndex + "]";

      // Turn off the previously checked field
      document.getElementById(previousCheckedField).checked = false;

      // Enable the previous source percentage field
      document.getElementById(sourceFundPercentName + previousIndex + "]").readOnly = false;
      document.getElementById(sourceFundPercentName + previousIndex + "]").tabIndex = "0";
    }

    // the checkbox is now checked

    if (source.checked == true)
    {
      // Disable the source percentage field
      document.getElementById(sourceFundPercentName + thisIndex + "]").value = "0%";
      document.getElementById(sourceFundPercentName + thisIndex + "]").readOnly = true;
      document.getElementById(sourceFundPercentName + thisIndex + "]").tabIndex = "-1";

      inputForm.index.value = thisIndex;
    } 
    else
    {
      inputForm.index.value = 0;
    }
  }
}

//-----------------------------------------------------------------------------
//
//  Function:       TotalPercentages
//
//  Description:  Totals all of the subsequent percentage fields on the table.
//                  It will display the total in the field named Total_Subseq_Pct.
//
//  Arguments:  the table containing the subsequent percentages
//
//  Returns:  Nothing
//
//-----------------------------------------------------------------------------

function TotalPercentages(aTableName, columnIndex, percentageField)
{
  var aTable = document.getElementById(aTableName);
  var numOfRows = aTable.rows.length; // Get number of rows in the table
  var total=0;        // Used to keep a running total of the percentages

  // Loop through each row in the table.  We start at row 1 since row 0 is supposed to 
  // contain the heading.

  for (var i = 1; i < numOfRows; i++)
  {
    // The input box in each cell is a child of the cell.  We're assuming that there
    // is only one input box in each cell so we can hard-code children(0)

    var aRow = aTable.rows[i];
    var val1 = aRow.cells[columnIndex].children[0].value;

    // Parse the value of the input fields

    val1 = parseInt(val1, 10);

    // If the fields come back as NaN, then they aren't numbers.   Don't add them
    // to the total.

    if (!isNaN(val1))
      total += val1;

    // Display the total of all the percentage fields in the proper output field

    if (total == 0)
      document.getElementById(percentageField).value = "0";
    else
      document.getElementById(percentageField).value = total;
  }

  // If subsequent allocation is selected, allocation column 2 is disabled, hence onblur does not occur
  // but total initial should equal total subsequent
  if (bSubAllocation)
    inputForm.Total_Subseq_Pct.value = inputForm.Total_Initial_Pct.value;
}

//-----------------------------------------------------------------------------
//
//  Function:       toggleDCASection
//
//  Description:  Hide/undhide Dollar cost averaging section
//      setting mandatory status for MIR-POL-PAYO-EFF-DT and MIR-POL-PAYO-MODE-CD
//
//  Arguments:  none
//
//  Returns:  Nothing
//
//-----------------------------------------------------------------------------

function toggleDCASection()
{
  if (inputForm.DollarCostAvg[0].checked)
  {
    changeMandatoryFor(DCASection, "yes");
    DCASection.style.display = "Block";
  }
  else
  {
    changeMandatoryFor(DCASection, "no");
    DCASection.style.display = "none";
  }
}

//-----------------------------------------------------------------------------
//
//  Function:       processAssetRebalance
//
//  Description:  Processes the actions for the asset rebalance radio button
//
//  Arguments:      whether or not asset rebalance is required
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
//
//function processAssetRebalance(state)
//{
//  if (state == "Y")
//  {
//    document.getElementById("actionAssetRebalance").value = "Y";
//  }
//  else if (state == "N")
//  {
//    document.getElementById("actionAssetRebalance").value = "N";
//  }
//  else
//  {
//    // msg: wrong state
//    alert(getUserMessage(msgWrngState));
//  }
//}
//
//-----------------------------------------------------------------------------
//
//  Function:       processDCA
//
//  Description:  Processes the actions for the dollar cost averaging radio button
//
//  Arguments:      whether or not dollar cost averaging is required
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function processDCA(state)
{
  if (state == "Y")
  {
    document.getElementById("actionDCA").value = "Y";
  }
  else if (state == "N")
  {
    document.getElementById("actionDCA").value = "N";
  }
  else
  {
    // msg: wrong state
    alert(getUserMessage(msgWrngState));
  }
}

//-----------------------------------------------------------------------------
//
//  Function:       onSubmitCustom
//
//  Description:  Called before standard onSubmit function when form is
//                      going to be submitted. Will
//                      Check to see the total percentages equal 100%
//
//  Arguments:      none
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onSubmitCustom()
{
  if (document.getElementById("action").value != "ACTION_PREVIOUS")
  {
    if (document.getElementById("Total_Initial_Pct").value != "100")
    {
      // msg: Total initial percentage allocation not equal 100%
      alert(getUserMessage(msgTotInitPct));
      return false;
    }

    if (document.getElementById("Total_Subseq_Pct").value != "100")
    {
      // msg: Total subsequent percentage allocation not equal 100%
      alert(getUserMessage(msgTotSubseqPct));
      return false;
    }

    if (bDCA && document.getElementById("Total_SourceFund_Pct").value != "100")
    {
      // msg: Total transfer to percentage not equal 100%
      alert(getUserMessage(msgTotXferToPct));
      return false;
    }
  }

  // If percentages OK, call the onSubmit from ClientLevelEdits
  return onSubmit();
}

