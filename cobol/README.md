# COBOL

### Notas

- Las funciones no existen en cobol
- Las claves por las cuales vamos a buscar datos no pueden ser números
- De la columna 8 a 12 van las especificaciones y desde la 12 a 73 se puede escribir el código.
- El tamaño de cada campo no puede ser cambiado una vez que el archivo es creado.
- DECLARATIVES es como un try catch. Si un programa da error lo va abortar, las declarativas evitan que suceda eso, si hay error el program sigue ejecutándose.
- REDIFENE convierte texto a número o viceversa.

### ¿Cómo funciona un lenguaje en Cobol?



```jsx
//NO COPIAR ESTE CÓDIGO A COBOL NUNCA, ESTOY USANDO COMENTARIOS DE JS, CONVULSIONARÍA EL POBRE COBOL
  * Author:
  * Date:
  * Purpose:
  * Tectonics: cobc
  ******************************************************************
   IDENTIFICATION DIVISION.
   PROGRAM-ID. "INICIO".  //Identificación del programa y el nombre.
   ENVIRONMENT DIVISION.
   CONFIGURATION SECTION. //Esta sección define configuraciones específicas.
   SPECIAL-NAMES.
       DECIMAL-POINT IS COMMA.
   INPUT-OUTPUT SECTION.
   FILE-CONTROL. //Se controlan los archivos utilizados por el programa.

       SELECT OPTIONAL CLIENTES ASSIGN TO "./clientes.dat"
              ORGANIZATION INDEXED
              ACCESS MODE DYNAMIC
               /*ACCESS MODE
	               DYNAMIC: Se reciben diferentes valores de manera secuencial, 
								 se usa START.
	               RANDOM: Si intentamos ingresar valores secuenciales, habrá error.*/
              RECORD KEY IS ID_CLIENTE
              ALTERNATE KEY CLI_NOMBRE WITH DUPLICATES
              ALTERNATE KEY CLI_ALT_2  WITH DUPLICATES
              /* Cuando tenemos varios elementos y queremos declarar una ALTERNATE KEY 
								 (AK2) que no es contigua a la anterior (AK1), hay que crear otro 
								 elemento que sea un “punto medio” entre la AK1 y la AK2.*/
              STATUS ST-FILE.


   DATA DIVISION.
   FILE SECTION. /*En esta sección escribiremos los campos que componen los registros 
										de todos los archivos que se vayan a utilizar (los antes declarados 
										en la INPUT-OUTPUT SECTION de la ENVIRONMENT DIVISION).*/

   FD  CLIENTES.

   01  REG-CLIENTES.
       03  ID_CLIENTE.
           05  CLI_ID           PIC 9(7).
           /*  Definición de longitud de variables:
			           9 -> un dígito
			           99 -> dos dígitos
			           Z(6)9,99 -> El z muestra enteros y cuando encuentra 0s los reemplaza 
									por espacios
			           ----- -> funciona igual que el Z pero si encuentran un negativo le 
									pondrá un "-" a la izquierda*/
       03  CLI_SALDO            PIC S9(7)V9(3).
       03  CLI_NOMBRE           PIC X(70).
       03  CLI_DIRECCION        PIC X(80).
       03  CLI_CODPOST          PIC X(10).
       03  CLI_CATEGORIA        PIC X.
       03  CLI_ALT_2.
           05  CLI_CATEGORIA_2  PIC X.
           05  CLI_NOMBRE_2     PIC X(60).
           /* CLI_ALT_2 almacena los valores de CATEGORIA_2 y NOMBRE_2 funcionando como 
							punto medio entre ambas variables*/
       03  CLI_RAZONSOCIAL      PIC X(60).
       03  FILLER               PIC X(240).
		       /*Filler permite agregar un campo a futuro, de no agregar FILLER no se 
							puede agregar ningún otro dato a futuro*/


   WORKING-STORAGE SECTION. //Aquí se definen las variables

   01  ST-FILE   PIC XX.
   01  X         PIC X.

   PROCEDURE DIVISION.
	 RUTINA01.
		DISPLAY "Esta es la rutina 1"
		PERFORM RUTINA02. //De esta forma una rutina puede ejecutar a otra
   RUTINA02.
		 DISPLAY "Esta es la rutina 2".
	  STOP RUN. //Si no coloco esto, se ejecutará esta rutina de nuevo

   PABLO.
       PERFORM ABRO-ARCHIVOS. //El PERFORM lee y regresa
       PERFORM GRABO-DATOS THRU F-GRABO-DATOS.
			 PERFORM PROCESO THRU F-PROCESO UNTIL FIN = "S". //Esto sería igual a un DoWhile
       PERFORM CIERRO-ARCHIVOS.
       STOP RUN.

   ABRO-ARCHIVOS.
       OPEN I-O CLIENTES.
       IF ST-FILE > "07"
          STRING "Error al abrir Clientes " ST-SIC DELIMITED BY SIZE
             INTO MENSAJE
			       DISPLAY MENSAJE LINE 10 COL 20. 
							//Estás 2 líneas almacenan un string dentro de una variable
               MOVE "S" TO FIN //Esto sería como asignar un valor a una variable.

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
                       /*GOTO lee el párrafo al que hacemos referencia y no regresa. 
													No debe ser usado todo el tiempo, sólo en casos expecionales*/
       IF ST-FILE > "07"
          DISPLAY "ERROR GRABANDO EL ARCHIVO"
          ACCEPT X.

   F-GRABO-DATOS.
       EXIT PROGRAM. /*Sólo si el programa que estamos ejecutando es llamadao desde 
						otro se coloca EXIT PROGRAM, si no STOP RUN*/

		PROCESO.
	           PERFORM MUESTRO-PANTALLA.
	           PERFORM INGRESO-ID THRU F-INGRESO-ID.
	           IF FIN = "N"
	               PERFORM LEO-CLIENTES THRU F-LEO-CLIENTES
	               IF HUBO-ERROR = 1
	                   MOVE "S" TO FIN // Asi se asignan valores a las variables
	                   GO TO F-PROCESO
	               END-IF
	               IF EXISTE = "S"
	                   PERFORM MUESTRO-DATOS
	               ELSE
	                   PERFORM CARGO-DATOS THRU F-CARGO-DATOS
	               END-IF /* un condicional se puede cerrar de 2 maneras con "." se cierra 
										todo el condicional o con END-IF encaso tengamos IF ELSE anidados 
										y sólo querramos cerrar un if anidado y no el prinicipal*/
	               PERFORM OPCIONES.
	
       F-PROCESO.
         EXIT.

   END PROGRAM "INICIO".
```

### Ejemplos

## [Programa ABM_Clientes](https://github.com/idmr023/cursos/blob/main/curso-cobol/ABM_Clientes.cbl)

## [Programa que enlaza 2 archivos Cobol](https://github.com/idmr023/cursos/blob/main/curso-cobol/fuente05.cbl)

## [Ejercicios de multiplicación](https://github.com/idmr023/cursos/blob/main/curso-cobol/prgorama.cbl)

## [Programas repetitivos](https://github.com/idmr023/cursos/blob/main/curso-cobol/repetitivo.cbl)