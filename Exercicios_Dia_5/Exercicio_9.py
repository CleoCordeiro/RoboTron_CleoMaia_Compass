import os
import sys
from typing import Type


def reverter_lista(lista: list) -> str:
    lista.reverse()
    resposta: str = ''
    for i in range(len(lista)):
        resposta += f"{i+1}º {lista[i]}\n"
    return resposta


def dialogo_lista_reversa(template: Type['Template']) -> None:
    lista: list = []
    while True:
        try:
            for i in range(15):
                lista.append(int(input(template.generate_pergunta(f"Insira o {i+1}º número inteiro: "))))
            print(template.generate_resposta(reverter_lista(lista)))
            break
        except ValueError:
            print("Erro! Insira apenas números!")


def start() -> None:
    global Template
    from utils.template import Template
    titulo: str = '''Crie um programa que recebe 15 valores e armazena em uma lista,
e no final da execução mostre os valores da lista do ultimo para o primeiro'''
    template: Type['Template'] = Template("Exercicio 9", titulo)
    print(template)
    dialogo_lista_reversa(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
