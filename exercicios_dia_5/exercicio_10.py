import os
import sys
from typing import Type


def comparar_lista(listaDeFrutas: list) -> str:
    """ Função que compara a lista de frutas com a lista inserida pelo usuário.

    Args:
        listaDeFrutas (list): Lista de frutas inserida pelo usuário.

    Returns:
        str: Retorna uma string com a comparação entre as listas.
    """
    frutas: list = ["maça", "banana", "pera"]
    resposta: str = ""
    for i in listaDeFrutas:
        if i in frutas:
            resposta += f"A fruta {i} está na lista\n"
        else:
            resposta += f"A fruta {i} não está na lista\n"
    return resposta


def dialogo_comparar_lista(template: Type['Template']) -> None:
    """ Função que mostra o dialogo para o usuário.
    Pede para o usuário inserir o nome de 3 frutas."""
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
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
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
