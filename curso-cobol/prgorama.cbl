      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
           IDENTIFICATION DIVISION.
           PROGRAM-ID. CAPITULO-8.
           DATA DIVISION.
           FILE SECTION.
           WORKING-STORAGE SECTION.
	              01 NUM1 PIC 9(4).
	              01 NUM2 PIC 9(4).
	              01 RESULTADO PIC 9(5).
	              01 RESULTADO2 PIC 9(5).
	              01 RESULTADO3 PIC 9(5).
	              01 RESULTADO4 PIC 9(5).
           PROCEDURE DIVISION.
           MAIN-PROCEDURE.
	              DISPLAY "Introduce el primer número: ".
	              ACCEPT NUM1.
	              DISPLAY "Introduce el segundo número: ".
	              ACCEPT NUM2.
	              ADD NUM1 TO NUM2 GIVING RESULTADO.
	              SUBTRACT NUM1 FROM NUM2 GIVING RESULTADO4.
	              MULTIPLY NUM1 BY NUM2 GIVING RESULTADO2.
	              DIVIDE NUM1 BY NUM2 GIVING RESULTADO3.
	              DISPLAY "El resultado es " RESULTADO.
	              DISPLAY "El resultado es " RESULTADO3.
	              DISPLAY "El resultado es " RESULTADO4.
               IF RESULTADO2 > 50
                   DISPLAY "El resultado es mayor a 50"
               ELSE
                   DISPLAY "Hola"
               END-IF.
	              STOP RUN.
           END PROGRAM CAPITULO-8.
