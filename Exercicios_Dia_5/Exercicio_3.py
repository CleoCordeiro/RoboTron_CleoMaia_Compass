# Construa um programa que recebe dois valores,
# soma esses valores e apresenta se o resultado é par ou impar

def ParOuImpar(num1, num2):
    if (num1 + num2) % 2 == 0:
        return "Par"
    else:
        return "Impar"


def dialogoParOuImpar():
    while True:
        try:
            num1 = int(input(text.pergunta("Insira o primeiro número: ")))
            num2 = int(input(text.pergunta("Insira o segundo número: ")))
            text.resposta(f"A soma entre o número {num1} e o número {num2} é: {ParOuImpar(num1, num2)}")
            break
        except KeyboardInterrupt:
            print("Até Mais!")
            break
        except ValueError: 
            print("Erro! Insira apenas números inteiros!")


def banner():
    text.print_banner("Exercicio 3")
    text.titulo("""Construa um programa que recebe dois valores, soma esses valores e apresenta se o resultado é par ou impar""")


def start():
    global text
    import utils.text as text
    banner() 
    dialogoParOuImpar()


if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()