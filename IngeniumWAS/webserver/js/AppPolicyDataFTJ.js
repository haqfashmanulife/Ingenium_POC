// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:08 PM EDT
//******************************************************************************
//*  Component:   AppPolicyDataFTJ.js                                          *
//*  Description: Clone of AppPolicyDataUL.js                                  *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  016423  602J     New for release 602J                                     *
//*  B10132  WBP      Allow 'Search for Other' hyperlink on coverage 01        *
//*  P00001  EKM      Fix defaulting of insured name on coverages > 10         *
//*  02PR62  DPK      Joint to Single Change                                   *
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
//  Functions for the AppPolicyDataFTJ.htm page
//
//  Uses:  changeMandatoryFor() from ClientLevelEdits.js
//         convertToMIRNumber() from ClientLevelEdits.js
//         cleanString()        from ClientLevelEdits.js
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// The number of coverages originally sent by the server
//-----------------------------------------------------------------------------

var originalCvgCount = 0;

//-----------------------------------------------------------------------------
// The column numbers of various cells in the coverage table
//-----------------------------------------------------------------------------

var colProduct         = 0;
var colJointLifeType   = 7;
var colJointInsured    = 8;
var colJointSearch     = 9;
var colJointAppClients = 10;

//-----------------------------------------------------------------------------
//
//  Function:       onLoadCustom()
//
//  Description:  Custom onload handler. Hides all rows which have not been
//                  sent by the server. Also counts the  number of coverages
//                  sent by the server and applies special accessibility 
//                  rules for these rows.
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function onLoadCustom()
{

    originalCvgCount = 0; 
    var numCvg = getCvgTableSize();

  for (var index = 0; index < numCvg; index++)
  {
      var isOriginalRow = applyTheRequirements(index);
      
      // Count the original rows
      if (isOriginalRow)
      {
            originalCvgCount++;     
      } 
      else
        {
            var cvgNumber = document.getElementById("MIR-CVG-NUM-T[" + (index+1) + "]");
            
            // if the coverage has been added and we come back to this page 
            // for example after we picked the client the row should not be hidden
            if (cvgNumber.value != "")
            {
                // the coverage is newly added, leave it visible
                continue;
            }
            
            // Hide all the rows that are not sent by the server
            changeRowVisibility(index, false);
        }
  }

  // Show or hide column headers for Joint columns
  //GW showJointColumnHeaders();

    // Update the status of the add and remove buttons
    updateButtonsState();
  

  if (packagingIsTurnedOff())
  {
    // msg: "Warning - Product Packaging has not been enabled for the Product" + getBannerProductDesc() + ".  Navigation through this entry process expects Product Packaging to be turned on."
    alert (getUserMessage(msgPackagingPart1) + getBannerProductDesc() + getUserMessage(msgPackagingPart2));
  }
}

//-----------------------------------------------------------------------------
//
//  Function:       changeRowVisibility()
//
//  Description:  Changes the visibility of a specified row to visible or
//                  not
//
//  Arguments:      index the row's index
//                  makeVisible true or false
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function changeRowVisibility(index, makeVisibile)
{
    var cvgTable = getCvgTable();
    var row = cvgTable.rows.item(index+1);
    
    // Special care has to be taken for the mandatory fields.
    if (makeVisibile)
    {    
        row.style.display = "";
        changeMandatoryFor(row, "yes");
    }
    else
    {    
        changeMandatoryFor(row, "no");
        row.style.display = "none";
    }

  // Having hidden or revealed a row, we may need to hide or reveal the joint column headings.
  //GW showJointColumnHeaders();
}

//-----------------------------------------------------------------------------
//
//  Function:       isRowVisible()
//
//  Description:  Tests the visibility of a row
//
//  Arguments:      index the row's index
//
//  Returns:      true if the row is visible, false otherwise
//
//-----------------------------------------------------------------------------

function isRowVisible(index)
{
    var cvgTable = getCvgTable();
    return  cvgTable.rows.item(index+1).style.display != "none";
}


//-----------------------------------------------------------------------------
//
//  Function:       getCvgTable()
//
//  Description:  Returns a reference to the coverages table
//
//  Arguments:      None
//
//  Returns:      a reference to the coverages table
//
//-----------------------------------------------------------------------------

function getCvgTable()
{
    return document.getElementById("cvgTable");
}

//-----------------------------------------------------------------------------
//
//  Function:       getCvgTableSize()
//
//  Description:  Returns the coverages table's size
//
//  Arguments:      None
//
//  Returns:      the number of rows in the coverages table
//
//-----------------------------------------------------------------------------

function getCvgTableSize()
{
    var cgvTable = getCvgTable();
    // Substract one for the table header
  return cgvTable.rows.length - 1;
}

//-----------------------------------------------------------------------------
//
//  Function:       getBannerProductDesc()
//
//  Description:  Returns the product description from the banner frame, or
//          the empty string.
//
//  Arguments:      None
//
//  Returns:      The product description from the banner frame, or the
//          empty string
//
//-----------------------------------------------------------------------------

function getBannerProductDesc()
{
    var productDesc = "";

  var bannerFrame = getFrame("BannerFrame");
  
  if (bannerFrame != null)
  {
    var bannerID = getDocument(bannerFrame).getElementById("BannerProductID");
    if (bannerID != null)
    {
      productDesc = cleanString(bannerID.innerText);
    }
  }

  return productDesc;
}

//-----------------------------------------------------------------------------
//
//  Function:       countUsedRows()
//
//  Description:  counts how many of the table's rows are used already
//
//  Arguments:      None
//
//  Returns:      the number of used rows in the table
//
//-----------------------------------------------------------------------------

function countUsedRows()
{
    var numRows = getCvgTableSize();
    
  for (var rowIndex = 0; rowIndex < numRows; rowIndex++)
  {
      if (!isRowVisible(rowIndex))
      {
          break;
      }
  }
    return rowIndex;
}

//-----------------------------------------------------------------------------
//
//  Function:       updateButtonsState()
//
//  Description:  Enables or disables the add/remove buttons based on the 
//                  table size and the number of rows sent by the server
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function updateButtonsState()
{
    var numUsedRows = countUsedRows();

    if (numUsedRows == originalCvgCount)
    {
        // Disable the remove button since the user is not allowed to delete
        // the rows passed in by the server
        document.getElementById("DeleteCoverageButton").disabled = true;
    }
    else
    {
        document.getElementById("DeleteCoverageButton").disabled = false;
    }
    
    
  //
  // Determine if additional plans were allowed for the base product.  If not,
  // the Plan Selection Box for row 2 (and all other rows, for that matter)
  // will contain only 1 option entry whose value will be either "*" or "".
  //
  var noAdditionalPlansAllowed = false;
  var ctl = document.getElementById("MIR-PLAN-ID-T[2]");

  noAdditionalPlansAllowed =  (1 == ctl.length) &&
                (("*" == ctl.options[0].value) ||
                 (""  == ctl.options[0].value));

  //
  // Disable the Add button if:
  // 1. Packaging is turned off
  // 2. No "additional" plans are allowed for the base product
  // 3. We're already at max rows for the table
  //
    if (packagingIsTurnedOff()               ||
    noAdditionalPlansAllowed             ||
    (numUsedRows == getCvgTableSize()))
    {
        document.getElementById("AddCoverageButton").disabled = true;
    }
    else
    {
        document.getElementById("AddCoverageButton").disabled = false;
    }
}

//-----------------------------------------------------------------------------
//
//  Function:       applyTheRequirements()
//
//  Description:  The accessibility of a couple of controls on each row is 
//                  controlled by different indicators from the packaging matrix.
//
//          Determine if each row is an "original" row, i.e. one which
//          was already visible when the user last came to this screen.
//          This is determined by looking at the Additional Plan Mandatory
//          indicator.  If it is "Y", the plan was on the screen the first
//          time the user came to this screen.  If after that, the user
//          adds an optional policy, goes off to another screen, and then
//          returns (perhaps by using the "previous" button on the
//          succeeding screen for example) then the Additional Plan
//          Mandatory indicator will be "N".  This is an indication that
//          although the plan is not mandatory, it has already been
//          committed to the back-end database when the user last left
//          the screen, and so we cannot let the user delete the plan.
//
//          In short, if a user adds a plan on this screen, they may
//          delete it again immediately, but not after leaving this screen
//          and returning.
//
//
//          For the first row, the user will never be able to change the
//          Product ID.  Also, the drop-down being build by CodeServer
//          in the Product column of the table contains only Optional
//          products, wereas row 1 represent the always-required base
//          plan.  Thus, we must remove the drop-down from the Product
//          column of row 1 of the table.  We'll replace it with a static
//          text description of the base plan.
//
//
//          For the first row only, the following are unconditionally disabled:
//          - MIR-DV-INSRD-CLI-NM-T[1] (Primary Insured text box)
//          - PrimaryInsuredSelectionBox-T[1] (Select Application Clients drop-down)
//
//          For rows 2 through 5 only:
//          - If MIR-ADDL-PLAN-MAND-IND-T[x] is "Y"
//            - disable updates to MIR-PLAN-ID-T[x] (Product drop-down)
//          - If MIR-ADDL-PLAN-MAND-IND-T[x] is "N"
//            - allow updates to MIR-PLAN-ID-T[x] (Product drop-down)
//
//          For any row:
//          - If either MIR-PLAN-PKG-ADB-CD-T[x] or MIR-PLAN-PKG-WP-CD-T[x] is "N"
//            - disable updates to MIR-CVG-AD-FACE-AMT-T[x] (AD Face Amount
//              text box)
//            - disable updates to MIR-CVG-WP-IND-T[x] (WP Ind checkbox)
//          - If MIR-PLAN-PKG-WP-CD-T[x] is "M"
//            - select and disable updates to MIR-CVG-WP-IND-T[x] (WP Ind checkbox).
//            - ignore mandatory AD Face Amount requirement from packaging matrix,
//              since it may be overly restrictive should an app be received
//              without the required AD Amount.
//
//          - if MIR-DV-CVG-PLAN-JNT-IND-T[x] is "N"
//            - hide all four Joint-related fields:
//              - MIR-CVG-JNT-LIFE-CD-T[x] (Joint Life Type drop-down)
//              - MIR-DV-INSRD-CLI-NM-2-T[x] (Joint Insured text box)
//              - ChangeOtherLink-T[x] (Search for other Joint Insured link)
//              - JointInsuredSelectionBox-T[x] (second Select Application Clients drop-down)
//
//          - if MIR-DV-CVG-PLAN-JNT-IND-T[x] is "Y", show MIR-CVG-JNT-LIFE-CD-T[x]
//            (Joint Life Type drop-down.)
//
//          - determine if the remainder of the joint-related cells of the table
//            should be displayed
//
//
//  Arguments:      index - the row's index.  Used to construct the field name.
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function applyTheRequirements(index)
{
    var field, field2;
    var controllingFieldValue, controllingFieldValue2;
    
    // Skip the column header row
    var tIndex = index + 1; 
    
  var originalRow = false;
    
    document.getElementById("PrimaryInsuredSelectionBox-T[" + tIndex + "]").value = document.getElementById("MIR-INSRD-CLI-ID-T["   + tIndex + "]").value;
    document.getElementById("JointInsuredSelectionBox-T["   + tIndex + "]").value = document.getElementById("MIR-INSRD-CLI-ID-2-T[" + tIndex + "]").value;

  field                 = document.getElementById("MIR-PLAN-ID-T[" + tIndex + "]");
  controllingFieldValue = document.getElementById("MIR-ADDL-PLAN-MAND-IND-T[" + tIndex + "]").value;
  
  if (1   == tIndex ||          // Never let user delete first row
    "Y" == controllingFieldValue || 
    "N" == controllingFieldValue)
  {
    originalRow = true;    // Used to determine when to disable the Add / Remove rider buttons
  }

  
  if (1 == tIndex)
  {
    //
    // The MIR-PLAN-ID-T[x] selection list being built contains only optional
    // coverages.  Row 1 always represents the base plan, so for row 1
    // the selection list is invalid.  Therefore, we'll replace the contents of
    // the product cell in row 1 with static text showing the Plan Description 
    // which the user will then be unable to change.
    //
    firstPlanCell = document.getElementById("cvgTable").rows[1].cells[colProduct];
    firstPlanDesc = cleanString(document.getElementById("MIR-DV-PLAN-DESC-TXT-T[1]").value);
    
    firstPlanCell.innerText = ("" != firstPlanDesc) ? firstPlanDesc : "Description Unavailable";

    // 
    //
    // Disable these fields for row 1 unconditionally.
    // (Must use readonly for the textbox so that it will still get sent to the server.)
    //
    disableControl(document.getElementById("MIR-DV-INSRD-CLI-NM-T[1]"),true);
    //document.getElementById("MIR-DV-INSRD-CLI-NM-T[1]").readonly        = true;
    document.getElementById("PrimaryInsuredSelectionBox-T[1]").disabled = true;
    //document.getElementById("ChangeInsuredLink-T[1]").disabled          = true;   
    //document.getElementById("ChangeInsuredLink-T[1]").style.display     = "none";

  }
  
  if (tIndex > 1)
  {
    switch(controllingFieldValue)
    {
      case "Y":
        field.disabled = true;    // Disable updates to Product Selection box
        break;
      case "N":
        field.disabled = false;   // Allow use of Product Selection box
        break;
      case "":            // Allow blank values
        break;
      default:
        // msg: "Wrong value " + controllingFieldValue + " for the MIR-ADDL-PLAN-MAND-IND-T indicator " + tIndex
        alert (getUserMessage(msgWrngValu) + controllingFieldValue + getUserMessage(msgAddlPlanMandInd) + tIndex);
    }
  }

  // Apply to all rows

  // GW field                  = document.getElementById("MIR-CVG-AD-FACE-AMT-T[" + tIndex + "]");
  // GW field2                 = document.getElementById("MIR-CVG-WP-IND-T["      + tIndex + "]");

  // GW controllingFieldValue  = document.getElementById("MIR-PLAN-PKG-ADB-CD-T[" + tIndex + "]").value;
  // GW controllingFieldValue2 = document.getElementById("MIR-PLAN-PKG-WP-CD-T["  + tIndex + "]").value;

  //
  // If either Plan Pkg Adb Cd or Plan Pkg Wp Cd are "N", then these benefits may not
  // be selected.  Disable updates to Cvg Ad Face Amt and Cvg Wp Ind.
  //
  // disabling these fields has been commented out

  //if ("N" == controllingFieldValue ||
  //  "N" == controllingFieldValue2)
  //{
  //  //field.disabled  = true;
  //  //inhibitCheckbox(field2);
  //  disableControl(field);
  //  disableControl(field2);
  //}

  //
  // If Plan Pkg Wp Cd is "M", the benefit must be selected and cannot be changed.
  // Select and disable updates to Cvg Wp Ind.  
  //
  // Also, ignore the mandatory AD Face Amount requirement from the Packaging Matrix,
  // since it may be overly restrictive should an app be received without the required 
  // AD amount.
  //
  // GW if ("M" == controllingFieldValue2)
  // GW {
  // GW  field2.checked  = true;
    //inhibitCheckbox(field2);
  //  disableControl(field2);
  // GW  field.setAttribute("mandatory", "no");
  // GW }

  // deal with the (admittedly remote) possibility that there is joint data on a plan
  // that doesn't allow joint (this can happen if plans are changed).
  // GW if ("N" == controllingFieldValue)
  // GW{
    // remove joint information if present
    // GW var jointLifeCd = document.getElementById("MIR-CVG-JNT-LIFE-CD-T[" + tIndex + "]").value;
    // GW if ("F" == jointLifeCd || "L" == jointLifeCd)
    // GW {
    // GW   document.getElementById("MIR-CVG-JNT-LIFE-CD-T["    + tIndex + "]").value     = "N";
    // GW   document.getElementById("MIR-CVG-LIVES-INSRD-CD-T[" + tIndex + "]").value     = 1;
    // GW   document.getElementById("MIR-DV-INSRD-CLI-NM-2-T["  + tIndex + "]").setAttribute("mandatory", "no");
    // GW   document.getElementById("MIR-DV-INSRD-CLI-NM-2-T["  + tIndex + "]").value     = "";
    // GW   document.getElementById("MIR-INSRD-CLI-ID-2-T["     + tIndex + "]").value     = "*";
    // GW }
  // GW }


  // GW controllingFieldValue  = document.getElementById("MIR-DV-CVG-PLAN-JNT-IND-T[" + tIndex + "]").value;

  // Show or hide Joint Life Type Cell, based on controlling field...
  // GW showJointLifeTypeCell (tIndex, controllingFieldValue);

  // ...then determine whether or not to show the other joint-related cells based on 
  // the current selection of the Joint Life Type drop down.
  // GW showOtherJointCells (tIndex);

   return originalRow; 

 }


//-----------------------------------------------------------------------------
//
//  Function:       addCoverage()
//
//  Description:  adds a new row at the end of the coverages table 
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function addCoverage()
{
  var numUsedRows = countUsedRows();

    // This code is execute only if there are still hidden rows

    changeRowVisibility(numUsedRows, true);
    
    // The process driver requires the 00 value in the coverage number to 
    // identify it as a new coverage
    document.getElementById("MIR-CVG-NUM-T[" + (numUsedRows + 1) + "]").value = "00";
    

    updateButtonsState();
}


//-----------------------------------------------------------------------------
//
//  Function:       deleteCoverage()
//
//  Description:  deletes the last row of the coverages table 
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

function deleteCoverage()
{
  var numUsedRows = countUsedRows()

    // This code is execute only if the user is allowed to delete a coverage 
    // I.E. the coverage was added by the user.
    // The Delete button is disabled for the original coverages

    var cvgTable = getCvgTable();
        
    // msg: Are you sure you want to delete this coverage?
    if (confirm(getUserMessage(msgCvgDelConfirm)))
    {
      changeRowVisibility(numUsedRows-1, false);

      // Clean up any data the user might have entered
    document.getElementById("MIR-CVG-NUM-T["                + numUsedRows + "]").value = "";
    document.getElementById("MIR-PLAN-ID-T["                + numUsedRows + "]").value = "";
// GW     document.getElementById("MIR-CVG-AD-FACE-AMT-T["        + numUsedRows + "]").value = "";
    document.getElementById("MIR-CVG-FACE-AMT-T["           + numUsedRows + "]").value = "";
    document.getElementById("MIR-INSRD-CLI-ID-T["           + numUsedRows + "]").value = "";
    document.getElementById("MIR-DV-INSRD-CLI-NM-T["        + numUsedRows + "]").value = "";
    document.getElementById("MIR-INSRD-CLI-ID-2-T["         + numUsedRows + "]").value = "";
    document.getElementById("MIR-DV-INSRD-CLI-NM-2-T["      + numUsedRows + "]").value = "";
    document.getElementById("PrimaryInsuredSelectionBox-T[" + numUsedRows + "]").value = "";
    document.getElementById("JointInsuredSelectionBox-T["   + numUsedRows + "]").value = "";
// GW     document.getElementById("MIR-CVG-JNT-LIFE-CD-T["        + numUsedRows + "]").value = "";
    
// GW     showOtherJointCells(numUsedRows);  // Refresh display of other joint-related fields
    updateButtonsState();
    }
}


//-----------------------------------------------------------------------------
//
//  Function:   onChangeInsured(nameFieldName, idFieldName)
//
//  Description:  When an insured is selected from the people on the
//          policy selection box, set the insured name fields
//
//  Arguments:    nameFieldName - the name of the insured name field
//          idFieldName - the name of the insured id field
//          
//          These nameFieldName and idFieldName should be 
//          just the rooot of the name, without -T[n]
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function onChangeInsured(nameFieldName, idFieldName)
{
  
  var selectionBox = window.event.target;

  var selectionBoxName = selectionBox.name;

// P00001 problem on index value greater than 10.
// P00001 var index = parseInt(selectionBoxName.substr(selectionBoxName.length - 1, 1), 10); 
  
  var index = parseInt(selectionBoxName.substr(selectionBoxName.lastIndexOf("-T[")+3 + "]"), 10);


  // set insured id field to the value of payor selection box
  document.getElementById(idFieldName + "-T[" + index + "]").value = selectionBox.value;


  // set payor name field to description of payor id
  var length = selectionBox.options.length;

  for (var optionNum = 0; optionNum < length; optionNum++)
  {
    var option = selectionBox.options[optionNum]; 
    if (option.selected)
    {
      document.getElementById(nameFieldName + "-T[" + index + "]").value = option.text;
      break;
    }
  }
}

//-----------------------------------------------------------------------------
//
//  Function:   onChangeJointLifeType()
//
//  Description:  If Joint Life Type is changed to "L" or "F", for that row:
//          - reveal the other Joint-related fields
//          - set Lives Insured Code to 2
//          - set Joint Insured field to mandatory (but allow them off the
//            page to do the search)
//          If Joint Life Type is changed to "" or "N", for that row:
//          - hide the other Joint-related fields
//          - reset Lives Insured Code to 1
//          - reset mandatory status of Joint Insured Field
//          - blank out Insured Client Name 2
//          - reset Insured Client ID 2 field to "*"
//
//  Arguments:    None
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

function onChangeJointLifeType()
{
// GW   var selectionBox       = window.event.srcElement;
// GW   var selectionBoxChoice = selectionBox.options[selectionBox.selectedIndex];
// GW   var index              = parseInt(selectionBox.name.substr(selectionBox.name.length-1, 1), 10);

// GW   if (("F" == selectionBoxChoice.value) ||
// GW     ("L" == selectionBoxChoice.value))
// GW   {
// GW    showOtherJointCells(index, "Y");

    document.getElementById("MIR-CVG-LIVES-INSRD-CD-T[" + index + "]").value= 2;
    document.getElementById("MIR-DV-INSRD-CLI-NM-2-T["  + index + "]").madatory = "yes";
// GW   }
// GW   else if ((""  == selectionBoxChoice.value) ||
// GW        ("N" == selectionBoxChoice.value))
// GW   {
// GW    showOtherJointCells(index, "N");

// GW    document.getElementById("MIR-CVG-LIVES-INSRD-CD-T[" + index + "]").value     = 1;
// GW    document.getElementById("MIR-DV-INSRD-CLI-NM-2-T["  + index + "]").setAttribute("mandatory", "no");
// GW    document.getElementById("MIR-DV-INSRD-CLI-NM-2-T["  + index + "]").value     = "";
// GW    document.getElementById("MIR-INSRD-CLI-ID-2-T["     + index + "]").value     = "*";
// GW   }

// GW   showJointColumnHeaders();
}

//-----------------------------------------------------------------------------
//
//  Function:       onSubmitCustom
//
//  Description:  Called before standard onSubmit function when form is
//          going to be submitted. 
//          Will check to see the Cvg Face Amt is not 0.
//
//  Arguments:      none
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------

function onSubmitCustom()
{
// For SPR62 (Joint to Single Change), we needed to block out the face amount
// check where the user must enter an amount greater than zero.  SPR62, requires
// that zero face amounts are okay, so I will comment out code.
//if (("ACTION_PREVIOUS" == document.getElementById("action").value) ||
//  ("ACTION_NEXT"     == document.getElementById("action").value))
//{
//
//  var numUsedRows = countUsedRows();
//
//  for (var rowIndex = 2; rowIndex <= numUsedRows; rowIndex++)
//  {
//    field          = document.getElementById("MIR-CVG-FACE-AMT-T[" + rowIndex + "]");
//    fieldValue     = field.value;
//    fieldMaxLength = field.elength;
//
//    if (parseFloat(convertToMIRNumber(fieldValue, fieldMaxLength)) < 0.01)
//    {
//      // msg: Amount of Insurance must be entered in the Face Amount field
//      alert (getUserMessage(msgFaceAmtReqd));
//      return false;
//    }
//  }

  // If everything's OK, call the onSubmit from ClientLevelEdits
  var ret = onSubmit();

  // If we passed onSubmit() and we're going to send values back to the server,
  // we have to re-enable any plans that were disabled so that their values go
  // back to the server (disabled controls don't send a value back to the server) 
  if (ret)
  {
    var numRows = getCvgTableSize();
    for (rowIndex = 2; rowIndex <= numRows; rowIndex++)
    {
      field = document.getElementById("MIR-PLAN-ID-T[" + rowIndex + "]");
      field.disabled = false;
    }
  }
  
  return ret;
}

//-----------------------------------------------------------------------------
//
//  Function:   showJointColumns(display)
//
//  Description:  Displays/hides the Joint-related cells in all rows of 
//          the table.
//
//  Arguments:    makeVisible - Y or N as a string.
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------

// function showJointColumns(makeVisible)
// {
//   var table   = document.getElementById("cvgTable");
//   var numRows = getCvgTableSize();
  
//   for (var index = 0; index < numRows; index++)
//   {
//     showOtherJointCells(index, makeVisible);
//   }
// }

//-----------------------------------------------------------------------------
//
//  Function:   showOtherJointCells(index, [ makeVisible ])
//
//  Description:  Displays/hides the Joint-related cells in a given row of
//                  the table.
//
//  Arguments:    index       - the row number on which to hide or show cells
//
//  OPTIONAL:   makeVisible - if present, then values of Y or N will force
//                  the remaining Joint-related fields on the
//                  given row to be shown or hidden, as appropriate.
//                  If not present, the function will check the
//                  current setting of the JointLifeType selection
//                  box on the given row, and if either "F" or "L"
//                  are chosen will show the remaining Joint-related
//                  cells, otherwise the function will hide them.
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------
//function showOtherJointCells (index, makeVisible)
//{
//  var row                = document.getElementById("cvgTable").rows[index];

//  var jointInsured       = row.cells[colJointInsured];
//  var jointSearch        = row.cells[colJointSearch];
//  var jointAppClients    = row.cells[colJointAppClients];

//  var selectionBox       = document.getElementById("MIR-CVG-JNT-LIFE-CD-T[" + index + "]");
//  var selectionBoxChoice = selectionBox.options[selectionBox.selectedIndex];

  //
  // Base the choice of whether to show or hide on the makeVisible parm, if
  // it was passed in, otherwise base the decision on the current selection
  // of the Joint Life Type drop down.
  //
//  if (arguments.length > 1)
//  {
//    showFields = makeVisible;
//  }
//  else
//  {
//    if (("F" == selectionBoxChoice.value) ||
//      ("L" == selectionBoxChoice.value))
//    {
//      showFields = "Y"
//    }
//    else
//    {
//      showFields = "N"
//    }
//  }

  
//  if ("N" == showFields)
//  {
//    jointInsured.style.display    = "none";
//    jointSearch.style.display     = "none";
//    jointAppClients.style.display = "none";
//  }
//  else if ("Y" == showFields)
//  {
//    jointInsured.style.display    = "";
//    jointSearch.style.display     = "";
//    jointAppClients.style.display = "";
//  }
//}

//-----------------------------------------------------------------------------
//
//  Function:   showJointLifeTypeCell(index,display)
//
//  Description:  Displays/hides the Joint Life Type cell in a given row of
//                  the table.
//
//  Arguments:    index       - the row number on which to hide the cell
//          makeVisible - Y or N as a string.
//
//  Returns:    Nothing
//
//-----------------------------------------------------------------------------
// GW function showJointLifeTypeCell (index, makeVisible)
// GW {
// GW  var cell = document.getElementById("cvgTable").rows[index].cells[colJointLifeType];

// GW   if ("N" == makeVisible)
// GW {
// GW     cell.style.display = "none";    
// GW   }
// GW   else if ("Y" == makeVisible)
// GW   {
// GW     cell.style.display = "";        
// GW   }
  
// GW   showJointColumnHeaders()
// GW }


//-----------------------------------------------------------------------------
//
//  Function:       thereAreVisibleJointLifeTypes()
//
//  Description:  Determines if any rows have visible Joint-related cells
//          by looking at the Joint Life Type cell.  (If any joint
//          cells are visible, that one will be.)
//
//  Arguments:      None
//
//  Returns:      true if there are any visible joint-related cells, false
//          otherwise.
//
//-----------------------------------------------------------------------------

//function thereAreVisibleJointLifeTypes()
//{
//    var numRows = getCvgTableSize();
//  var table   = document.getElementById("cvgTable");

//  for (var rowIndex = 1; rowIndex < numRows; rowIndex++)
//  {
//    row  = table.rows[rowIndex];
//    cell = row.cells[colJointLifeType];

//      if ((row.style.display  != "none") &&
//      (cell.style.display != "none"))
//      {
//          return true;
//      }
//  }
//    return false;
//}

//-----------------------------------------------------------------------------
//
//  Function:       thereAreVisibleLorFChoices()
//
//  Description:  Determines if any rows have visible Joint Life Type cells
//          for which an "L" or "F" choice has been made.  (This can
//          be used to determine if the headings for the last three
//          table columns should be shown.)
//
//  Arguments:      None
//
//  Returns:      true if there are any visible Joint Life Type cells with
//          "L" or "F" choices, false otherwise.
//
//-----------------------------------------------------------------------------

// gw function thereAreVisibleLorFChoices()
// gw {
// gw     var numRows = getCvgTableSize();
// gw   var table   = document.getElementById("cvgTable");

// gw   for (var rowIndex = 1; rowIndex <= numRows; rowIndex++)
// gw   {
// gw     row      = table.rows[rowIndex];
// gw     cell     = row.cells[colJointLifeType];
// gw     ctl      = document.getElementById("MIR-CVG-JNT-LIFE-CD-T[" + rowIndex + "]");
// gw    ctlValue = ctl.options[ctl.selectedIndex].value;

// gw      if ((row.style.display  != "none") &&
// gw       (cell.style.display != "none") &&
// gw       ("L" == ctlValue || "F" == ctlValue))
// gw       {
// gw          return true;
// gw       }
// gw   }
// gw     return false;
// gw }

//-----------------------------------------------------------------------------
//
//  Function:       showJointColumnHeaders()
//
//  Description:  Either shows or hides the column headers for the 
//          joint-related columns, based on whether any of the table
//          rows have any visible joint-related cells.
//
//  Arguments:      None
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------

//function showJointColumnHeaders()
//{
//  var row = document.getElementById("cvgTable").rows[0];
  
//  var jointLifeType   = row.cells[colJointLifeType];
//  var jointInsured    = row.cells[colJointInsured];
//  var jointSearch     = row.cells[colJointSearch];
//  var jointAppClients = row.cells[colJointAppClients];

//  if (thereAreVisibleJointLifeTypes())
//  {
//    // Show the Joint Life Type column header
//    jointLifeType.style.display   = "";

//    if (thereAreVisibleLorFChoices())
//    {
//      // Only show other joint-related headers, if
//      // there is at least one visible "L" or "F" choice...
//      jointInsured.style.display    = "";
//      jointSearch.style.display     = "";
//      jointAppClients.style.display = "";
//    }     
//    else
//    {
//      // ...otherwise hide them.
//      jointInsured.style.display    = "none";
//      jointSearch.style.display     = "none";
//      jointAppClients.style.display = "none";
//    }
//  }
//  else
//  {
//    // No visible Joint Life Type cells, so hide
//    // all the joint-related column headers.
//    jointLifeType.style.display   = "none";
//    jointInsured.style.display    = "none";
//    jointSearch.style.display     = "none";
//    jointAppClients.style.display = "none";
//  }
//}

//-----------------------------------------------------------------------------
//
//  Function:       packagingIsTurnedOff()
//
//  Description:  Determines whether or not packaging for the base product
//          has been turned off.
//
//  Arguments:      None
//
//  Returns:      true or false, indicating whether or not packaging has been
//          turned off.
//
//-----------------------------------------------------------------------------

function packagingIsTurnedOff() 
{
  return ("" == cleanString(document.getElementById("MIR-PLAN-PKG-TYP-CD").value));
}

