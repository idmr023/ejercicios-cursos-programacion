#Se pueden modificar. No tienen un orden. No pueden tener elementos duplicado. No tienen un par key-value

set_countries = {13.4, 'col', True, 'mex', 'bol'}
print(set_countries)

#Crear un conjunto a partir de una cadena
set_from_string = set('hola')

#Crear un conjunto a partir de una tupla
set_from_tuples = set(('abc', 'cbv', 'as', 'abc'))

#Crear un conjunto a partir de una lista de números
numbers = [1,2,3,3,49]
set_from_numbers = set(numbers)

#Pasar a un conjunto a una lista
unique_numbers=list(set_from_numbers)
print(unique_numbers)