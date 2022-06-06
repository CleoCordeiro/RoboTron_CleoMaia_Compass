import os
import sys
from typing import Type


def media(nota1: float, nota2: float) -> float:
    """Faz a soma das notas e retorna a média.

    Args:
        nota1 (float): primeira nota
        nota2 (float): segunda nota

    Returns:
        float: retorna a média das notas
    """
    return (nota1 + nota2) / 2


def dialogo_media(template: Type['Template']) -> None:
    """Pergunta as notas para o usuário e mostra a média."""
    while True:
        try:
            nota1: float = float(input(template.generate_pergunta("Insira a primeira nota: ")))
            nota2: float = float(input(template.generate_pergunta("Insira a segunda nota: ")))
            print(template.generate_resposta(
                f"A média entre o número {nota1} e o número {nota2}é: {media(nota1, nota2):.2f}"))
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
    titulo: str = '''Construa um programa que armazena em duas variaveis duas notas
e apresenta a média entre as duas.'''
    template: Type['Template'] = Template("Exercicio 2", titulo)
    print(template)
    dialogo_media(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
