# Crie um programa que recebe uma lista com três frutas e compare com
# uma lista com os valores ["maça", "banana", "pera"] e mostre as

def compararLista(listaDeFrutas):
    frutas = ["maça", "banana", "pera"]
    for i in listaDeFrutas:
        if i in frutas:
            text.resposta(f"A fruta {i} está na lista")
        else:
            text.resposta(f"A fruta {i} não está na lista")


def dialogoCompararLista():
    listaDeFrutas = []
    while True:
        try:
            for i in range(3):
                fruta = input(text.pergunta(f"Digite o nome da {i+1}º fruta: "))
                if fruta == "":
                    raise ValueError
                listaDeFrutas.append(fruta)
            print()
            compararLista(listaDeFrutas)
            break
        except ValueError:
            raise ValueError("Não é possível inserir uma fruta vazia")


def banner():
    text.print_banner("Exercicio 10")
    text.titulo('''
Crie um programa que recebe uma lista com três frutas
e compare com uma lista com os valores ["maça", "banana", "pera"]''')


def start():
    global text
    import utils.text as text
    banner()
    dialogoCompararLista()
    
    
if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()