       IDENTIFICATION DIVISION.

       PROGRAM-ID. VSOM0130.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  VSOM0130                                         **
      **  REMARKS:  VSBK PROCESS DRIVER                              **
      **                                                             **
      **  DOMAIN :  AT                                               **
      **  CLASS  :  PD                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ARCHITECTURE CHANGES TO SUPPORT GRAPHICAL  **
53-062**                  USER INTERFACE                             **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  31DEC96  JMG    MODIFICATIONS FOR MAINTAINABILITY          **
557918**  30SEP97  JMG    REPLACE NON-STANDARD MESSAGES              **
557660**  30SEP97  JT     CODE CLEANUP                               **
557660**  30SEP97  SLR    ADD DOMAIN/CLASS                           **
557708**  30SEP97  LLE    HANDLING OF CICS ABENDS                    **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
013578**  15DEC99  60     REMOVAL OF 3270 LOGIC, MIR RENAMES         **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************
      /
      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'VSOM0130'.

       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.

       01  WS-PGM-WORK-AREA.
           05  WS-BUS-FCN-ID               PIC X(04).
               88  WS-BUS-FCN-ID-VALID     VALUES
                   '1860' '1861' '1862' '1863'.
               88  WS-BUS-FCN-RETRIEVE     VALUE  '1860'.
               88  WS-BUS-FCN-CREATE       VALUE  '1861'.
               88  WS-BUS-FCN-UPDATE       VALUE  '1862'.
               88  WS-BUS-FCN-DELETE       VALUE  '1863'.
           05  ERROR-SW                    PIC 9.
               88  NO-ERRORS               VALUES ARE 0.
               88  ERRORS-EXIST            VALUES ARE 1.

      ******************************************************************
      *  COMMON COPYBOOKS                                              *
      ******************************************************************
       COPY XCWWWKDT.
      /
       COPY XCWEBLCH.

      ******************************************************************
      *  I/O COPYBOOKS                                                 *
      ******************************************************************
       COPY CCFRPH.
       COPY CCFWPH.
      /
       COPY VCFWVS.
       COPY VCFRVS.
     /
       COPY CCFREDIT.
       COPY CCFWEDIT.
      ******************************************************************
      *  CALLED MODULE PARAMETER INFORMATION                           *
      ******************************************************************
       COPY VCWL0131.
      /

      ******************************************************************
      *  INPUT PARAMETER INFORMATION                                   *
      ******************************************************************
007766*01  WGLOB-GLOBAL-AREA.
007766*COPY XCWWGLOB.
      /

      ****************
       LINKAGE SECTION.
      *****************

007766 01 WGLOB-GLOBAL-AREA.
007766 COPY XCWWGLOB.
       COPY VCWM0130.
      /
       PROCEDURE DIVISION USING WGLOB-GLOBAL-AREA
                                MIR-PARM-AREA.

      *--------------
       0000-MAINLINE.
      *--------------

557708     PERFORM  ABND-1000-HANDLE-ABEND
557708         THRU ABND-1000-HANDLE-ABEND-X.
557708
           PERFORM  INIT-1000-INITIALIZE
               THRU INIT-1000-INITIALIZE-X.

           PERFORM  0200-PROCESS-REQUEST
               THRU 0200-PROCESS-REQUEST-X.

           PERFORM  EXIT-1000-FINALIZE
               THRU EXIT-1000-FINALIZE-X.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.
      /
      *---------------------
       0200-PROCESS-REQUEST.
      *---------------------

           SET  MIR-RETRN-OK          TO TRUE.
           MOVE MIR-BUS-FCN-ID        TO WS-BUS-FCN-ID.

           EVALUATE TRUE

               WHEN WS-BUS-FCN-RETRIEVE
                    PERFORM  1000-PROCESS-RETRIEVE
                        THRU 1000-PROCESS-RETRIEVE-X

               WHEN WS-BUS-FCN-CREATE
                    PERFORM  2000-PROCESS-CREATE
                        THRU 2000-PROCESS-CREATE-X

               WHEN WS-BUS-FCN-UPDATE
                    PERFORM  3000-PROCESS-UPDATE
                        THRU 3000-PROCESS-UPDATE-X

               WHEN WS-BUS-FCN-DELETE
                    PERFORM  4000-PROCESS-DELETE
                        THRU 4000-PROCESS-DELETE-X

               WHEN OTHER
      *MSG: INVALID BUSINESS FUNCTION @1 FOR PROGRAM @2
                    MOVE MIR-BUS-FCN-ID  TO WGLOB-MSG-PARM (1)
                    MOVE 'VSOM0130'      TO WGLOB-MSG-PARM (2)
                    MOVE 'XS00000237'    TO WGLOB-MSG-REF-INFO
                    PERFORM  0260-1000-GENERATE-MESSAGE
                        THRU 0260-1000-GENERATE-MESSAGE-X
                    SET MIR-RETRN-INVALD-RQST  TO TRUE

           END-EVALUATE.

       0200-PROCESS-REQUEST-X.
           EXIT.
      /

      *   INQUIRY PROCESSING: RETRIEVE RECORD AND DISPLAY.

      *----------------------
       1000-PROCESS-RETRIEVE.
      *----------------------

      *    EDIT THE VS-KEY FIELD FIRST TO SEE IF ON ETAB THEN
      *    SET UP VS-KEY FIELD

557660     MOVE MIR-VSELC-ID          TO  WVS-VSELC-ID.

           PERFORM  6100-KEY-EDIT
               THRU 6100-KEY-EDIT-X.

           PERFORM  VS-1000-READ
               THRU VS-1000-READ-X.

           IF NOT WVS-IO-OK
      ***  MSG: 'RECORD (@1) NOT FOUND'
557918*        MOVE 'VS00000004' TO WGLOB-MSG-REF-INFO
557918         MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
557918         MOVE WVS-KEY           TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 1000-PROCESS-RETRIEVE-X
           END-IF.

           PERFORM  5000-DISPLAY-RECORDS
               THRU 5000-DISPLAY-RECORDS-X.
557918*MSG: 'INQUIRE COMPLETED - CONTINUE
           MOVE 'XS00000002'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       1000-PROCESS-RETRIEVE-X.
           EXIT.

      *   CREATE PROCESSING: CHECK RECORD DOES NOT EXIST, INIT NEW
      *   RECORD AND ALLOW USER TO MODIFY.

      *--------------------
       2000-PROCESS-CREATE.
      *--------------------

      *    EDIT THE KEY FIRST TO SEE IF ON ETAB THEN
      *    SET UP VS-KEY FIELD

           MOVE MIR-VSELC-ID          TO  WVS-VSELC-ID.

           PERFORM  6100-KEY-EDIT
               THRU 6100-KEY-EDIT-X.

557918     IF WGLOB-MSG-ERROR-SW > ZERO
557918        IF WGLOB-MSG-SEVRTY-FATAL
557918           GO TO 2000-PROCESS-CREATE-X
557918        END-IF
557918     END-IF.

           PERFORM  VS-1000-READ
               THRU VS-1000-READ-X.

           IF WVS-IO-OK
      *** MESSAGE 'RECORD (@1) ALREADY EXISTS'
557918*        MOVE 'VS00000005' TO WGLOB-MSG-REF-INFO
557918         MOVE 'XS00000003'      TO WGLOB-MSG-REF-INFO
557918         MOVE WVS-KEY           TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 2000-PROCESS-CREATE-X
           END-IF.

           PERFORM  VS-1000-CREATE
               THRU VS-1000-CREATE-X.

           PERFORM  VS-1000-WRITE
               THRU VS-1000-WRITE-X.

           PERFORM  5000-DISPLAY-RECORDS
               THRU 5000-DISPLAY-RECORDS-X.

      ***  MSG: 'RECORD CREATED - CONTINUE'
557918*    MOVE 'VS00000006' TO WGLOB-MSG-REF-INFO.
557918     MOVE 'XS00000004'          TO WGLOB-MSG-REF-INFO.
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       2000-PROCESS-CREATE-X.
           EXIT.

      /
      *
      *   MAINTAIN PROCESSING: GET RECORD, EDIT DATA FIELDS, AND UPDATE
      *   IF NO EDIT ERRORS; ELSE UNLOCK.
      *

      *--------------------
       3000-PROCESS-UPDATE.
      *--------------------

      *    SET UP VS-KEY FIELDS

           MOVE MIR-VSELC-ID          TO  WVS-VSELC-ID.

           PERFORM  6100-KEY-EDIT
               THRU 6100-KEY-EDIT-X.

           PERFORM  VS-1000-READ-FOR-UPDATE
               THRU VS-1000-READ-FOR-UPDATE-X.

           IF  WVS-IO-OK
               NEXT SENTENCE
           ELSE
      ***  MSG: 'RECORD LOST IN MAINTAIN (@1) - CONTACT SYSTEMS'
               MOVE WVS-KEY           TO WGLOB-MSG-PARM (1)
               MOVE 'XS00000006'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 3000-PROCESS-UPDATE-X
           END-IF.

           MOVE ZERO                  TO ERROR-SW.

           PERFORM  6000-EDIT-FIELDS
               THRU 6000-EDIT-FIELDS-X.

           PERFORM  VS-2000-REWRITE
               THRU VS-2000-REWRITE-X.

           IF L0131-RETRN-OK
      ***  MSG: 'MAINTENANCE COMPLETE - CONTINUE'
               MOVE 'XS00000007'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           ELSE
      ***  MSG: 'RECORD UPDATED'
               MOVE 'XS00000008'  TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
           END-IF.

       3000-PROCESS-UPDATE-X.
           EXIT.

      /
      *
      *   DELETE PROCESSING:
      *

       4000-PROCESS-DELETE.

      *    ONLY SET UP KEY FIELD IF KEY CAN BE FOUND ON ETAB
      *
557660     MOVE MIR-VSELC-ID          TO  WVS-VSELC-ID.

           PERFORM  6100-KEY-EDIT
               THRU 6100-KEY-EDIT-X.

           PERFORM  VS-1000-READ-FOR-UPDATE
               THRU VS-1000-READ-FOR-UPDATE-X.

           IF  NOT WVS-IO-OK
      *** MSG: 'RECORD (@1) NOT FOUND'
557918*        MOVE 'VS00000008' TO WGLOB-MSG-REF-INFO
557918         MOVE 'XS00000001'      TO WGLOB-MSG-REF-INFO
557918         MOVE WVS-KEY           TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 4000-PROCESS-DELETE-X
           END-IF.

           PERFORM  VS-1000-DELETE
               THRU VS-1000-DELETE-X.

      *** MSG: 'DELETE COMPLETED - CONTINUE'
557918*    MOVE 'VS00000007' TO WGLOB-MSG-REF-INFO
557918     MOVE 'XS00000011'          TO WGLOB-MSG-REF-INFO
           PERFORM  0260-1000-GENERATE-MESSAGE
               THRU 0260-1000-GENERATE-MESSAGE-X.

       4000-PROCESS-DELETE-X.
           EXIT.

      /
      *---------------------
       5000-DISPLAY-RECORDS.
      *----------------------

      *  MOVE ALL RECORD FIELDS TO THE SCREEN (MIR- FIELDS)

           MOVE RVS-VALN-LBL-ID        TO MIR-VALN-LBL-ID.
           MOVE RVS-VSELC-INS-TYP-CD   TO MIR-VSELC-INS-TYP-CD.
           MOVE RVS-PLAN-ID            TO MIR-PLAN-ID.
           MOVE RVS-VSELC-POL-PAR-CD   TO MIR-VSELC-POL-PAR-CD.
           MOVE RVS-VSELC-CVG-PAR-CD   TO MIR-VSELC-CVG-PAR-CD.
           MOVE RVS-VSELC-SMKR-CD      TO MIR-VSELC-SMKR-CD.
           MOVE RVS-VSELC-SEX-CD       TO MIR-VSELC-SEX-CD.
           MOVE RVS-VSELC-STBL-1-CD    TO MIR-VSELC-STBL-1-CD.
           MOVE RVS-VSELC-STBL-2-CD    TO MIR-VSELC-STBL-2-CD.
           MOVE RVS-VSELC-LOW-ISS-AGE  TO MIR-VSELC-LOW-ISS-AGE.
           MOVE RVS-VSELC-HIGH-ISS-AGE TO MIR-VSELC-HIGH-ISS-AGE.

       5000-DISPLAY-RECORDS-X.
           EXIT.

      *------------------
       6000-EDIT-FIELDS.
      *------------------

           PERFORM  0131-1000-BUILD-PARM-INFO
               THRU 0131-1000-BUILD-PARM-INFO-X.

           PERFORM  0131-1000-VSBK-EDITS
               THRU 0131-1000-VSBK-EDITS-X.

           EVALUATE TRUE

               WHEN L0131-RETRN-INVALID-REQUEST
                    MOVE +1           TO WGLOB-RETURN-CODE

               WHEN L0131-RETRN-EDIT-ERRORS
                    MOVE +1           TO WGLOB-RETURN-CODE
                    PERFORM  6020-EDIT-RETURN-SCREEN
                        THRU 6020-EDIT-RETURN-SCREEN-X

               WHEN L0131-RETRN-OK
                    PERFORM  6020-EDIT-RETURN-SCREEN
                        THRU 6020-EDIT-RETURN-SCREEN-X

           END-EVALUATE.

       6000-EDIT-FIELDS-X.
           EXIT.

      *------------------------
       6020-EDIT-RETURN-SCREEN.
      *------------------------

      * LABEL

           IF L0131-VAL-LABL           = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-VAL-LABL    TO MIR-VALN-LBL-ID
           END-IF.

      *  COMPONENT TYPE

           IF L0131-COMP-TYP           = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-COMP-TYP    TO MIR-VSELC-INS-TYP-CD
           END-IF.

      *  PLAN AND RATE SCALE

           IF L0131-PLAN-RS            = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-PLAN-RS     TO MIR-PLAN-ID
           END-IF.

      *  PAR DIGIT

           IF L0131-PAR-DGT            = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-PAR-DGT     TO MIR-VSELC-POL-PAR-CD
           END-IF.

      *  PAR CODE

           IF L0131-PAR-CD             = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-PAR-CD      TO MIR-VSELC-CVG-PAR-CD
           END-IF.

      *  SMOKER CODE

           IF L0131-SMKR-CD            = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-SMKR-CD     TO MIR-VSELC-SMKR-CD
           END-IF.

      *  SEX CODE

           IF L0131-SEX-CD             = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-SEX-CD      TO MIR-VSELC-SEX-CD
           END-IF.

      * TABLE 1

           IF L0131-TBL1               = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-TBL1        TO MIR-VSELC-STBL-1-CD
           END-IF.

      *  TABLE 2

           IF L0131-TBL2               = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-TBL2        TO MIR-VSELC-STBL-2-CD
           END-IF.

      *  LOW AGE

           IF L0131-LOW-AGE            = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-LOW-AGE     TO MIR-VSELC-LOW-ISS-AGE
           END-IF.

      *  HIGH AGE

           IF L0131-HIGH-AGE           = HIGH-VALUES
               NEXT SENTENCE
           ELSE
               MOVE L0131-HIGH-AGE    TO MIR-VSELC-HIGH-ISS-AGE
           END-IF.

       6020-EDIT-RETURN-SCREEN-X.
           EXIT.
      /
      *---------------
       6100-KEY-EDIT.
      *---------------

           IF MIR-VSELC-ID    = 'XXXXXX'
               MOVE 'VS01300001'      TO WGLOB-MSG-REF-INFO
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 6100-KEY-EDIT-X
557660     END-IF.

557660     MOVE MIR-VSELC-ID          TO WEDIT-ETBL-VALU-ID.
557660     PERFORM  VSBK-1000-EDIT-VALN-TYPE
557660         THRU VSBK-1000-EDIT-VALN-TYPE-X.

557660     IF NOT WEDIT-IO-OK
557660         MOVE 'VS01300002'      TO WGLOB-MSG-REF-INFO
557660         PERFORM  0260-1000-GENERATE-MESSAGE
557660             THRU 0260-1000-GENERATE-MESSAGE-X
557660         GO TO 6100-KEY-EDIT-X
557660     END-IF.

       6100-KEY-EDIT-X.
           EXIT.
      /

      ****************************************************************
      * PROCESSING COPYBOOKS                                         *
      ****************************************************************
       COPY VCPS0131.
      /
       COPY VCPEVSBK.
      /
       COPY XCPPINIT.
      /
       COPY XCPPEXIT.
      /
      ****************************************************************
      * LINKAGE PROCESSING COPYBOOKS                                 *
      ****************************************************************
       COPY VCCL0131.
      /
       COPY XCCL0260.
      /
      *****************************************************************
      *  FILE I/O PROCESS MODULES                                    **
      *****************************************************************
       COPY VCPAVS.
       COPY VCPNVS.
       COPY VCPUVS.
       COPY VCPXVS.
       COPY VCPCVS.
      /
       COPY CCPNEDIT.
      *****************************************************************
      *  ERROR HANDLING ROUTINES                                     **
      *****************************************************************
557708*COPY XCCPHNDL.
557708 COPY XCCPABND.
       COPY XCCP0030.

      *****************************************************************
      **                 END OF PROGRAM VSOM0130                     **
      *****************************************************************
