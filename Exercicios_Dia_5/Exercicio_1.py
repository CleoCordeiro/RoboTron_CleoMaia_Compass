import os
import sys
from typing import Type


def hello_world(template: Type['Template']) -> None:
    """Printa a mensagem Hello World.
    Utiliza o template para gerar a resposta."""
    print(template.generate_resposta("Hello World"))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template
    from utils.template import Template
    titulo: str = "Construa um programa que quando executado mostra Hello World"
    template: Type['Template'] = Template("Exercicio 1", titulo)
    print(template)
    hello_world(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
