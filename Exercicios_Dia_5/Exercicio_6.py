import os
import sys
from typing import Type


def impares_ate_x(x: int) -> str:
    """Função que retorna os impares entre 0 e x.

    Args:
        x (int): Número inserido pelo usuário.

    Returns:
        str: Retorna uma string com os impares entre 0 e x.
    """
    resposta: str = ""
    for i in range(1, x+1):
        if i % 2 != 0:
            resposta += f"O número {i} é ímpar.\n"
    return resposta


def dialogo_impares_ate_x(template: Type['Template']) -> None:
    """Função que realiza o diálogo com o usuário.
    Pede para o usuário inserir um número inteiro.
    """
    while True:
        try:
            x: int = int(input(template.generate_pergunta("Insira um número inteiro: ")))
            print(template.generate_resposta(impares_ate_x(x)))
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
    titulo: str = '''Construa um programa que receba uma valor inteiro maior que 2
em uma variavel x e apresenta os impares entre 0 e x.'''
    template: Type['Template'] = Template("Exercicio 6", titulo)
    print(template)
    dialogo_impares_ate_x(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
