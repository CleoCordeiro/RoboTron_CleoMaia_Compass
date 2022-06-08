import os
import sys
from typing import Type


def todos_menos_the_revenant(template: Type['Template']) -> None:
    """ Printa todos os filmes menos o “The Revenant”.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    df = file.open_csv_from_pandas("dados/csv.csv")
    print(template.generate_resposta(df.query("Movie != 'The Revenant'").to_string()))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = 'Mostre todos os filmes menos o “The Revenant”.'
    template: Type['Template'] = Template("Exercicio 15", titulo)
    print(template)
    todos_menos_the_revenant(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
