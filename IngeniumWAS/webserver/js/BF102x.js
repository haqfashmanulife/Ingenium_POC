// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:02 PM EDT
//******************************************************************************
//*  Component:   BF102x.jsme>                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
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
// This file contains code that support the branch/sub-branch requirement for
// the Japanese version.
// The branch field is split into two fieds: one 3 character field for branch
// and a two character field for the sub-branch.
//
// This version of the java script is modified from the original 
// (JapaneseBranch.js) and is specific to the table needs of 
// business functions 102x 
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
//
//  Function:       splitBranch
//
//  Description:    Splits a branch field in branch and subbranch. The server
//                  branch  control (see below) is expected to have two 
//                  attributes named jpnbranch and jpnsubbranch indicating
//                  the control name for the controls representing the 
//                  japanese branch and subbranch
//
//  Arguments:      serverBranchCtlName the HTML name of the control which
//                  represents the server branch field.
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------


function splitBranch(serverBranchCtlInput)
{
    serverBranchCtlInput = (serverBranchCtlInput + '-T[');
    
    for (var i = 1; i <= 13; i++)
    {
        serverBranchCtlName = (serverBranchCtlInput + i + "]");
  
        if (null == serverBranchCtlName)
        {
            return;
        }

      var serverBranchCtl = document.getElementById(serverBranchCtlName);
  
      if (serverBranchCtl == null)
      {
        // server branch control doesn't exist (this is possible, e.g. in an output array)
        return;
      }
  
      var jpnBranchCtlName = serverBranchCtl.getAttribute("jpnbranch");
      var jpnSubBranchCtlName = serverBranchCtl.getAttribute("jpnsubbranch");
        
        if (jpnBranchCtlName == null || jpnSubBranchCtlName == null)
      {
        // server branch doesn't have associated japanese branch controls
        return;
      }

      // Retrieve the controls representing the japanese branch and sub-branch
      var jpnBranchCtl = document.getElementById(jpnBranchCtlName);
      var jpnSubBranchCtl = document.getElementById(jpnSubBranchCtlName);
  
      if (jpnBranchCtl == null || jpnSubBranchCtl ==  null)
      {
        // japanese branch/sub-branch controls do not exist?
        return;
      }
  
        // We have to convert to a Field since the Field.getValue() returns always
        // the real value whether the field is displayonly or not
        var branchField = new Field(serverBranchCtl);
        var branch = branchField.getValue();
        
        // parseBranch returns an array with two elements
        var parsedBranch = parseBranch(branch);

        var jpnBranchField = new Field(jpnBranchCtl);
        var jpnSubBranchField = new Field(jpnSubBranchCtl);
    
        jpnBranchField.setValue(parsedBranch[0]);
        jpnSubBranchField.setValue(parsedBranch[1]);
    }
}


//-----------------------------------------------------------------------------
//
//  Function:       parseBranch
//
//  Description:    Parses the passed string representing the server side
//                  branch number in two entities: branch and subbranch.
//
//  Arguments:      branch  a 5 characters string with the branch code
//
//  Returns:      An array of strings with the size 2. At position 0 is the 
//                  three characters branch and at position 1 is the two 
//                  characters sub-branch
//
//-----------------------------------------------------------------------------


function parseBranch(branch)
{
    var jpnBranch = branch.substr(0, 3);
    var jpnSubBranch = branch.substr(3, 2);
    
    var retVal = new Array(2);

    if (null == jpnBranch)
    {
        jpnBranch = "";
    }

    if (null == jpnSubBranch)
    {
        jpnSubBranch = "";
    }
    
    retVal[0] = jpnBranch;
    retVal[1] = jpnSubBranch;
    return retVal;
}



//-----------------------------------------------------------------------------
//
//  Function:       updateBranch()
//
//  Description:    This function updates the branch part of an INGENIUM branch 
//                  field. 
//
//  Arguments:      ctlName of a field field which has to be a japanese branch 
//                  or subbranch field
//
//  Returns:      Nothing
//
//-----------------------------------------------------------------------------


function updateBranch(ctlInput)
{
    ctlInput = (ctlInput + '-T[');
    
    for(var i=1; i<=13; i++)
    {
        ctlName = (ctlInput + i + "]");
        
        if (null == ctlName)
        {
            return;
        }

      var ctl = document.getElementById(ctlName);
  
      if (ctl == null)
      {
            return;
      }

      var jpnBranch = "";
      var jpnSubBranch = "";
        
      var branchCtlName = ctl.getAttribute("branch");
  
      if (null == branchCtlName)
      {       
            return;
      }

      var branchCtl = document.getElementById(branchCtlName + '-T[' + i + ']');  
        if (null == branchCtl)
        {
            return;
        }

      var jpnBranchCtlName = ctl.getAttribute("jpnbranch");
  
      if (null != jpnBranchCtlName)
      {
          var jpnBranchCtl = document.getElementById(jpnBranchCtlName + '-T[' + i + ']');  
            
            if (null != jpnBranchCtl)
          {
              jpnBranch = jpnBranchCtl.value;
          }
      }
      else
      {
            jpnBranch = ctl.value;
      }
        
        var jpnSubBranchCtlName = ctl.getAttribute("jpnsubbranch");
  
      if (null != jpnSubBranchCtlName)
      {
          var jpnSubBranchCtl = document.getElementById(jpnSubBranchCtlName + '-T[' + i + ']');  
          if (null != jpnSubBranchCtl)
          {
              jpnSubBranch = jpnSubBranchCtl.value;
          }
      }
      else
      {
            jpnSubBranch = ctl.value;
      }
        
        var parsedBranch = parseBranch(branchCtl.value);

        if (jpnBranch == "")
        {
            jpnBranch = parsedBranch[0];
        }

        if (jpnSubBranch == "")
        {
            jpnSubBranch = parsedBranch[1];
        }
    
        branchCtl.value = jpnBranch + jpnSubBranch;
        
    }
}

