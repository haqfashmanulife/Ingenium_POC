      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSOM0310.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSOM0310                                         **
      **  REMARKS:  PROCESS DRIVER FOR UXIT TRANSACTION:             **
      **            MAINTAIN USER EXIT PROGRAM SCREEN.               **
      **            THIS PROGRAM ALLOWS THE USER TO RETRIEVE,LIST    *
      **            UPDATE, CREATE,AND DELETE POLCICY EXIT ROUTINES. *
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
011025**  30OCT98  56     INITIAL SYSTEM DESIGN                      **
013578**  15DEC99  60     ELIMINATE SUPPORT FOR CHARACTER INTERFACE  **
014588**  15DEC99  60     MIR CHANGES                                **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
014660**  15DEC99  60     GLOBAL MESSAGING                           **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
      /
       DATA DIVISION.

       WORKING-STORAGE SECTION.

       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSOM0310'.

       COPY SQLCA.
       COPY XCWLPTR.


014590*COPY XCWL0030.

       01  WS-WORKING-STORAGE.
           05  WS-SUB                       PIC S9(4)  VALUE ZERO COMP.
           05  I                            PIC S9(4)  VALUE ZERO COMP.
           05  WS-MAX-BROWSE-LINES          PIC S9(4)  VALUE +12  COMP.
           05  WS-ERROR-SW                  PIC X(01).
               88  WS-ERROR-FOUND                      VALUE 'Y'.
               88  WS-NO-ERROR                         VALUE 'N'.
           05  WS-BUS-FCN-ID                PIC X(04)  VALUE SPACES.
               88  WS-BUS-FCN-VALID                    VALUES ARE
                   '0310','0311','0312','0313','0314'.
               88  WS-BUS-FCN-RETRIEVE                   VALUE '0310'.
               88  WS-BUS-FCN-CREATE                     VALUE '0311'.
               88  WS-BUS-FCN-UPDATE                     VALUE '0312'.
               88  WS-BUS-FCN-DELETE                     VALUE '0313'.
               88  WS-BUS-FCN-LIST                       VALUE '0314'.
           05  WS-USER-EXIT-TYPE            PIC X(01).
               88  WS-VALID-USER-EXIT-TYPE  VALUES 'A' 'B' 'R' 'I'.
               88  WS-USER-EXIT-INACTIVE    VALUE  'I'.
           05  WS-UXIT-POINTER              PIC X(04).
               88  WS-VALID-UXIT-POINTER
                   VALUES ARE 'EIAC'
                              'PIDA'
                              'CIDA'.
      /
      ***************************************************************
      * POLICY NUMBER ASSIGNMENT WORK AREA
      ***************************************************************
       COPY XCFRUXIT.
       COPY XCFWUXIT.
      /
      *******************
       LINKAGE   SECTION.
      *******************
      /
       01  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
       COPY XCWM0310.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.
      ****************
       0000-MAINLINE.
      ****************

           PERFORM  ABND-1000-HANDLE-ABEND
               THRU ABND-1000-HANDLE-ABEND-X.

           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.

           PERFORM 2000-PROCESS-REQUEST
              THRU 2000-PROCESS-REQUEST-X.

           PERFORM EXIT-1000-FINALIZE
              THRU EXIT-1000-FINALIZE-X.

       0000-MAINLINE-X.
             GOBACK.


      ***************************
       2000-PROCESS-REQUEST.
      ***************************

           PERFORM 9300-SETUP-MSIN-REFERENCE
              THRU 9300-SETUP-MSIN-REFERENCE-X.

      *
      *    MOVE ENTER CODE TO A WORK FIELD, AND DECIDE WHICH SCREEN TO
      *    DISPLAY.
      *
           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.

           IF WS-BUS-FCN-RETRIEVE
           OR WS-BUS-FCN-UPDATE
           OR WS-BUS-FCN-DELETE
              PERFORM 2110-CHECK-UXIT
                 THRU 2110-CHECK-UXIT-X
           END-IF.

           IF WS-ERROR-FOUND
              GO TO 2000-PROCESS-REQUEST-X
           END-IF.


           EVALUATE TRUE

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM 3000-PROCESS-RETRIEVE
                       THRU 3000-PROCESS-RETRIEVE-X

               WHEN WS-BUS-FCN-LIST
                    PERFORM 3500-PROCESS-LIST
                       THRU 3500-PROCESS-LIST-X

               WHEN WS-BUS-FCN-CREATE
                    PERFORM 4000-PROCESS-CREATE
                       THRU 4000-PROCESS-CREATE-X

               WHEN WS-BUS-FCN-UPDATE
                    PERFORM 5000-PROCESS-UPDATE
                       THRU 5000-PROCESS-UPDATE-X

               WHEN WS-BUS-FCN-DELETE
                    PERFORM 6000-PROCESS-DELETE
                       THRU 6000-PROCESS-DELETE-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID
                                      TO WGLOB-MSG-PARM (1)
                    MOVE 'XSOM0310'
                                      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237' TO  WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST TO TRUE

           END-EVALUATE.

       2000-PROCESS-REQUEST-X.
           EXIT.
      /

      *****************************************************************
      *   CHECK UXIT:
      *   ENSURE THAT THE USER EXIT ROW EXISTS
      *****************************************************************
      *****************
       2110-CHECK-UXIT.
      *****************

           SET WS-NO-ERROR                              TO  TRUE.

           IF  MIR-USER-EXIT-ID  = SPACES
      *MSG:    USER EXIT POINTER IS REQUIRED
               MOVE 'XS03100001'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               SET WS-ERROR-FOUND                       TO  TRUE,
               GO  TO  2110-CHECK-UXIT-X
           END-IF.

           MOVE MIR-USER-EXIT-ID      TO WUXIT-USER-EXIT-ID.

           PERFORM 8100-READ-UXIT-INFO
              THRU 8100-READ-UXIT-INFO-X.

       2110-CHECK-UXIT-X.
           EXIT.
      /
      **************
       3000-PROCESS-RETRIEVE.
      **************

           PERFORM 9200-MOVE-RECORD-TO-SCREEN
              THRU 9200-MOVE-RECORD-TO-SCREEN-X.
      *MSG:'INQUIRE COMPLETED - CONTINUE'
           MOVE 'XS00000002'          TO WGLOB-MSG-REF-INFO
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.


       3000-PROCESS-RETRIEVE-X.
           EXIT.
      /
      *************
       3500-PROCESS-LIST.
      *************


           MOVE SPACES                TO MIR-USER-EXIT-ID-G.
           MOVE SPACES                TO MIR-ONLN-PGM-ID-G.
           MOVE SPACES                TO MIR-BTCH-PGM-ID-G.
           MOVE SPACES                TO MIR-USER-EXIT-INVOK-CD-G.


           MOVE LOW-VALUES            TO WUXIT-KEY.
           MOVE HIGH-VALUES           TO WUXIT-ENDBR-KEY.

           MOVE MIR-USER-EXIT-ID      TO WUXIT-USER-EXIT-ID.

           PERFORM UXIT-1000-BROWSE
              THRU UXIT-1000-BROWSE-X

           IF NOT WUXIT-IO-OK
      *MSG:    'NO RECORDS FOUND TO DISPLAY'
               MOVE 'XS00000034'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3500-PROCESS-LIST-X
           END-IF.

           PERFORM UXIT-2000-READ-NEXT
              THRU UXIT-2000-READ-NEXT-X.

           IF NOT WUXIT-IO-OK
           OR WUXIT-IO-EOF
      *MSG:    'NO RECORDS FOUND TO DISPLAY'
               MOVE 'XS00000034'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM UXIT-3000-END-BROWSE
                  THRU UXIT-3000-END-BROWSE-X
               GO TO 3500-PROCESS-LIST-X
           END-IF.

           PERFORM 9200-MOVE-RECORD-TO-SCREEN
              THRU 9200-MOVE-RECORD-TO-SCREEN-X.

           IF WUXIT-IO-OK
      *MSG:    TO VIEW MORE DATA PRESS ENTER'
               SET WGLOB-MORE-DATA-EXISTS   TO TRUE
               MOVE 'XS00000014'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
      *MSG:    'END OF FILE REACHED'
               MOVE 'XS00000025'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           PERFORM UXIT-3000-END-BROWSE
              THRU UXIT-3000-END-BROWSE-X.

       3500-PROCESS-LIST-X.
           EXIT.
      /

      *************
       4000-PROCESS-CREATE.
      *************

           MOVE MIR-USER-EXIT-ID      TO WUXIT-USER-EXIT-ID.

           PERFORM UXIT-1000-READ
              THRU UXIT-1000-READ-X.

           IF  WUXIT-IO-OK
               MOVE WUXIT-KEY         TO WGLOB-MSG-PARM (1)
      *MSG:    RECORD (@1) ALREADY EXISTS'
               MOVE 'XS00000003'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4000-PROCESS-CREATE-X
           END-IF.

      *
      ***  EDIT THE USER EXIT POINTER KEY FIELD.
      *
           MOVE MIR-USER-EXIT-ID      TO WS-UXIT-POINTER.

           IF  WS-VALID-UXIT-POINTER
               CONTINUE
           ELSE
      *MSG:    INVALID USER EXIT POINTER ENTERED
               MOVE 'XS03100002'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4000-PROCESS-CREATE-X
           END-IF.

      *
      ***  CREATE RECORD AND SWITCH TO MAINTAIN MODE.
      *
           PERFORM UXIT-1000-CREATE
              THRU UXIT-1000-CREATE-X.

           MOVE 'XS00000004'          TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM UXIT-1000-WRITE
              THRU UXIT-1000-WRITE-X.

           PERFORM 9200-MOVE-RECORD-TO-SCREEN
              THRU 9200-MOVE-RECORD-TO-SCREEN-X.

       4000-PROCESS-CREATE-X.
           EXIT.
      /

      *************************
       5000-PROCESS-UPDATE.
      *************************
      *
      *   MAINTENANCE PROCESSING PART 2 INCLUDES EDITING THE
      *   DATA AND UPDATING, DELETING AND CREATING RECORDS.
      *
           MOVE MIR-USER-EXIT-ID      TO WUXIT-USER-EXIT-ID.

           PERFORM UXIT-1000-READ-FOR-UPDATE
              THRU UXIT-1000-READ-FOR-UPDATE-X.

           IF  NOT WUXIT-IO-OK
               GO TO 5000-PROCESS-UPDATE-X
           END-IF.


           PERFORM 5300-EDIT-UXIT-SCREEN-DATA
              THRU 5300-EDIT-UXIT-SCREEN-DATA-X.

           IF  WGLOB-MSG-ERROR-SW > 0
               GO TO 5000-PROCESS-UPDATE-X
           END-IF.

           MOVE MIR-ONLN-PGM-ID       TO RUXIT-ONLN-PGM-ID.
           MOVE MIR-BTCH-PGM-ID       TO RUXIT-BTCH-PGM-ID.
           MOVE MIR-USER-EXIT-INVOK-CD      TO RUXIT-USER-EXIT-INVOK-CD.
           PERFORM UXIT-2000-REWRITE
              THRU UXIT-2000-REWRITE-X.

      *MSG:    MAINTENANCE COMPLETE
           MOVE 'XS00000007'          TO WGLOB-MSG-REF-INFO.
           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

       5000-PROCESS-UPDATE-X.
           EXIT.

      /
      ****************************
       5300-EDIT-UXIT-SCREEN-DATA.
      ****************************

           IF  MIR-ONLN-PGM-ID = SPACES
      *MSG:    'PROGRAM ID IS REQUIRED'
               MOVE 'XS03100004'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           IF  MIR-BTCH-PGM-ID = SPACES
      *MSG:    'PROGRAM ID IS REQUIRED'
               MOVE 'XS03100004'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

           MOVE MIR-USER-EXIT-INVOK-CD             TO WS-USER-EXIT-TYPE.

           IF  WS-VALID-USER-EXIT-TYPE
               CONTINUE
           ELSE
      *MSG:    'VALID INVOCATION TYPES ARE A, B, R, I'
               MOVE 'XS03100003'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       5300-EDIT-UXIT-SCREEN-DATA-X.
           EXIT.

     /


      ********************
       6000-PROCESS-DELETE.
      ********************
      ***************************************************************
      * DELETE PROCESSING PART 2 CONSISTS OF DELETING THE
      * RECORD (BACKOUTS ARE HANDLED IN THE MAINLINE).
      *
      * BUILD UXIT KEY FROM KEY AREA ON SCREEN.
      ***************************************************************

           MOVE MIR-USER-EXIT-ID      TO WUXIT-USER-EXIT-ID.

           PERFORM UXIT-1000-READ-FOR-UPDATE
              THRU UXIT-1000-READ-FOR-UPDATE-X

           IF  WUXIT-IO-OK
               PERFORM UXIT-1000-DELETE
                  THRU UXIT-1000-DELETE-X
               IF WUXIT-IO-OK
      *MSG:       DELETE COMPLETED MESSAGE
                  MOVE 'XS00000011'   TO WGLOB-MSG-REF-INFO
               ELSE
      *MSG:       RECORD (@1) LOST IN DELETE
                  MOVE WUXIT-KEY      TO WGLOB-MSG-PARM (1)
                  MOVE 'XS00000010'   TO WGLOB-MSG-REF-INFO
               END-IF
           ELSE
      *MSG:    RECORD (@1) LOST IN DELETE
               MOVE WUXIT-KEY         TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000010'      TO WGLOB-MSG-REF-INFO
           END-IF.

           PERFORM 0260-1000-GENERATE-MESSAGE
              THRU 0260-1000-GENERATE-MESSAGE-X.

           PERFORM 9100-BLANK-DATA-FIELDS
              THRU 9100-BLANK-DATA-FIELDS-X.


       6000-PROCESS-DELETE-X.
           EXIT.
      /
      *********************
       8100-READ-UXIT-INFO.
      *********************

           IF  RUXIT-USER-EXIT-ID = WUXIT-USER-EXIT-ID
               GO TO 8100-READ-UXIT-INFO-X
           END-IF.

           PERFORM UXIT-1000-READ
              THRU UXIT-1000-READ-X.

           IF WUXIT-IO-NOT-FOUND
      *MSG:    "USER EXIT POINTER NOT FOUND"
               MOVE 'XS03100005'      TO WGLOB-MSG-REF-INFO
               PERFORM 0260-1000-GENERATE-MESSAGE
                  THRU 0260-1000-GENERATE-MESSAGE-X
               PERFORM 9100-BLANK-DATA-FIELDS
                  THRU 9100-BLANK-DATA-FIELDS-X
               SET WS-ERROR-FOUND           TO TRUE
           END-IF.

       8100-READ-UXIT-INFO-X.
           EXIT.
      /

      *****************************************************************
      *  SET EACH NON-KEY FIELD TO SPACES
      *****************************************************************
      ************************
       9100-BLANK-DATA-FIELDS.
      ************************

           IF  WS-BUS-FCN-LIST
               MOVE SPACES            TO MIR-USER-EXIT-ID-G
               MOVE SPACES            TO MIR-ONLN-PGM-ID-G
               MOVE SPACES            TO MIR-BTCH-PGM-ID-G
               MOVE SPACES            TO MIR-USER-EXIT-INVOK-CD-G
           ELSE
               MOVE SPACES            TO MIR-ONLN-PGM-ID
               MOVE SPACES            TO MIR-BTCH-PGM-ID
               MOVE SPACES            TO MIR-USER-EXIT-INVOK-CD
           END-IF.

       9100-BLANK-DATA-FIELDS-X.
           EXIT.
      /
      *****************************************************************
      *  MOVE FILE VALUES TO THE SCREEN.
      *****************************************************************
      ****************************
       9200-MOVE-RECORD-TO-SCREEN.
      ****************************

           IF  WS-BUS-FCN-LIST
               PERFORM 9210-MOVE-UXIT-TO-SCRN-1
                  THRU 9210-MOVE-UXIT-TO-SCRN-1-X
                VARYING I FROM 1 BY 1
                  UNTIL I > WS-MAX-BROWSE-LINES
                     OR WUXIT-IO-EOF
           ELSE
               MOVE RUXIT-ONLN-PGM-ID TO MIR-ONLN-PGM-ID
               MOVE RUXIT-BTCH-PGM-ID TO MIR-BTCH-PGM-ID
               MOVE RUXIT-USER-EXIT-INVOK-CD
                                      TO MIR-USER-EXIT-INVOK-CD
           END-IF.


           IF  WS-BUS-FCN-LIST
               IF WUXIT-IO-EOF
                  MOVE MIR-USER-EXIT-ID-T (1)
                                      TO MIR-USER-EXIT-ID
               ELSE
                  MOVE RUXIT-USER-EXIT-ID
                                      TO MIR-USER-EXIT-ID
               END-IF
           END-IF.

       9200-MOVE-RECORD-TO-SCREEN-X.
           EXIT.

      /
      **************************
       9210-MOVE-UXIT-TO-SCRN-1.
      **************************

           MOVE RUXIT-USER-EXIT-ID    TO MIR-USER-EXIT-ID-T  (I).
           MOVE RUXIT-ONLN-PGM-ID     TO MIR-ONLN-PGM-ID-T (I).
           MOVE RUXIT-BTCH-PGM-ID     TO MIR-BTCH-PGM-ID-T (I).
           MOVE RUXIT-USER-EXIT-INVOK-CD
                                      TO MIR-USER-EXIT-INVOK-CD-T   (I).

           PERFORM UXIT-2000-READ-NEXT
              THRU UXIT-2000-READ-NEXT-X.

       9210-MOVE-UXIT-TO-SCRN-1-X.
           EXIT.
      /
      *****************************************************************
      *  MOVE INFORMATION IDENTIFYING THE OBJECT BEING WORKED ON
      *       TO THE GLOBAL AREA FOR MSIN AND MSAU PROCESSING
      *****************************************************************
      ***************************
       9300-SETUP-MSIN-REFERENCE.
      ***************************

           MOVE SPACES                TO WGLOB-MSIN-REFERENCE.
           MOVE WGLOB-COMPANY-CODE    TO WGLOB-REF-COMPANY-CODE.

       9300-SETUP-MSIN-REFERENCE-X.
           EXIT.
      /


      ******************************************************************
      *                      PROCESSING COPYBOOKS                      *
      ******************************************************************
       COPY XCPPINIT.
       COPY XCPPEXIT.
014660*COPY XCPPMEXT.
     /
      ******************************************************************
      *                      LINK COPYBOOKS                            *
      ******************************************************************
       COPY XCCL0260.

      ******************************************************************
      *                     FILE HANDLING COPYBOOKS                    *
      ******************************************************************
       COPY XCPAUXIT.
       COPY XCPNUXIT.
       COPY XCPBUXIT.
       COPY XCPCUXIT.
       COPY XCPUUXIT.
       COPY XCPXUXIT.
      /
       COPY XCCPABND.
       COPY XCCP0030.
      ******************************************************************
      *                  END OF PROGRAM XSOM0310                       *
      ******************************************************************

