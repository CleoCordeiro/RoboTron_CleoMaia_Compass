import os
import sys
from typing import Type


def chaves_json(template: Type['Template']) -> None:
    """ Printa as chaves do JSON.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    campeonato: dict = file.open_json("dados/campeonato.json")
    for key in campeonato:
        print(template.generate_resposta(key))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = 'Percorra o JSON 2, utilizando o loop FOR e printe suas chaves principais.'
    template: Type['Template'] = Template("Exercicio 7", titulo)
    print(template)
    chaves_json(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
