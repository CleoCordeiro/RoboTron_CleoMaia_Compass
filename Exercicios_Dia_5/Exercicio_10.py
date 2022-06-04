import os
import sys
from typing import Type


def comparar_lista(listaDeFrutas: list) -> str:
    frutas: list = ["maça", "banana", "pera"]
    resposta: str = ""
    for i in listaDeFrutas:
        if i in frutas:
            resposta += f"A fruta {i} está na lista\n"
        else:
            resposta += f"A fruta {i} não está na lista\n"
    return resposta


def dialogo_comparar_lista(template: Type['Template']) -> None:
    listaDeFrutas: list = []
    while True:
        try:
            for i in range(3):
                fruta = input(template.generate_pergunta(f"Digite o nome da {i+1}º fruta: "))
                if fruta == "":
                    raise ValueError
                listaDeFrutas.append(fruta)
            print(template.generate_resposta(comparar_lista(listaDeFrutas)))
            break
        except ValueError:
            raise ValueError("Não é possível inserir uma fruta vazia")


def start() -> None:
    global Template
    from utils.template import Template
    titulo: str = '''Crie um programa que recebe uma lista com três frutas
e compare com uma lista com os valores ["maça", "banana", "pera"]'''
    template: Type['Template'] = Template("Exercicio 10", titulo)
    print(template)
    dialogo_comparar_lista(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
