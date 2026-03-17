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
      *****************************************************************
      **  MEMBER :  XSDU0278                                         **
      **  REMARKS:  EXTERNAL MESSAGE PROCESSING ROUTINES             **
      **                                                             **
      **  DOMAIN :  NB                                               **
      *****************************************************************
      **  RELEASE   DESCRIPTION                                      **
      **                                                             **
MP310E**  05AUG18   MP310E - INGENIUM  SCV INTERFACE                 **
      *****************************************************************

      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.    XSDU0278.

      *************************
       ENVIRONMENT DIVISION.
      *************************

       CONFIGURATION SECTION.
      /
      *************************
       DATA DIVISION.
      *************************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSDU0278'.

       COPY SQLCA.

       01  WS-WORK-INFO.
           05  WS-PROG-ID                 PIC X(08).
           05  FILLER  REDEFINES WS-PROG-ID.
               10  WS-PROG-PRE-FIX        PIC X(02).
               10  FILLER                 PIC X(02).
               10  WS-PROG-ID-NUM         PIC X(04).
           05  WS-ING-MSG-REF-ID.
               10  WS-ING-MSG-REF-ID-1    PIC X(02).
               10  WS-ING-MSG-REF-ID-2    PIC X(04).
           05  WS-ING-MSG-REF-NUM         PIC X(06).

      /
      ****************************************************************
      *  I/O COPYBOOKS                                               *
      ****************************************************************
      
       COPY NCFRTTAB.
       COPY NCFWTTAB.
      /
      *****************
       LINKAGE SECTION.
      *****************
      
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWL0278.

      /
      *************************
       PROCEDURE DIVISION  USING  WGLOB-GLOBAL-AREA
                                  L0278-PARM-INFO.
      *************************

      *--------------
       0000-MAINLINE.
      *--------------
      *
      * INITIALIZATION
      *
           INITIALIZE WS-WORK-INFO.
           INITIALIZE L0278-OUTPUT-PARM-INFO.
           SET L0278-RETRN-OK               TO TRUE.
      *
      * MAIN PROCESS
      *
           PERFORM  0100-MAINLINE
               THRU 0100-MAINLINE-X.

       0000-MAINLINE-X.
           GOBACK.
      /
      *--------------
       0100-MAINLINE.
      *--------------
      *
      * PROCESS MESSAGE REQUEST
      *
           EVALUATE TRUE

               WHEN L0278-RQST-EXT-MSG-GENERATE
                    PERFORM  1000-EXT-MSG-GENERATE
                        THRU 1000-EXT-MSG-GENERATE-X

               WHEN L0278-RQST-EXT-MSG-GET
                    PERFORM  2000-EXT-MSG-GET
                        THRU 2000-EXT-MSG-GET-X

               WHEN L0278-RQST-EXT-MSG-AUDIT
                    PERFORM  3000-EXT-MSG-AUDIT
                        THRU 3000-EXT-MSG-AUDIT-X

               WHEN OTHER
                    SET  L0278-RETRN-INVALD-RQST TO TRUE
      
           END-EVALUATE.
      
       0100-MAINLINE-X.
           EXIT.
      /
      *---------------------
       1000-EXT-MSG-GENERATE.
      *---------------------
      
            PERFORM  7000-TRANSLATE-MSG-NUM
                THRU 7000-TRANSLATE-MSG-NUM-X.
      
            IF  L0278-RETRN-ERR-TRANSLATE
               GO TO 1000-EXT-MSG-GENERATE-X
            END-IF.
      					 
            MOVE WS-ING-MSG-REF-ID          TO WGLOB-MSG-REF-ID.
            MOVE WS-ING-MSG-REF-NUM         TO WGLOB-MSG-REF-NUM.
            MOVE L0278-EXT-MSG-PARM (1)     TO WGLOB-MSG-PARM (1).
            MOVE L0278-EXT-MSG-PARM (2)     TO WGLOB-MSG-PARM (2).
            MOVE L0278-EXT-MSG-PARM (3)     TO WGLOB-MSG-PARM (3).
            MOVE L0278-EXT-MSG-PARM (4)     TO WGLOB-MSG-PARM (4).
      
            PERFORM  0260-1000-GENERATE-MESSAGE
                THRU 0260-1000-GENERATE-MESSAGE-X.
      
       1000-EXT-MSG-GENERATE-X.
           EXIT.
      /
      *-----------------
       2000-EXT-MSG-GET.
      *-----------------
      
            PERFORM  7000-TRANSLATE-MSG-NUM
                THRU 7000-TRANSLATE-MSG-NUM-X.
      
            IF  L0278-RETRN-ERR-TRANSLATE
               GO TO 2000-EXT-MSG-GET-X
            END-IF.
      
            MOVE WS-ING-MSG-REF-ID          TO WGLOB-MSG-REF-ID.
            MOVE WS-ING-MSG-REF-NUM         TO WGLOB-MSG-REF-NUM.
            MOVE L0278-EXT-MSG-PARM (1)     TO WGLOB-MSG-PARM (1).
            MOVE L0278-EXT-MSG-PARM (2)     TO WGLOB-MSG-PARM (2).
            MOVE L0278-EXT-MSG-PARM (3)     TO WGLOB-MSG-PARM (3).
            MOVE L0278-EXT-MSG-PARM (4)     TO WGLOB-MSG-PARM (4).
      
            PERFORM  0260-2000-GET-MESSAGE
                THRU 0260-2000-GET-MESSAGE-X.
      
       2000-EXT-MSG-GET-X.
           EXIT.
      
      
      *-------------------
       3000-EXT-MSG-AUDIT.
      *-------------------
      
            PERFORM  7000-TRANSLATE-MSG-NUM
                THRU 7000-TRANSLATE-MSG-NUM-X.
      
            IF  L0278-RETRN-ERR-TRANSLATE
               GO TO 3000-EXT-MSG-AUDIT-X
            END-IF.
      
            MOVE WS-ING-MSG-REF-ID          TO WGLOB-MSG-REF-ID.
            MOVE WS-ING-MSG-REF-NUM         TO WGLOB-MSG-REF-NUM.
            MOVE L0278-EXT-MSG-PARM (1)     TO WGLOB-MSG-PARM (1).
            MOVE L0278-EXT-MSG-PARM (2)     TO WGLOB-MSG-PARM (2).
            MOVE L0278-EXT-MSG-PARM (3)     TO WGLOB-MSG-PARM (3).
            MOVE L0278-EXT-MSG-PARM (4)     TO WGLOB-MSG-PARM (4).
      
            PERFORM  0260-3000-AUDIT-MESSAGE
                THRU 0260-3000-AUDIT-MESSAGE-X.
      
       3000-EXT-MSG-AUDIT-X.
           EXIT.
      
      
      *-----------------------
       7000-TRANSLATE-MSG-NUM.
      *-----------------------
      
           MOVE L0278-EXT-MSG-SOURCE        TO WTTAB-ETBL-TYP-ID.
           MOVE L0278-EXT-MSG-REF           TO WTTAB-ETBL-VALU-ID.
      
           PERFORM  TTAB-1000-READ
               THRU TTAB-1000-READ-X.
      
           IF NOT WTTAB-IO-OK
      *MSG:    'EXTERNAL MESSAGE @1 @2 TRANSLATION ERROR'
               MOVE 'XS02780001'            TO WGLOB-MSG-REF-INFO
               MOVE L0278-EXT-MSG-REF       TO WGLOB-MSG-PARM (1)
               MOVE L0278-PROG-ID           TO WGLOB-MSG-PARM (2)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               SET L0278-RETRN-ERR-TRANSLATE   
                                            TO TRUE
               GO TO 7000-TRANSLATE-MSG-NUM-X
           END-IF.
      
           MOVE RTTAB-TTBL-VALU-TXT         TO WS-ING-MSG-REF-NUM.     
           MOVE L0278-PROG-ID               TO WS-PROG-ID.
           MOVE WS-PROG-PRE-FIX             TO WS-ING-MSG-REF-ID-1.
           MOVE WS-PROG-ID-NUM              TO WS-ING-MSG-REF-ID-2.
      
       7000-TRANSLATE-MSG-NUM-X.
           EXIT.
      /
      ******************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                  *
      ******************************************************************
      
       COPY XCPL0260.
      /
       COPY NCPNTTAB.
      /
      ******************************************************************
      *    ERROR HANDLING ROUTINES                                     *
      ******************************************************************
      
       COPY XCPL0030.
      
      *****************************************************************
      **                 END OF PROGRAM XSDU0278                     **
      *****************************************************************
