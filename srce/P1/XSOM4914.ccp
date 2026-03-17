      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM4914.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM4914                                         **
      **  REMARKS:  THIS MODULE RETURNS A LIST OF DEFINED FIELD      **
      **            DESCRIPTIONS USING DFLD.                         **
      **                                                             **
      **  DOMAIN :  PO                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     REL.   DESCRIPTION                                **
      **                                                             **
016057**  30JUN00  602J   CLEANUP - NEW FOR RELEASE                  **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM4914'.

       COPY SQLCA.

      /
       01  WS-WORKING-STORAGE.
           05  WS-BUS-FCN-ID                           PIC X(04).
               88  WS-BUS-FCN-RETRIEVE                 VALUE '4914'.
           05  WS-SUB                           PIC 9(3).
      /
      *****************************************************************
      *  COMMON COPYBOOKS                                             *
      *****************************************************************
      /
      *****************************************************************
      *  I/O COPYBOOKS                                                *
      *****************************************************************
      /
       COPY NCFWDFLD.
       COPY NCFRDFLD.
      /
      *****************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                         *
      *****************************************************************
      /
      *****************
       LINKAGE SECTION.
      *****************

       01 WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM4914.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.
      *--------------
       0000-MAINLINE.
      *--------------

           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  1000-PROCESS-REQUEST
               THRU 1000-PROCESS-REQUEST-X.

           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.

       0000-MAINLINE-X.
           GOBACK.
      /
      *---------------------
       1000-PROCESS-REQUEST.
      *---------------------

           PERFORM  9300-SETUP-MSIN-REFERENCE
               THRU 9300-SETUP-MSIN-REFERENCE-X.
      *
      *   CHECK ENTER CODE FOR FUNCTION REQUESTED
      *
           MOVE MIR-BUS-FCN-ID
             TO WS-BUS-FCN-ID.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  2000-RETRIEVE
                        THRU 2000-RETRIEVE-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID           TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM4914'               TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'             TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST TO TRUE

           END-EVALUATE.

       1000-PROCESS-REQUEST-X.
           EXIT.
      /
      *--------------
       2000-RETRIEVE.
      *--------------

           SET MIR-RETRN-OK            TO TRUE.

           PERFORM  7000-BUILD-KEYS
               THRU 7000-BUILD-KEYS-X.

           PERFORM  9000-BLANK-DATA-FIELDS
               THRU 9000-BLANK-DATA-FIELDS-X.

           PERFORM  DFLD-1000-BROWSE
               THRU DFLD-1000-BROWSE-X.

           IF  WDFLD-IO-NOT-FOUND
               PERFORM  DFLD-3000-END-BROWSE
                   THRU DFLD-3000-END-BROWSE-X
               SET MIR-RETRN-RQST-FAILED
                 TO TRUE
               GO TO 2000-RETRIEVE-X
           END-IF.
           
           PERFORM  DFLD-2000-READ-NEXT
               THRU DFLD-2000-READ-NEXT-X 
               UNTIL RDFLD-FLD-FILE-CD = 'APPV'
               AND   RDFLD-FLD-TYP-YES-NO   

           PERFORM
               VARYING WS-SUB FROM 1 BY 1
               UNTIL WDFLD-IO-EOF

               IF WDFLD-IO-OK
                 PERFORM  9200-MOVE-DATA-TO-MIR
                     THRU 9200-MOVE-DATA-TO-MIR-X
               END-IF
           
               INITIALIZE RDFLD-REC-INFO    
               
               PERFORM  DFLD-2000-READ-NEXT
                   THRU DFLD-2000-READ-NEXT-X
               UNTIL (RDFLD-FLD-FILE-CD = 'APPV'
               AND   RDFLD-FLD-TYP-YES-NO)
               OR WDFLD-IO-EOF   

           END-PERFORM.
           
           PERFORM  DFLD-3000-END-BROWSE
               THRU DFLD-3000-END-BROWSE-X.

       2000-RETRIEVE-X.
           EXIT.
      /
      *----------------
       7000-BUILD-KEYS.
      *----------------
      *
      * BUILD KEY FOR INPUT SCREEN (LOW VALUES/HIGH VALUES)
      * OR OUTPUT SCREEN (START AND ENDBROWSE WITH MIR-DFLD-FLD-ID
      *
           IF MIR-DFLD-FLD-ID = SPACES
             MOVE LOW-VALUES           TO WDFLD-KEY
           ELSE
             MOVE MIR-DFLD-FLD-ID      TO WDFLD-FLD-ID
           END-IF.
           
           MOVE WGLOB-COMPANY-CODE     TO WDFLD-CO-ID.
           MOVE WDFLD-KEY              TO WDFLD-ENDBR-KEY.
           
           IF MIR-DFLD-FLD-ID = SPACES
              MOVE HIGH-VALUES         TO WDFLD-ENDBR-FLD-ID 
           ELSE
              MOVE MIR-DFLD-FLD-ID     TO WDFLD-ENDBR-FLD-ID
           END-IF.


       7000-BUILD-KEYS-X.
           EXIT.
      /
      *-----------------------
       9000-BLANK-DATA-FIELDS.
      *-----------------------

           MOVE SPACES              TO MIR-DFLD-FLD-DESC-TXT-G.

       9000-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      *--------------------------
       9200-MOVE-DATA-TO-MIR.
      *--------------------------
      
           MOVE RDFLD-FLD-ID
             TO MIR-DFLD-FLD-ID-T (WS-SUB).  
           MOVE RDFLD-FLD-DESC-TXT
             TO MIR-DFLD-FLD-DESC-TXT-T (WS-SUB). 
                   

       9200-MOVE-DATA-TO-MIR-X.
           EXIT.
      /
      *--------------------------
       9300-SETUP-MSIN-REFERENCE.
      *--------------------------

           MOVE SPACES
             TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE
             TO WGLOB-REF-COMPANY-CODE.

       9300-SETUP-MSIN-REFERENCE-X.
           EXIT.
      /
      *****************************************************************
      *  PROCESSING COPYBOOKS                                         *
      *****************************************************************
      /
       COPY XCPPEXIT.
      /
      *****************************************************************
      *  LINKAGE PROCESSING COPYBOOKS                                 *
      *****************************************************************
      /
       COPY XCCL0260.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                     *
      *****************************************************************
      /
       COPY NCPBDFLD.
       COPY NCPNDFLD.
      /
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                      *
      *****************************************************************
       COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM XSOM4914                     **
      *****************************************************************
