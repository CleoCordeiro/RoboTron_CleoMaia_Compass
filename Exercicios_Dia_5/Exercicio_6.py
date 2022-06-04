# Construa um programa que receba uma valor inteiro maior que 2
# em uma variavel x e apresenta os impares entre 0 e x

def impares_ate_x(x):
    for i in range(1,x+1):
        if i % 2 != 0:
            text.resposta(f"O número {i} é ímpar.")

def dialogo_impares_ate_x():
    while True:
        try:
            x = int(input(text.pergunta("Insira um número: ")))
            impares_ate_x(x)
            break
        except KeyboardInterrupt:
            print("Até Mais!")
            break
        except ValueError: 
            print("Erro! Insira apenas números!")

def banner():
    text.print_banner("Exercicio 6")
    text.titulo('''
Construa um programa que receba uma valor inteiro maior que 2
em uma variavel x e apresenta os impares entre 0 e x''')

def start():
    global text
    import utils.text as text
    banner()
    dialogo_impares_ate_x()
    
if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()