#https://runestone.academy/ns/books/published/fopp/_images/lambda.gif

#Función normal
def increment(x):
  return x+1

#Función lambda
increment_v2= lambda x: x+1

result = increment(10)
print(11)

result = increment_v2(20)
print(result)

full_name = lambda name, last_name: f'Full Name is {name.title()} {last_name.title()}'

text = full_name('Ivan', 'Manrique Roa')
print(text)