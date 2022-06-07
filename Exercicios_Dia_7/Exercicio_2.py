import os
import sys
from typing import Type


def vencedor(template: Type['Template']) -> None:
    partidas: dict = file.open_json("Dados/partida.json")
    for copa in partidas:
        for jogo in partidas[copa]:
            if jogo["placar_mandante"] > jogo["placar_visitante"]:
                print(template.generate_resposta(f"Vencedor: {jogo['time_mandante']['nome_popular']}"))
            elif jogo["placar_mandante"] < jogo["placar_visitante"]:
                print(template.generate_resposta((f"Vencedor: {jogo['time_visitante']['nome_popular']}")))
            else:
                template.generate_resposta("Empate")


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = "Pegue o arquivo JSON 1 e printe apenas o nome do time vencedor no terminal."
    template: Type['Template'] = Template("Exercicio 2", titulo)
    print(template)
    vencedor(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
