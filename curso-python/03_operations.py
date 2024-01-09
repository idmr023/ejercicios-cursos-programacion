set_a = {'col', 'mx', 'bol'}
set_b = {'pe', 'col'}

#Unir conjuntos por método y operador
set_c = set_a.union(set_b)
set_c = set_a | set_b
print(set_a | set_b)

#Intersección por método y operador
set_c = set_a.intersection(set_b)
set_c = set_a & set_b

#Diferencia por método y operador
set_c = set_a.difference(set_b)
set_c = set_a - set_b

#Diferencia simétrica
set_c = set_a.symmetric_difference(set_b)
set_c = set_a ^ set_b