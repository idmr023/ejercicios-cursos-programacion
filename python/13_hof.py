#High order function es aquella que contiene otras funciones como parámetro de entrada o devuelve una función como salida. Características: Una función es una instancia de tipo objeto. Puede almacenar una función en una variable. Puede pasar una función como un parámetro a otra función. Puede devolver la función desde una función. Se puede almacenar en una estructura de datos como tablas, listas, etc.

def increment(x):
  return x+1

#Signfican
def high_ord_func(x, func):
  return x + func(x)
#lo mismo
high_ord_func_v2 = lambda x, func: x + func(x)

result = high_ord_func(2, increment)
print(result)

result = high_ord_func_v2(2, lambda x: x+2)
print(result)

result = high_ord_func_v2(2, lambda x: x*5)
print(result)