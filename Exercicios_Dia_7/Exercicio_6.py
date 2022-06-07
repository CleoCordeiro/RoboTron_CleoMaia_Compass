import os
import sys
from typing import Type


def primeirosDados(template: Type['Template'], title: str, data: dict) -> None:
    dados: tuple = tuple(data.items())
    print(template.generate_resposta(f"{title}\n{dados[0]}\n{dados[1]}\n"))


def filtrarDados(template: Type['Template']) -> None:
    campeonato: dict = file.open_json("dados/campeonato.json")
    filterList: list = ['edicao_atual', 'fase_atual', 'rodada_atual']
    for key, value in campeonato.items():
        if filterList.__contains__(key):
            primeirosDados(template, key, value)


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = '''Faça com que o programa printe apenas os primeiros dados dentro de edicao_atual,
fase_atual, rodada_atual usando o JSON 2.'''
    template: Type['Template'] = Template("Exercicio 6", titulo)
    print(template)
    filtrarDados(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
