import os
import sys
from typing import Type


def estadio_placar_status(template: Type['Template']) -> None:
    """ Printa o nome do estádio, placar e status do jogo.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    partidas: dict = file.open_json("dados/partida.json")
    for copa in partidas:
        for jogo in partidas[copa]:
            nomeDoEstadio, placar, status = jogo["estadio"]["nome_popular"], jogo["placar"], jogo["status"]
            print(template.generate_resposta(
                f"O jogo no estádio {nomeDoEstadio} foi realizado com o placar {placar}" +
                f" e o status do jogo é {status}"))


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
    template: Type['Template'] = Template("Exercicio 3", titulo)
    print(template)
    estadio_placar_status(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
