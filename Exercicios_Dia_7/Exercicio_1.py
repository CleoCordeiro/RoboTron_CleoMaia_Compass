import os
import sys
from typing import Type


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template
    from utils.template import Template
    import utils.file as file
    titulo: str = '''Baixe o arquivo do link JSON 1, abra ele no vsCode com Python nomeando-o
como partida guarde em uma variável e printe o JSON inteiro no terminal.'''
    template: Type['Template'] = Template("Exercicio 1", titulo)
    print(template)
    partida: dict = file.open_json("Dados/partida.json")
    print(template.generate_resposta(file.dump_json(partida)))


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
