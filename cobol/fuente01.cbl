      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. "INICIO".
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT OPTIONAL CLIENTES ASSIGN TO "./clientes.dat"
                  ORGANIZATION INDEXED
                  ACCESS MODE DYNAMIC
                   *> ACCESS MODE
                   *>  DYNAMIC: Se reciben diferentes valores de manera secuencial, se usa START.
                   *>  RANDOM: Si intentamos ingresar valores secuenciales, habrá error.
                  RECORD KEY IS ID_CLIENTE
                  ALTERNATE KEY CLI_NOMBRE WITH DUPLICATES
                  ALTERNATE KEY CLI_ALT_2  WITH DUPLICATES
                  *>Cuando tenemos varios elementos y queremos declarar una ALTERNATE KEY (AK2) que no es contigua a la anterior (AK1), hay que crear otro elemento que sea un “punto medio” entre la AK1 y la AK2.
                  STATUS ST-FILE.


       DATA DIVISION.
       FILE SECTION.

       FD  CLIENTES.

       01  REG-CLIENTES.
           03  ID_CLIENTE.
               05  CLI_ID           PIC 9(7).
               *>Definición de longitud de variables:
               *>  9 -> un dígito
               *>  99 -> dos dígitos
               *>  Z(6)9,99 -> El z muestra enteros y cuando encuentra 0s los reemplaza por espacios
               *>  ----- -> funciona igual que el Z pero si encuentran un negativo le pondrá un "-" a la izquierda
           03  CLI_SALDO            PIC S9(7)V9(3).
           03  CLI_NOMBRE           PIC X(70).
           03  CLI_DIRECCION        PIC X(80).
           03  CLI_CODPOST          PIC X(10).
           03  CLI_CATEGORIA        PIC X.
           03  CLI_ALT_2.
               05  CLI_CATEGORIA_2  PIC X.
               05  CLI_NOMBRE_2     PIC X(60).
               *>CLI_ALT_2 almacena los valores de CATEGORIA_2 y NOMBRE_2 funcionando como punto medio entre ambas variables
           03  CLI_RAZONSOCIAL      PIC X(60).
           03  FILLER               PIC X(240).
           *>Filler permite agregar un campo a futuro, de no agregar FILLER no se puede agregar ningún otro dato a futuro


       WORKING-STORAGE SECTION.

       01  ST-FILE   PIC XX.
       01  X         PIC X.

       PROCEDURE DIVISION.
       PABLO.
           PERFORM ABRO-ARCHIVOS.
           *> El PERFORM lee y regresa
           PERFORM GRABO-DATOS THRU F-GRABO-DATOS.
           PERFORM CIERRO-ARCHIVOS.
           STOP RUN.

       ABRO-ARCHIVOS.
           OPEN I-O CLIENTES.
           IF ST-FILE > "07"
              DISPLAY "ERROR ABRIENDO EL ARCHIVO"
              ACCEPT X.

       CIERRO-ARCHIVOS.
           CLOSE CLIENTES.

       GRABO-DATOS.
           INITIALIZE REG-CLIENTES.
           MOVE 1 TO CLI_ID.
           MOVE 0 TO CLI_SALDO.
           MOVE "VAR-NOMBRE" TO CLI_NOMBRE.
           MOVE "W-DIRECCION" TO CLI_DIRECCION.

       GRABO-REGISTRO.
           WRITE REG-CLIENTES.
           IF ST-FILE = "99" GO TO GRABO-DATOS.
                           *>GOTO lee, se va y nunca vuelve. No debe ser usado todo el tiempo, sólo en casos expecionales
           IF ST-FILE > "07"
              DISPLAY "ERROR GRABANDO EL ARCHIVO"
              ACCEPT X.

       F-GRABO-DATOS.
           EXIT.

       END PROGRAM "INICIO".
