      ******************************************************************
      * Author: GABRIELA BARBOSA
      * Date: 09/09/2023
      * Purpose: CALCULADORA
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAMACONTAS.
       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       77 WS-NUM1                   PIC 9(02)    VALUE ZEROS.
       77 WS-NUM2                   PIC 9(02)    VALUE ZEROS.
       77 WS-OPER                   PIC X        VALUE SPACES.
       77 WS-RESUL                  PIC ZZZ      VALUE ZEROS.
       77 WS-VALID                  PIC X        VALUE SPACES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           DISPLAY "INFORME O PRIMEIRO NUMERO: "
           ACCEPT WS-NUM1

           DISPLAY "INFORME OPERACAO (+,-,*,/): "
           ACCEPT WS-OPER

           EVALUATE WS-OPER
              WHEN "+"
              WHEN "-"
              WHEN "*"
              WHEN "/"
                MOVE "S" TO WS-VALID
              WHEN OTHER
                MOVE "N" TO WS-VALID
                DISPLAY "OPERADOR INVALIDO"
           END-EVALUATE

           IF WS-VALID = "S"
              DISPLAY "INFORME O SEGUNDO NUMERO: "
              ACCEPT WS-NUM2
              IF WS-NUM2 IS NUMERIC
                 CONTINUE
              EVALUATE WS-OPER
                 WHEN "+"
                    COMPUTE WS-RESUL = WS-NUM1 + WS-NUM2
                       DISPLAY "RESULTADO..." WS-RESUL
                 WHEN "-"
                    COMPUTE WS-RESUL = WS-NUM1 - WS-NUM2
                       DISPLAY "RESULTADO..." WS-RESUL
                 WHEN "*"
                    COMPUTE WS-RESUL = WS-NUM1 * WS-NUM2
                       DISPLAY "RESULTADO..." WS-RESUL
                 WHEN "/"
                    IF WS-NUM2 = 0 THEN
                       DISPLAY "INFORME NUMERO MAIOR QUE 0"
                    ELSE
                       COMPUTE WS-RESUL = WS-NUM1 / WS-NUM2
                       DISPLAY "RESULTADO..." WS-RESUL
                    END-IF
              END-EVALUATE
           END-IF.

           STOP RUN.
           END PROGRAM PROGRAMACONTAS.
