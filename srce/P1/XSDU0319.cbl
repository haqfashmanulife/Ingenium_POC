      *****************************************************************
      **  ALL RIGHT, TITLE AND INTEREST IN AND TO THE SOFTWARE         
      **  (THE "SOFTWARE") AND THE ACCOMPANYING DOCUMENTATION OR       
      **  MATERIALS (THE "DOCUMENTATION"), INCLUDING ALL PROPRIETARY   
      **  RIGHTS, THEREIN INCLUDING ALL PATENT RIGHTS, TRADE SECRETS,  
      **  TRADEMARKS AND COPYRIGHTS, SHALL REMAIN THE EXCLUSIVE        
      **  PROPERTY OF HEWLETT-PACKARD DEVELOPMENT COMPANY, L.P.             
      **  NO INTEREST, LICENSE OR ANY RIGHT RESPECTING THE SOFTWARE       
      **  AND THE DOCUMENTATION, OTHER THAN EXPRESSLY GRANTED IN       
      **  THE SOFTWARE LICENSE AGREEMENT, IS GRANTED BY IMPLICATION    
      **  OR OTHERWISE.                                                
      **                                                               
      **  (C) COPYRIGHT 2005-2008 HEWLETT-PACKARD DEVELOPMENT COMPANY, L.P. 
      **  ALL RIGHTS RESERVED.                                         
      **                                                               
      **  EACH PARTY AGREES TO (A) COMPLY WITH ALL APPLICABLE LAWS     
      **  REGARDING EXPORT OR RE-EXPORT OF THE CONFIDENTIAL            
      **  INFORMATION, TECHNICAL DATA, OR DERIVATIVES OF SUCH ITEMS;   
      **  AND (B) NOT TO EXPORT OR RE-EXPORT ANY SUCH ITEMS TO A       
      **  DESTINATION OR END USER FOR WHICH APPLICABLE LAW, INCLUDING  
      **  CANADIAN OR U.S. LAW, REQUIRES AN EXPORT LICENSE OR OTHER    
      **  APPROVAL WITHOUT FIRST HAVING OBTAINED SUCH LICENSE OR       
      **  APPROVAL.                                                    
      *****************************************************************
      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  XSDU0319.

      *****************************************************************
      **  MEMBER :  XSDU0319                                         **
      *****************************************************************
      **  REMARKS:  EVENT TABLE INDICATING WHICH EVENT SHOULD BE     **
      **            COMMUNICATED TO WHAT INTEGRATED SYSTEM           **
      **                                                             **
      **            BASE ON RECORD IN THIS TABLE THE PROCESS WILL BE **
      **            PERFORM INTERNALY OR EXTERNALY                   **
      **                                                             **
      **  DOMAIN :  NB                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0319'.

       COPY SQLCA.
      /
      ****************************************************************
      *  COMMON COPYBOOKS                                            *
      ****************************************************************
       01  WS-WORK-AREA.
           05  WS-INDEX                        PIC S9(04) BINARY.

       01  WS-CONSTANT-AREA.
           05  WS-MAX-INDEX                    PIC S9(04) VALUE 20
                                                          BINARY.
      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
       COPY XCFRXEVS.
       COPY XCFWXEVS.
      /
      ****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      ****************************************************************
      *
      /
      *****************
       LINKAGE SECTION.
      *****************
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0319.
      /
      *******************
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                L0319-PARM-INFO.
      *******************

      *--------------
       0000-MAINLINE.
      *--------------
      *
      * INITIALIZATION
      *
           INITIALIZE WS-WORK-AREA.
           INITIALIZE L0319-OUTPUT-PARM-INFO.
           SET L0319-RETRN-OK               TO TRUE.
      *
      * MAIN PROCESS
      *
           EVALUATE TRUE

                WHEN L0319-RQST-EVNT-EXIT-PGM
                     PERFORM  1000-RETRIEVE-EVENT-INFO
                         THRU 1000-RETRIEVE-EVENT-INFO-X

                WHEN OTHER
                     SET L0319-RETRN-INVALID-REQUEST
                                            TO TRUE

           END-EVALUATE.

       0000-MAINLINE-X.
           GOBACK.
      /
      *-------------------------
       1000-RETRIEVE-EVENT-INFO.
      *-------------------------
      *
      *    SET UP XEVT TABLE KEY
      *
           MOVE LOW-VALUE                   TO WXEVS-KEY.
           MOVE L0319-SYS-CTL-ID            TO WXEVS-SYS-CTL-ID.
           MOVE L0319-XTRNL-EVNT-ID         TO WXEVS-XTRNL-EVNT-ID.

           PERFORM  XEVS-1000-BROWSE
               THRU XEVS-1000-BROWSE-X.

           PERFORM  XEVS-2000-READ-NEXT
               THRU XEVS-2000-READ-NEXT-X.

           PERFORM  2000-MOVE-DATA
               THRU 2000-MOVE-DATA-X
               VARYING WS-INDEX FROM 1 BY 1
               UNTIL   WS-INDEX > WS-MAX-INDEX
                  OR   NOT WXEVS-IO-OK.

           PERFORM  XEVS-3000-END-BROWSE
               THRU XEVS-3000-END-BROWSE-X.

           IF  L0319-XTRNL-EVNT-CNT > ZERO
           AND WGLOB-PFC-ENBL-DISABLED
      *MSG: PATHFINDER CONNECTOR IS DISABLED, CANNOT PROCESS EXTERNAL
      *     EVENT
              MOVE 'XS03190001'             TO WGLOB-MSG-REF-INFO
              PERFORM  0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
              SET L0319-RETRN-PFC-DISABLE   TO TRUE
              GO TO 1000-RETRIEVE-EVENT-INFO-X
           END-IF.

       1000-RETRIEVE-EVENT-INFO-X.
           EXIT.
      /
      *---------------
       2000-MOVE-DATA.
      *---------------

           MOVE RXEVS-XTRNL-SYS-ID          TO 
                                  L0319-XTRNL-SYS-ID (WS-INDEX).
           MOVE RXEVS-XTRNL-EVNT-PGM-ID     TO 
                                  L0319-XTRNL-EVNT-PGM-ID (WS-INDEX).
           MOVE RXEVS-DOC-ID                TO
                                  L0319-XTRNL-DOC-ID (WS-INDEX).
           MOVE RXEVS-XTRNL-INVOK-CD        TO
                                  L0319-XTRNL-INVOK-CD (WS-INDEX).

           IF  L0319-XTRNL-EVNT-REPLACE (WS-INDEX)
               SET L0319-XTRNL-EVNT-REPLACE-YES  
                                            TO TRUE
           END-IF.

           IF  L0319-XTRNL-EVNT-PUBLISH (WS-INDEX)
               SET L0319-XTRNL-EVNT-PUBLISH-YES  
                                            TO TRUE
           END-IF.

           ADD 1                            TO L0319-XTRNL-EVNT-CNT.

           PERFORM  XEVS-2000-READ-NEXT
               THRU XEVS-2000-READ-NEXT-X.

       2000-MOVE-DATA-X.
           EXIT.
      /
      ****************************************************************
      *  PROCESSING COPYBOOKS                                        *
      ****************************************************************
      *
      ****************************************************************
      *  LINKAGE COPYBOOKS                                           *
      ****************************************************************
      *
       COPY XCPL0260.
      *
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      *
       COPY XCPBXEVS.
      /
      ****************************************************************
      * ERROR HANDLING ROUTINES                                      *
      ****************************************************************
      
       COPY XCPL0030.
      
      *****************************************************************
      **                 END OF PROGRAM XSDU0319                     **
      *****************************************************************
