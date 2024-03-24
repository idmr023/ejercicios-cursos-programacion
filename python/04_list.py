#Ejemplo 1, dos formas de hacerlo
numbers=[]
for i in range(1,11):
  numbers.append(i*2)

print(numbers)

numbers_v2 = [element*2 for element in range(1,11)] #List Comprehension

#Ejemplo 2. Dos formas de hacerlo
for i in range(1,11):
  if i % 2 == 0:
    numbers.append(i*2)
  print(numbers)

numbers_v2 = [i*2 for i in range(1,11) if i%2==0] #List Comprehension
print(numbers_v2)