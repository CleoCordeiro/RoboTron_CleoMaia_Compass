import os
import sys
from typing import Type


def media_20_numeros(x: list) -> float:
    """ Função que calcula a média de 20 números.

    Args:
        x (list): Lista de números digitados pelo usuário.

    Returns:
        float: Retorna a média de 20 números.
    """
    return sum(x)/len(x)


def dialogo_media_20_numeros(template: Type['Template']) -> None:
    """Função que realiza o dialogo com o usuário.
        Pede para o usuário inserir 20 números e armazena em uma lista."""
    while True:
        try:
            x: list = []
            for i in range(20):
                x.append(int((input(template.generate_pergunta(f"Insira o {i+1}º número inteiro: ")))))
            print(template.generate_resposta(f"A média dos números {x} é: {media_20_numeros(x):.2f}"))
            break
        except KeyboardInterrupt:
            print("Até Mais!")
            break
        except ValueError:
            print("Erro! Insira apenas números!")


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template
    from utils.template import Template
    titulo: str = '''Construa um programa que recebe 20 valores para X
e no final apresenta a média aritmética dos valores pares digitados.'''
    template: Type['Template'] = Template("Exercicio 5", titulo)
    print(template)
    dialogo_media_20_numeros(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
