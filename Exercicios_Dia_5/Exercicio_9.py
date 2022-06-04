# Crie um programa que recebe 15 valores e armazena em uma lista,
# e no final da execução mostre os valores da lista do ultimo para o primeiro

def print_lista_reversa(lista):
    lista.reverse()
    for i in range(len(lista)):
        text.resposta(f"{i+1}º {lista[i]}")

def dialogo_lista_reversa():
    lista = []
    while True:
        try:
            for i in range(15):
                lista.append(int(input(text.pergunta(f"Insira o {i+1}º número inteiro: "))))
            print()
            print_lista_reversa(lista)
            break
        except ValueError:
            print("Erro! Insira apenas números!") 

def banner():
    text.print_banner("Exercicio 9")
    text.titulo('''Crie um programa que recebe 15 valores e armazena em uma lista,
e no final da execução mostre os valores da lista do ultimo para o primeiro''')

def start():
    global text
    import utils.text as text
    banner()
    dialogo_lista_reversa()  

if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()