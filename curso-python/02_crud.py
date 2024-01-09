set_primerset = {'col', 'mex', 'bol'}

#Cantidad de elementos
size= len(set_primerset)

#Saber si hay un elemento dentro del conjunto
idk = 13.4 in set_primerset

#Agregar elementos
new = set_primerset.add('gaaa')

#Actualizar
set_primerset.update({1, 'uno'})

#Remover, sino encuentra el elemento, lanza un error
set_primerset.remove(1)

#Remover, sino encuentra el elemento, no pasa nada
set_primerset.discard('argggg')

#Ordenar alfabeticamente
ordenar = sorted(set_primerset)
print(ordenar)

#Vacear el conjunto
#set_primerset.clear