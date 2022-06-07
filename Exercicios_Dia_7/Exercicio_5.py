import os
import sys
from typing import Type


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = '''Guarde o arquivo JSON 2 nomeando-o como campeonato em uma variável
e printe todos os seus dados.'''
    template: Type['Template'] = Template("Exercicio 5", titulo)
    print(template)
    campeonato = file.open_json('Dados/campeonato.json')
    print(template.generate_resposta(file.dump_json(campeonato)))


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
