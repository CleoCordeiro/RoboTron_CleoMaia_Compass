import os
import sys
from typing import Type


def par_ou_impar(num1: int, num2: int) -> str:
    """Recebe 2 números inteiros e retorna se é par ou impar.

    Args:
        num1 (int): Primeiro número inteiro.
        num2 (int): Segundo número inteiro.

    Returns:
        str: Retorna se é par ou impar.
    """
    if (num1 + num2) % 2 == 0:
        return "Par"
    else:
        return "Impar"


def dialogo_par_ou_impar(template: Type['Template']) -> None:
    """Função que realiza o dialogo com o usuário.
    Pede para o usuário inserir dois números inteiros."""
    while True:
        try:
            num1: int = int(input(template.generate_pergunta("Insira o primeiro número inteiro: ")))
            num2: int = int(input(template.generate_resposta("Insira o segundo número inteiro: ")))
            print(template.generate_resposta(
                f"A soma entre o número {num1} e o número {num2} é: {par_ou_impar(num1, num2)}"))
            break
        except KeyboardInterrupt:
            print("Até Mais!")
            break
        except ValueError:
            print("Erro! Insira apenas números inteiros!")


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template
    from utils.template import Template
    titulo: str = '''Construa um programa que recebe dois valores,
soma esses valores e apresenta se o resultado é par ou impar.'''
    template: Type['Template'] = Template("Exercicio 3", titulo)
    print(template)
    dialogo_par_ou_impar(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
