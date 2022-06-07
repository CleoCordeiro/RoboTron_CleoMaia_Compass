import os
import sys
from typing import Type


def timeVisitante(template: Type['Template']) -> None:
    partidas = file.open_json("dados/partida.json")
    for copa in partidas:
        for jogo in partidas[copa]:
            print(template.generate_resposta(file.dump_json(jogo['time_visitante'])))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = '''Do JSON 1 Guarde apenas o Nome do Estádio,
o Placar e o Status do jogo dentro de variáveis e mostre-as.'''
    template: Type['Template'] = Template("Exercicio 4", titulo)
    print(template)
    timeVisitante(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
