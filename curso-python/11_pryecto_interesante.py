import random 

print("[ 🤖 Bienvenido al juego Piedra, Papel o tijera 🙋] >>> Ingresa una opción <<<\n")
result = {
          'piedra' : { 'tijera' : 1, 'papel' : 0 },
          'papel' : { 'tijera' : 0, 'piedra' : 1 },
          'tijera' : { 'papel' : 1, 'piedra' : 0 }
}
def choose_options():
    options = ('piedra', 'papel', 'tijera')
    user_option = input('>>> Piedra, papel o tijera => ').lower()
   
    if not user_option in options:
        print('Esa opción no es valida')
        #continue
        returnNone, None 
    
    computer_option = random.choice(options)

    print('User option => ', user_option)
    print('Computer option => ', computer_option)
    return user_option, computer_option

def check_rules(user_option, computer_option, user_wins, computer_wins):
    if user_option == computer_option:
        print('Empate!\n')
    
    else:
      ganador = result[user_option][computer_option]
      if ganador:
          print("{} gana a {}".format(user_option, computer_option))
          print('¡User gana!\n')
          user_wins += 1
      else:
          print("{} gana a {}".format(computer_option,user_option))
          print('¡Computer gana!\n')
          computer_wins += 1
            
    return user_wins, computer_wins


def check_winner(user_wins, computer_wins):
    
    print(f'''
    🤖 Computer wins: {computer_wins}
    🙋 User wins: {user_wins}
            ''')
    
    if user_wins == 3:
        print('🎖️ El ganador es User 🎖️')
        exit()
        
    if computer_wins == 3:
        print('🎖️ El ganador es Computer 🎖️')
        exit()


def run_game():
    
    computer_wins = 0 
    user_wins = 0
    rounds = 1

    whileTrue:
        print('***' * 10)
        print('Round ', rounds)
        print('***' * 10)

        rounds += 1
              
        user_option, computer_option = choose_options()
        user_wins, computer_wins = check_rules(user_option, computer_option,user_wins, computer_wins)
        check_winner(user_wins, computer_wins)
run_game()