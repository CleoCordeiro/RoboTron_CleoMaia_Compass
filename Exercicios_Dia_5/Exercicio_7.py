# Crie um programa que contêm uma função que receba dois parâmetros inteiros
# e retorna a média dos dois valores

def media_inteiros(num1, num2):
    return (num1 + num2) / 2

def dialogo_media_inteiros():
    while True:
        try:
            num1 = int(input(text.pergunta("Insira o primeiro número inteiro: ")))
            num2 = int(input(text.pergunta("Insira o segundo número inteiro: ")))
            text.resposta(f"A média dos números {[num1,num2]} é {media_inteiros(num1, num2)}")
            break
        except KeyboardInterrupt:
            print("Até Mais!")
            break
        except ValueError: 
            print("Erro! Insira apenas números!")

def banner():
    text.print_banner("Exercicio 7")
    text.titulo('''
Crie um programa que contêm uma função que receba dois parâmetros inteiros
e retorna a média dos dois valores''')

def start():
    global text
    import utils.text as text
    banner()
    dialogo_media_inteiros()
    
if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()