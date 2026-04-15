// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:18 PM EDT
//******************************************************************************
//*  Component:   Calendar.js                                                  *
//*  Description: Multipurpose calendar                                        *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//* B11064   HIN/CL   CHANGE TO USE GENERIC MESSAGE FUNCTION                   *
//* P02101   PF 3.0   Fix Calendar functions                                   *
//* EN000207  GW      fix Calendar functions (added clearCalDates function &   *
//*                       fixed UnloadDates function).                         *
//*  EN9512  PF4.0.2  PathFinder Upgrade                                       *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *                                                                               *
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
// (C) COPYRIGHT 2003 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED
//******************************************************************************

//+----------------------------------------------------------------------------
//
//  Function:       calendar   
//
//  Description:                                                                 
//
//  Arguments:                           
//
//  Returns:                       
//
//  Dependency: Requires ClientLevelEdits.js.
//
//-----------------------------------------------------------------------------

function calendar(name, ctl, mirField, lang, numMos, maxSels, width, startDate)
{
    // First day of week 0=Sunday, 1=Monday . . .
    var mFirstDOW = mCount = 0;
    // Can dates be selected / unselected?
    var mUpdateable = true;
    // array to hold selected dates
    var mDatesSel = new Array();
    // number of days in the month - will adjust later if leap year
    var mDaysInMonth = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
    // default days of the week headings
    var mDaysOfWeek = new Array("S", "M", "T", "W", "T", "F", "S");
    // Japanese days of the week headings
    var mDaysOfWeekJpn = new Array("日", "月", "火", "水", "木", "金", "土");
    // default months of the year headings
    var mMosInYr = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
    // Japanese months of the year headings
    var mMosInYrJpn = new Array("1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月");
    // html of the calendar being built
    var mHtml = "";
    // the html element name that the calendar will be attached to
    var mCtl = document.getElementById(ctl);

    // initialize default values
    this.init = function()
                {
                    if (startDate == null){startDate = new Date();}
                    if (lang == null){lang = "E";}
                    if (numMos == null){numMos = 5;}
                    if (maxSels == null){maxSels = 100;}
                    if (width == null){width = "100%";}
                    if ((lang != "E") && window.getCalLangDefaults)
                    {
                        var dflts = new getCalLangDefaults();
                        mDaysOfWeek = dflts.getDaysOfWeek();
                        mMosInYr = dflts.getMosInYr();
                    }
                    if (m_contentDocument.getElementById("LSIR-USER-LANG-CD").innerText == "J")
                    {
                        mMosInYr = mMosInYrJpn;
                        mDaysOfWeek = mDaysOfWeekJpn;
                    }
                };

    this.init();

    // Get / Set for the Calendar Start Date
    this.setStartDate = function(sd){startDate = sd;};
    this.getStartDate = function(){return startDate;};

    // Get / Set for the maximum number of dates which can be selected
    this.setMaxSels = function(m){maxSels = m;};
    this.getMaxSels = function(){return maxSels;};

    // Get / Set for the calendar page width
    this.setWidth = function(w){width = w;};
    this.getWidth = function(){return width;};

    // Get / Set for the number of mos to display
    this.setNumMos = function(mos){numMos = mos;};
    this.getNumMos = function(){return numMos;};

    // Get / Set for the First Day of the Week Index - 0=Sunday, 1=Monday...
    this.setFirstDOW = function(fd){mFirstDOW = fd;};
    this.getFirstDOW = function(){return mFirstDOW;};

    // Get / Set for the Days of the Week Array - used for calendar column headings
    this.setDaysOfWeek = function(d){mDaysOfWeek = d;};
    this.getDaysOfWeek = function(){return mDaysOfWeek;};

    // Get / Set for the Months in the Year Array - used for calendar headings
    this.setMosInYr = function(m){mMosInYr = m;};
    this.getMosInYr = function(){return mMosInYr;};

    // Get / Set for Calendar dates are selectable or not
    this.setUpdateable = function(up){mUpdateable = up;};
    this.IsUpdateable = function(){return mUpdateable;};

    // Get the array of dates selected
    this.getDates = function(){return mDatesSel;};
    // Add a date to the selected array
    this.addDate  = function(date)
                    {
                        if (mCount >= maxSels)
                        {
                            alert(getUserMessage(msgMaxDatesSelect));
                            return false;
                        }
                        mDatesSel[mDatesSel.length] = date;
                        mCount++;
                        this.sort();
                        return true;
                    };

    // return true if the given date exists in the selected date array
    this.dateIsSel = function(date)
                     {
                         for (var i=0; i<mDatesSel.length; i++)
                         {
                             if (mDatesSel[i] == null){continue;}

                             if (mDatesSel[i].valueOf() == date.valueOf())
                             {
                                 return true;
                             }
                         }
                         return false;
                     };

    // remove a date from the selected dates array
    this.deleteDate  = function(date)
                       {
                           if (this.dateIsSel(date))
                           {
                               for (var i=0; i<mDatesSel.length; i++)
                               {
                                   if (mDatesSel[i] == null)
                                   {
                                       continue
                                   }

                                   if (mDatesSel[i].valueOf() == date.valueOf())
                                   {
                                       mDatesSel[i] = null;
                                       mCount--;
                                       this.sort();
                                   }
                               }                               
                           }
                       };

    // are there any dates selected after the given year and month
    this.datesAfter = function(lMonth, lYear)
                      {
                          var lDate = new Date(lYear, lMonth, mDaysInMonth[lMonth]);
                          for (var i=0; i<mDatesSel.length; i++)
                          {
                              if (mDatesSel[i] == null)
                              {
                                  continue;
                              }

                              if (mDatesSel[i].valueOf() > lDate.valueOf())
                              {
                                  return true;
                              }
                          }
                          return false;
                      };
    
    // are there any dates selected before the given year and month    
    this.datesBefore = function(lMonth, lYear)
                       {
                           var lDate = new Date(lYear, lMonth, 1);
                           for (var i=0; i<mDatesSel.length; i++)
                           {
                               if (mDatesSel[i] == null)
                               {
                                   continue;
                               }

                               if (mDatesSel[i].valueOf() < lDate.valueOf())
                               {
                                   return true;
                               }
                           }
                           return false;
                       };

    // scroll the menu left (if -) or right (if +) the given # of mos
    this.adjustMonth = function(lMos)
                       {
                           var lYrs = 0;
                           var nDate = new Date(startDate);
                           var nMos = nDate.getMonth() + lMos;
                           if (nMos > 11)
                           {
                               lYrs = Math.floor((nMos+1)/12);
                               nMos -= 12*lYrs;
                           }
                           nDate.setMonth(nMos);
                           nDate.setFullYear(nDate.getFullYear() + lYrs);
                           this.setStartDate(nDate);
                       };

    // build the calendar
    this.build = function()
                 {
                     var lMos = startDate.getMonth();
                     var lYr = startDate.getFullYear();

                     mHtml = "<TABLE width=" + width + " BORDER=1 BORDERCOLOR=#0099cc CELLSPACING=0 CELLPADDING=0 BGCOLOR=#0000A4>";
                     mHtml += "<TR>";

                     for (var i=0; i<numMos; i++)
                     {
                         if ((lMos + i) > 11)
                         {
                             lYr++;
                             lMos -= 12;
                         }
                         mHtml += this.buildMonth(lMos + i, lYr);
                     }
                     mHtml += "</TR></TABLE>";
                 };

    // display the calendar
    this.show = function()
                {
                   this.build();
                   mCtl.innerHTML = mHtml;
                };

    // build the given month calendar
    this.buildMonth = function(lMonth, lYear)
                      {
                          var lOut = "";
                          lOut += this.calHead(lMonth, lYear);
                          lOut += this.calBody(lMonth, lYear);
                          return lOut;
                      };

    // build the calendar heading for the given month
    this.calHead = function(lMonth, lYear)
                   {
                       var lPtrStyleN, lPtrStyleP;
                       var lHeadL, lHeadR;
                       var lClass, lClassL, lClassR;
                       var lOut = "";
                       // set the default image and heading style class
                       lClass = lClassL = lClassR = "calhead";

                       lOut += "<TD><TABLE BORDER=0 CELLPADDING=1 CELLSPACING=1 WIDTH=100%><TR>";

                       if (this.datesBefore(lMonth, lYear))
                       {
                           lPtrStyleP = "calmore";
                       }
                       else
                       {
                           lPtrStyleP = "calhead";
                       }

                       if (this.datesAfter(lMonth, lYear))
                       {
                           lPtrStyleN = "calmore";
                       }
                       else
                       {
                           lPtrStyleN = "calhead";
                       }
                       
                       var lTotMos = lMonth + (lYear*12);
                       var lStartTotMos = startDate.getMonth() + (startDate.getFullYear()*12);
                       lHeadL = lHeadR = "<TD CLASS='calhead'></TD><TD CLASS='calhead'></TD>";

                       if (lTotMos == lStartTotMos)
                       {
                           lHeadL = "<TD CLASS='" + lPtrStyleP + "' ONCLICK='jump(" + name + ",-1);'";
                           lHeadL += " ONMOUSEOVER='tooltip(this,0);'>";
                           lHeadL += "<IMG SRC='../images/prev_adv.gif' STYLE='CURSOR:pointer'></TD>";
                           lHeadL += "<TD CLASS='calhead' ONCLICK='prevMonth(" + name + ");'";
                           lHeadL += " ONMOUSEOVER='tooltip(this,1);'>";
                           lHeadL += "<IMG SRC='../images/prev.gif' STYLE='CURSOR:pointer'></TD>";
                       }
                           
                       if (lTotMos == (lStartTotMos + numMos - 1))
                       {
                           lHeadR = "<TD CLASS='calhead' ONCLICK='nextMonth(" + name + ");'";
                           lHeadR += " ONMOUSEOVER='tooltip(this,1);'>";
                           lHeadR += "<IMG SRC='../images/next.gif' STYLE='CURSOR:pointer'></TD>";
                           lHeadR += "<TD CLASS='" + lPtrStyleN + "' ONCLICK='jump(" + name + ", +1);'";
                           lHeadR += " ONMOUSEOVER='tooltip(this,0);'>";
                           lHeadR += "<IMG SRC='../images/next_adv.gif' STYLE='CURSOR:pointer'></TD>";
                       }

                       lOut += lHeadL;

                       if (m_contentDocument.getElementById("LSIR-USER-LANG-CD").innerText == "J")
                       {
                           lOut += "<TD CLASS='" + lClass + "' COLSPAN=3 WIDTH='100%'>" + lYear + "年 "+ "</TD>";;
                           lOut += lHeadR;
                           lOut += "</TR><TR>";;
                           lOut += "<TD CLASS='" + lClass + "' COLSPAN=2 WIDTH='100%'></TD>";;
                           lOut += "<TD CLASS='" + lClass + "' COLSPAN=3 WIDTH='100%'>" + mMosInYr[lMonth] + "</TD>";;
                       }
                       else
                       {
                           lOut += "<TD CLASS='" + lClass + "' COLSPAN=3 WIDTH='100%'>" + mMosInYr[lMonth] + "</TD>";;
                           lOut += lHeadR;
                           lOut += "</TR><TR>";;
                           lOut += "<TD CLASS='" + lClass + "' COLSPAN=2 WIDTH='100%'></TD>";;
                           lOut += "<TD CLASS='" + lClass + "' COLSPAN=3 WIDTH='100%'>" + lYear + "</TD>";;
                       }

                       lOut+= "</TR><TR>";

                       for (var i=mFirstDOW; i<(7+mFirstDOW); i++)
                       {
                           lOut += "<TD WIDTH=14% CLASS='caldow'>" + mDaysOfWeek[i%7] + "</TD>";
                       }
                       lOut += "</TR>";
                       return lOut;
                   };

    // build the calendar body for a given month
    this.calBody = function(lMonth, lYear)
                   {
                       var lOut = "";
                       var lFDay = new Date(lYear,lMonth,1).getDay();
                       var lDay = 1;
                       var lFill = true;
                       var lDate, lClass, lCell;
                       var lDaysInMonth = mDaysInMonth[lMonth];

                       // if leap year Feb has 29 days
                       if (isLeapYear(lYear)&&(lMonth==1)){lDaysInMonth++;}

                       for (var i=0; i<6; i++)
                       {
                           lOut += "<TR CLASS='calrow'>";
                           for (var j=0; j<7; j++)
                           {
                               lOut += "<TD";
                               lCell = (i*7)+j;
                               // set different style for weekend days
                               if (j == ((7-mFirstDOW)%7) || j == ((6-mFirstDOW)%7))
                               {
                                   lOut += " BGCOLOR=\"#dbeaf5\" ONMOUSEOVER=\"changeBG(this)\" ONMOUSEOUT=\"changeBG(this,'#dbeaf5')\"";
                               }
                               else
                               {
                                   lOut += " BGCOLOR=\"#ffffff\" ONMOUSEOVER=\"changeBG(this)\" ONMOUSEOUT=\"changeBG(this,'#ffffff')\"";
                               }

                               if ((lCell < lFDay) || (lDay > lDaysInMonth))
                               {
                                   lOut += " CLASS='calcell'>&nbsp</TD>";
                               }
                               else
                               {
                                   lDate = new Date(lYear,lMonth,lDay);
                                   lClass = this.dateIsSel(lDate) ? "calbold" : "calcell";
                                   lOut += " CLASS='" + lClass + "' day=" + lDay + " month=" + lMonth + " year=" + lYear;
                                   lOut += " ONCLICK='pick(" + name + ",this);'>" + lDay + "</TD>";
                                   lDay++;
                               }
                           }
                           lOut += "</TR>";
                       }
                       lOut += "</TABLE></TD>";
                       return lOut;
                   };
    
    // load dates from a table of mir dates
    this.loadDates = function()
                     {
                         var lObj, lDate;
                         var i=1;
                         while (true)
                         {
                             lObj = document.getElementById(mirField + "-T[" + i++ + "]");
                             if (lObj == null){break;}
                             if (lObj.hasAttribute("value"))
                             {
                                 lDate = lObj.value;
                             }
                             else
                             {
                                 lDate = lObj.innerText;
                             }
                             if (lDate == "") {continue;}
                             var yr = lDate.substring(0,4);
                             var mos = lDate.substring(5,7);
                             var day = lDate.substring(8,10);
                             this.addDate(new Date(yr, mos-1, day));
                         }
                         if (mDatesSel[0] != null){this.setStartDate(mDatesSel[0]);}
                     };

    // load dates from a table of mir dates
    this.unloadDates = function()
                     {
                         var j=1;
                         var lDatesSel = this.getDates();
                         for (var i=1; i<maxSels; i++)
                         {
                             var lObj = document.getElementById(mirField + "-T[" + i + "]").value = "";
                             if (lObj == null) {break;}
                         }

                         for (var i=0; i<lDatesSel.length; i++)
                         {
                             if (lDatesSel[i]==null){continue;}
                             var lObj = document.getElementById(mirField + "-T[" + j++ + "]");
                             if (lObj == null){break;}
                             var out = lDatesSel[i].getFullYear() + "-";
                             var temp = lDatesSel[i].getMonth() + 1;
                             if (temp < 10){out += "0";}
                             out += temp + "-";
                             temp = lDatesSel[i].getDate();
                             if (temp < 10){out += "0";}
                             out += temp;
                             lObj.value  = out;
                         }
                     };
                      
    // Clear dates from a table of mir dates
    this. ClearCalDates = function()
                     {
                         var DtObj;
                         for (var i=1; i<101; i++)
                        {
                           var DtObj = document.getElementById(mirField + "-T[" + i + "]").value = "";
                         }
                     } ; 
 
    // sort the selected dates array
    this.sort = function(){mDatesSel.sort(compareDates);};

    this.toString = function(){return mHtml;};
}

//+----------------------------------------------------------------------------
//
//  Function:       calendarA
//
//  Description:    dummy constructor function to ensure properties are
//                   private for each Calendar instance.
//
//  Arguments:      none
//
//  Returns:        nothing
//
//-----------------------------------------------------------------------------

function calendarA(name, ctl, mirField, lang, numMos, maxSels, width, startDate)
{
    this.calendar = calendar;
    this.calendar(name, ctl, mirField, lang, numMos, maxSels, width, startDate);
}

function changeBG(object, lColor)
{
    if (lColor == null)
    {
        lColor = "yellow";
    }
    object.style.backgroundColor = lColor;
}

function compareDates(a, b) {return a - b;}

function prevMonth(name, num)
{
    if (num == null) {num=-1;}
    eval(name).adjustMonth(num);
    eval(name).show();
}

function nextMonth(name, num)
{
    if (num == null) {num=+1;}
    eval(name).adjustMonth(num);
    eval(name).show();
}

function jump(name, direction)
{
    var lDate = eval(name).getStartDate();
    var lDatesSel = eval(name).getDates();

    eval(name).sort();
    
    if (direction < 0)
    {
        for (var i=lDatesSel.length;i>-1;i--)
        {
            if (lDatesSel[i]==null) {continue;}

            if (lDatesSel[i] < lDate)
            {
                eval(name).setStartDate(lDatesSel[i]);
                break;
            }
        }
    }
    else
    {
        lDate = new Date(lDate.getFullYear(),lDate.getMonth() + eval(name).getNumMos(), 1);
        for (var i=0;i<lDatesSel.length;i++)
        {
            if (lDatesSel[i]==null) {continue;}

            if (lDatesSel[i] > lDate)
            {
                lDate = lDatesSel[i];
                // the cal should be repositioned so the next dates show to the far right of cal
                lDate = new Date(lDate.getFullYear(),lDate.getMonth() - eval(name).getNumMos() + 1, 1);
                eval(name).setStartDate(lDate);
                break;
            }
        }
    }
    eval(name).show();
    return true;
}

function pick(name, object)
{
    if (!eval(name).IsUpdateable())
    {
        return;
    }
    var field = new Field(object);
    var pDate = new Date(field.getAttributeValue("year"),field.getAttributeValue("month"),field.getAttributeValue("day"));

    if (eval(name).dateIsSel(pDate))
    {
        eval(name).deleteDate(pDate);
        object.className = "calcell";
    }
    else
    {
        // if date added successfully change style type to bold
        if (eval(name).addDate(pDate)){object.className = "calbold";}
    }
    eval(name).unloadDates();
}

function tooltip(obj, num)
{
    var lMsgs = new Array("Advance to next selected date",
                          "Click to scroll calendar");
    var lMsgsJpn = new Array("選択日まで戻る",
                             "カレンダーをスクロールする");
    if (m_contentDocument.getElementById("LSIR-USER-LANG-CD").innerText == "J")
    {
        lMsgs = lMsgsJpn;
    }
    obj.title = lMsgs[num];
    return true;
}
