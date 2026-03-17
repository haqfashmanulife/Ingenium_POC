      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID.  XSLU0225.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSLU0225                                         **
      **  REMARKS:  USER ID VERIFICATION WORKER MODULE               **
      **            THIS PROGRAM VALIDATES USER SECURITY BY BROWSING **
      **            THE ASCL TABLE WITH THE PASSED COMPANY CODE.  IF **
      **            ANY RECORD IS FOUND, THE MODULE READS THE TSCL   **
      **            TABLE AND MOVES THE ALLOWABLE ENTER CODES FOR    **
      **            THE TRANSACTION TO THE L0225- PARM AREA.         **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-004**  30NOV95  SLB    INITIAL DESIGN.                            **
54-001**  01SEP96  ALW    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
012624**  15DEC99  60     SECURITY CHANGES FOR 6.0.                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************

      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.
      /
       COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU0225'.
       COPY SQLCA.
007766 COPY XCWLPTR.
      /
      /
014590*COPY XCWL0030.
      /
      /
013578*COPY XCWLTPI.
      /
012624*COPY XCFRTSCL.
012624*COPY XCFWTSCL.
012624 COPY XCFRBPFS.
012624 COPY XCFWBPFS.
      /
       COPY XCFRASCL.
       COPY XCFWASCL.
      /
012624*COPY XCFRTXID.
012624*COPY XCFWTXID.
012624 COPY XCFRBFCN.
012624 COPY XCFWBFCN.
      /
       COPY XCFRXTAB.
       COPY XCFWXTAB.
      /
      *****************
       LINKAGE SECTION.
      *****************

       01  DFHCOMMAREA.
           02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
007766 COPY XCWL0225.
      /

      ********************
       PROCEDURE DIVISION.
      ********************

      *---------------
       0000-MAINLINE.
      *---------------

007766     SET ADDRESS OF L0225-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).

54-001     IF  L0225-RQST-CD-VALID
54-001         SET L0225-RETRN-OK              TO TRUE
54-001     ELSE
54-001         SET  L0225-RETRN-INVALID-REQUEST TO TRUE
014590         MOVE L0225-RETRN-CD              TO WGLOB-ERR-RETRN-CD
54-001         PERFORM  0030-5000-LOGIC-ERROR
54-001             THRU 0030-5000-LOGIC-ERROR-X
54-001     END-IF.

           PERFORM  1000-VAL-USER-SECURITY
               THRU 1000-VAL-USER-SECURITY-X.


       COPY XCCPRETN.

           GOBACK.

       0000-MAINLINE-X.
           EXIT.

      *-------------------------------
       1000-VAL-USER-SECURITY.
      *-------------------------------

      *
      *** ASCL SECURITY.
      *

           MOVE L0225-TPI-USER-SEC-CLASS     TO WASCL-SECUR-CLAS-ID.
           MOVE L0225-COMPANY-CODE           TO WASCL-CO-ID.
012624*    MOVE LOW-VALUES                   TO WASCL-APPL-ID.
           MOVE WASCL-KEY                    TO WASCL-ENDBR-KEY.
012624*    MOVE HIGH-VALUES                  TO WASCL-ENDBR-APPL-ID.

           PERFORM  ASCL-1000-BROWSE
               THRU ASCL-1000-BROWSE-X.

           IF  WASCL-IO-OK
               PERFORM  ASCL-2000-READ-NEXT
                   THRU ASCL-2000-READ-NEXT-X
54-001     END-IF.

           IF  NOT WASCL-IO-OK
               MOVE L0225-COMPANY-CODE       TO WXTAB-ETBL-VALU-ID
               PERFORM  COMP-1000-EDIT-COMPANY
                   THRU COMP-1000-EDIT-COMPANY-X
               IF  WXTAB-IO-OK
      *MSG:        ACCESS DENIED TO COMPANY (@1)
                   MOVE 'XS02250001'         TO WGLOB-MSG-REF-INFO
                   MOVE L0225-COMPANY-CODE   TO WGLOB-MSG-PARM (1)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   PERFORM  ASCL-3000-END-BROWSE
                       THRU ASCL-3000-END-BROWSE-X
                   GO TO 1000-VAL-USER-SECURITY-X
               ELSE
      *MSG:        (@1) IS NOT A VALID COMPANY
                   MOVE 'XS02250002'         TO WGLOB-MSG-REF-INFO
                   MOVE L0225-COMPANY-CODE   TO WGLOB-MSG-PARM (1)
                   PERFORM  0260-1000-GENERATE-MESSAGE
                       THRU 0260-1000-GENERATE-MESSAGE-X
                   PERFORM  ASCL-3000-END-BROWSE
                       THRU ASCL-3000-END-BROWSE-X
                   GO TO 1000-VAL-USER-SECURITY-X
               END-IF
           END-IF.

           PERFORM  ASCL-3000-END-BROWSE
               THRU ASCL-3000-END-BROWSE-X.

      *
      ***  TSCL SECURITY.
      *
012624*    MOVE L0225-TPI-USER-SEC-CLASS     TO WTSCL-SECUR-CLAS-ID.
012624*    MOVE L0225-COMPANY-CODE           TO WTSCL-CO-ID.
012624*    MOVE L0225-TXID-TRXN-ID           TO WTSCL-TRXN-ID.
012624*    PERFORM  TSCL-1000-READ
012624*        THRU TSCL-1000-READ-X.

012624*    IF  NOT WTSCL-IO-OK

012624     MOVE L0225-TPI-USER-SEC-CLASS     TO WBPFS-SECUR-CLAS-ID.
012624     MOVE L0225-COMPANY-CODE           TO WBPFS-CO-ID.
012624     MOVE L0225-PRCES-ID               TO WBPFS-BPF-ID.
012624     PERFORM  BPFS-1000-READ
012624         THRU BPFS-1000-READ-X.

012624     IF  NOT WBPFS-IO-OK
      *MSG:    ACCESS DENIED TO COMPANY (@1)
               MOVE 'XS02250003'             TO WGLOB-MSG-REF-INFO
               MOVE L0225-COMPANY-CODE       TO WGLOB-MSG-PARM (1)
               PERFORM  0260-1000-GENERATE-MESSAGE
                   THRU 0260-1000-GENERATE-MESSAGE-X
               GO TO 1000-VAL-USER-SECURITY-X
           END-IF.

012624*    MOVE RTSCL-TSCL-TRXN-ENTR-CD      TO L0225-USER-SECURITY.

       1000-VAL-USER-SECURITY-X.
           EXIT.
      /
       COPY XCCL0260.
      /
       COPY XCPECOMP.
      /
       COPY XCPBASCL.
       COPY XCPNASCL.
      /
012624*COPY XCPNTSCL.
012624 COPY XCPNBPFS.
       COPY XCPNXTAB.
      /
       COPY XCCP0030.
      ******************************************************************
      ***                           END OF XSLU0225                  ***
      ******************************************************************
