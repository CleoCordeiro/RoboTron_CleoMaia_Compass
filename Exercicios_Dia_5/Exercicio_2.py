# Construa um programa que armazena em duas variaveis duas notas
# e apresenta a média entre as duas

def media(nota1, nota2):
    return (nota1 + nota2) / 2


def dialogoMedia():
    while True:
        try:
            nota1 = float(input(text.pergunta("Insira a primeira nota: ")))
            nota2 = float(input(text.pergunta("Insira a segunda nota: ")))
            text.resposta(f"A média entre o número {nota1} e o número {nota2} é: {media(nota1, nota2):.2f}")
            break
        except KeyboardInterrupt:
            print("Até Mais!")
            break
        except ValueError: 
            print("Erro! Insira apenas números!")

def banner():
    text.print_banner("Exercicio 2")
    text.titulo("Construa um programa que armazena em duas variaveis duas notas e apresenta a média entre as duas.")


def start():
    global text
    import utils.text as text
    banner()
    dialogoMedia()
    
    
if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()