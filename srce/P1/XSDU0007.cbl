      *************************
       IDENTIFICATION DIVISION.
      *************************
 
       PROGRAM-ID.    XSDU0007.
 
      *****************************************************************
      **  MEMBER :  XSDU0007                                         **
      **  REMARKS:  ROUTINE TO SET UP ADDRESS POINTER FOR ANY DATA   **
      **            ITEM PASSED                                      **
      **                                                             **
      **  DOMAIN :                                                   **
      **  CLASS  :                                                   **
      *****************************************************************
      **  DATE     AUTH.  DESCRIPTION                                **
      **                                                             **
007766**  30OCT98  56     ARCHITECTURE CHANGES TO SUPPORT PASSING    **
007766**                  PARAMETERS VIA AN ADDRESS                  **
      *****************************************************************
      /
      **********************
       ENVIRONMENT DIVISION.
      **********************
 
       CONFIGURATION SECTION.
      /
      ***************
       DATA DIVISION.
      ***************
      /
       WORKING-STORAGE SECTION.
 
       LINKAGE SECTION.
       01  ADDR-PARM-COUNT                PIC 99.
 
       01  ADDR-DATA-ITEM-01              PIC X(01).
       01  ADDR-ADDRESS-POINTER-01        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-02              PIC X(01).
       01  ADDR-ADDRESS-POINTER-02        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-03              PIC X(01).
       01  ADDR-ADDRESS-POINTER-03        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-04              PIC X(01).
       01  ADDR-ADDRESS-POINTER-04        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-05              PIC X(01).
       01  ADDR-ADDRESS-POINTER-05        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-06              PIC X(01).
       01  ADDR-ADDRESS-POINTER-06        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-07              PIC X(01).
       01  ADDR-ADDRESS-POINTER-07        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-08              PIC X(01).
       01  ADDR-ADDRESS-POINTER-08        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-09              PIC X(01).
       01  ADDR-ADDRESS-POINTER-09        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-10              PIC X(01).
       01  ADDR-ADDRESS-POINTER-10        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-11              PIC X(01).
       01  ADDR-ADDRESS-POINTER-11        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-12              PIC X(01).
       01  ADDR-ADDRESS-POINTER-12        USAGE IS POINTER.
 
       01  ADDR-DATA-ITEM-13              PIC X(01).
       01  ADDR-ADDRESS-POINTER-13        USAGE IS POINTER.
      /
      ********************
       PROCEDURE DIVISION USING ADDR-PARM-COUNT
                                ADDR-DATA-ITEM-01
                                ADDR-ADDRESS-POINTER-01
                                ADDR-DATA-ITEM-02
                                ADDR-ADDRESS-POINTER-02
                                ADDR-DATA-ITEM-03
                                ADDR-ADDRESS-POINTER-03
                                ADDR-DATA-ITEM-04
                                ADDR-ADDRESS-POINTER-04
                                ADDR-DATA-ITEM-05
                                ADDR-ADDRESS-POINTER-05
                                ADDR-DATA-ITEM-06
                                ADDR-ADDRESS-POINTER-06
                                ADDR-DATA-ITEM-07
                                ADDR-ADDRESS-POINTER-07
                                ADDR-DATA-ITEM-08
                                ADDR-ADDRESS-POINTER-08
                                ADDR-DATA-ITEM-09
                                ADDR-ADDRESS-POINTER-09
                                ADDR-DATA-ITEM-10
                                ADDR-ADDRESS-POINTER-10
                                ADDR-DATA-ITEM-11
                                ADDR-ADDRESS-POINTER-11
                                ADDR-DATA-ITEM-12
                                ADDR-ADDRESS-POINTER-12
                                ADDR-DATA-ITEM-13
                                ADDR-ADDRESS-POINTER-13.
      ********************
 
      *--------------
       0000-MAINLINE.
      *--------------
 
           SET ADDR-ADDRESS-POINTER-01 TO ADDRESS OF ADDR-DATA-ITEM-01.
 
           IF ADDR-PARM-COUNT > 1
              SET ADDR-ADDRESS-POINTER-02 TO
                                      ADDRESS OF ADDR-DATA-ITEM-02.
 
           IF ADDR-PARM-COUNT > 2
              SET ADDR-ADDRESS-POINTER-03 TO
                                      ADDRESS OF ADDR-DATA-ITEM-03.
 
           IF ADDR-PARM-COUNT > 3
              SET ADDR-ADDRESS-POINTER-04 TO
                                      ADDRESS OF ADDR-DATA-ITEM-04.
 
           IF ADDR-PARM-COUNT > 4
              SET ADDR-ADDRESS-POINTER-05 TO
                                      ADDRESS OF ADDR-DATA-ITEM-05.
 
           IF ADDR-PARM-COUNT > 5
              SET ADDR-ADDRESS-POINTER-06 TO
                                      ADDRESS OF ADDR-DATA-ITEM-06.
 
           IF ADDR-PARM-COUNT > 6
              SET ADDR-ADDRESS-POINTER-07 TO
                                      ADDRESS OF ADDR-DATA-ITEM-07.
 
           IF ADDR-PARM-COUNT > 7
              SET ADDR-ADDRESS-POINTER-08 TO
                                      ADDRESS OF ADDR-DATA-ITEM-08.
 
           IF ADDR-PARM-COUNT > 8
              SET ADDR-ADDRESS-POINTER-09 TO
                                      ADDRESS OF ADDR-DATA-ITEM-09.
 
           IF ADDR-PARM-COUNT > 9
              SET ADDR-ADDRESS-POINTER-10 TO
                                      ADDRESS OF ADDR-DATA-ITEM-10.
 
           IF ADDR-PARM-COUNT > 10
              SET ADDR-ADDRESS-POINTER-11 TO
                                      ADDRESS OF ADDR-DATA-ITEM-11.
 
           IF ADDR-PARM-COUNT > 11
              SET ADDR-ADDRESS-POINTER-12 TO
                                      ADDRESS OF ADDR-DATA-ITEM-12.
 
           IF ADDR-PARM-COUNT > 12
              SET ADDR-ADDRESS-POINTER-13 TO
                                      ADDRESS OF ADDR-DATA-ITEM-13.
 
 
       0000-MAINLINE-X.
           GOBACK.
 
 
      *****************************************************************
      **                 END OF PROGRAM XSDU0007                     **
      *****************************************************************
