// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:17 PM EDT
//******************************************************************************
//*  Component:   RiderRenewTotals.js                                          *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
//******************************************************************************
 
//-----------------------------------------------------------------------------
//
//  Custom script for BF9180-O.htm 
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//
//  Function:       ChkNewFaceAmt
//
//  Description:    Blank out New Face Amt field when displaying totals.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function ChkNewFaceAmt()
{
  for (i=1; i<100; i++)
  {
    NewFaceAmtCtl = document.getElementById("MIR-DV-CVG-FACE-AMT-T[" + i + "]");
    if(NewFaceAmtCtl)  // note Table rows and associated fields may be deleted if blank
    {
      indCtl= document.getElementById("MIR-DV-CVG-RENEW-CD-T[" + i + "]");
      if(indCtl)
      {
        indicator = indCtl.value;
        switch(indicator)
        {
          case 'T': // If Total Line, blank out field
            NewFaceAmtCtl.style.display='none';
            NewFaceAmtCtl.tabindex="";
            break;
        }
      }
    }
  }
}
//-----------------------------------------------------------------------------
//
//  Function:       ChkDuration
//
//  Description:    Blank out Rider Duration field
//                  Note: This would only be blanked out for Total line.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function ChkDuration()
{
  for (i=1; i<100; i++)
  {
    DurationCtl = document.getElementById("MIR-CVG-STBL-1-CD-T[" + i + "]");
    if(DurationCtl)  // note Table rows and associated fields may be deleted if blank
    {
      indCtl= document.getElementById("MIR-DV-CVG-RENEW-CD-T[" + i + "]");
      if(indCtl)
      {
        indicator = indCtl.value;
        switch(indicator)
        {
          case 'T': // If Total Line, blank out field
            DurationCtl.style.display='none';
            DurationCtl.tabindex="";
            break;
        }
      }
    }
  }
}
//-----------------------------------------------------------------------------
//
//  Function:       ChkIssueDate
//
//  Description:    Blank out Rider Issue Date field
//                  Note: This would only be blanked out for Total line.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function ChkIssueDate()
{
  for (i=1; i<100; i++)
  {
    IssueDateCtl = document.getElementById("MIR-CVG-ISS-EFF-DT-T[" + i + "]");
    if(IssueDateCtl)  // note Table rows and associated fields may be deleted if blank
    {
      indCtl= document.getElementById("MIR-DV-CVG-RENEW-CD-T[" + i + "]");
      if(indCtl)
      {
        indicator = indCtl.value;
        switch(indicator)
        {
          case 'T': // If Total Line, blank out field
            IssueDateCtl.style.display='none';
            IssueDateCtl.tabindex="";
            break;
        }
      }
    }
  }
}
//-----------------------------------------------------------------------------
//
//  Function:       ChkFaceAmt
//
//  Description:    Blank out Face Amount field
//                  Note: This would only be blanked out for Total line.
//
//  Arguments:      None
//
//  Returns:        Nothing
//
//-----------------------------------------------------------------------------
 
function ChkFaceAmt()
{
  for (i=1; i<100; i++)
  {
    FaceAmtCtl = document.getElementById("MIR-CVG-FACE-AMT-T[" + i + "]");
    if(FaceAmtCtl)  // note Table rows and associated fields may be deleted if blank
    {
      indCtl= document.getElementById("MIR-DV-CVG-RENEW-CD-T[" + i + "]");
      if(indCtl)
      {
        indicator = indCtl.value;
        switch(indicator)
        {
          case 'T': // If Total Line, blank out field
            FaceAmtCtl.style.display='none';
            FaceAmtCtl.tabindex="";
            break;
        }
      }
    }
  }
}

