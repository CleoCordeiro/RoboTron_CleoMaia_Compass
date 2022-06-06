import os
import sys
from typing import Type


def media_inteiros(num1: int, num2: int) -> float:
    """ Recebe dois números inteiros e retorna a média.

    Args:
        num1 (int): Primeiro número inteiro.
        num2 (int): Segundo número inteiro.

    Returns:
        int: Retorna a média dos dois números.
    """
    return (num1 + num2) / 2


def dialogo_media_inteiros(template: Type['Template']) -> None:
    """ Função que realiza o dialogo com o usuário.
    Pede para o usuário inserir dois números inteiros."""
    while True:
        try:
            num1: int = int(input(template.generate_pergunta("Insira o primeiro número inteiro: ")))
            num2: int = int(input(template.generate_pergunta("Insira o segundo número inteiro: ")))
            print(template.generate_resposta(
                f"A média dos números {[num1,num2]} é {media_inteiros(num1, num2):.2f}"))
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
    titulo: str = '''Crie um programa que contêm uma função que receba dois
parâmetros inteiros e retorna a média dos dois valores.'''
    template: Type['Template'] = Template("Exercicio 7", titulo)
    print(template)
    dialogo_media_inteiros(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
