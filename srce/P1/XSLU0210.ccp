      *************************
       IDENTIFICATION DIVISION.
      *************************

       PROGRAM-ID. XSLU0210.

       COPY XCWWCRHT.

      *****************************************************************
      **  MEMBER :  XSLU0210                                         **
      **  REMARKS:  VERIFY TRANSACTION ID ON THE TXID FILE.          **
      **            THIS MODULE READS THE TXID TABLE FOR THE         **
      **            REQUESTED KEY AND SETS THE RETURN CODE ACCORDING **
      **            TO WHETHER OR NOT THE RECORD IS FOUND.           **
      **                                                             **
      **  DOMAIN :  SY                                               **
      **  CLASS  :  UT                                               **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
53-062**  30NOV95  VK     ADD WORKING STORAGE COPYBOOK XCWWPGWS      **
53-067**  30NOV95  VK     CHANGES TO SUPPORT I/O PROGRAMS            **
54-001**  01SEP96  ALW    MODIFICATIONS FOR MAINTAINABILITY          **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
014590**  15DEC99  60     ARCHITECTURAL CHANGES                      **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************

      ***************
       DATA DIVISION.
      ***************

       WORKING-STORAGE SECTION.

53-062 COPY XCWWPGWS REPLACING '$VAR1' BY 'XSLU0210'.

       COPY SQLCA.
007766 COPY XCWLPTR.


014590*COPY XCWL0030.

012624*COPY XCFWTXID.
012624*COPY XCFRTXID.
012624 COPY XCFWBFCN.
012624 COPY XCFRBFCN.
      /


      *****************
       LINKAGE SECTION.
      *****************

       01   DFHCOMMAREA.
           02  WGLOB-GLOBAL-AREA.
       COPY XCWWGLOB.
007766 COPY XCWL0210.
      /
      ********************
       PROCEDURE DIVISION.
      ********************

      *--------------
       0000-MAINLINE.
      *--------------

007766     SET ADDRESS OF L0210-PARM-INFO    TO WGLOB-PARM-ADDR-PTR (1).
54-001     SET L0210-RETRN-OK                   TO TRUE.

54-001     EVALUATE TRUE

012624*        WHEN  L0210-RQST-VER-TXID
012624         WHEN  L0210-RQST-VER-BFID
012624*             PERFORM  1000-VERIFY-TRANS-ID
012624*                 THRU 1000-VERIFY-TRANS-ID-X
012624              PERFORM  1000-VERIFY-BUS-FCN
012624                  THRU 1000-VERIFY-BUS-FCN-X

54-001         WHEN OTHER
54-001              SET  L0210-RETRN-INVALID-REQUEST TO TRUE
014590              MOVE L0210-RETRN-CD      TO WGLOB-ERR-RETRN-CD
54-001              PERFORM  0030-5000-LOGIC-ERROR
54-001                  THRU 0030-5000-LOGIC-ERROR-X

54-001     END-EVALUATE.


           GOBACK.

       0000-MAINLINE-X.
           EXIT.

012624*1000-VERIFY-TRANS-ID.
012624*
012624*      MOVE L0210-TRAN-ID                   TO WTXID-KEY.
012624*
012624*      PERFORM   TXID-1000-READ
012624*          THRU  TXID-1000-READ-X.
012624*
012624*      IF WTXID-IO-OK
012624*          MOVE 'Y'                          TO L0210-TRAN-ID-STATUS
012624*      ELSE
012624*          MOVE 'N'                          TO L0210-TRAN-ID-STATUS
012624*      END-IF.

012624*1000-VERIFY-TRANS-ID-X.
           EXIT.
      /
012624 1000-VERIFY-BUS-FCN.
012624
012624      MOVE L0210-BUS-FCN-ID     TO WBFCN-BUS-FCN-ID.
012624
012624      PERFORM   BFCN-1000-READ
012624          THRU  BFCN-1000-READ-X.
012624
012624      IF WBFCN-IO-OK
012624         MOVE 'Y'               TO L0210-BUS-FCN-ID-STATUS
012624      ELSE
012624         MOVE 'N'               TO L0210-BUS-FCN-ID-STATUS
012624      END-IF.

012624 1000-VERIFY-BUS-FCN-X.
           EXIT.
012624*COPY XCPNTXID.
012624 COPY XCPNBFCN.
       COPY XCCP0030.

      ******************************************************************
      ***                           END OF XSLU0210                  ***
      ******************************************************************
