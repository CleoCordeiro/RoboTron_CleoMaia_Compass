import os
import sys
from typing import Type
from pandas import DataFrame


def ator_oscar_anos(template: Type['Template']) -> None:
    """ Printa o nomes dos Atores que ganharam o Oscar entre 1991 e 2016.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    df: DataFrame = file.open_csv_from_pandas("dados/csv.csv")
    print(template.generate_resposta(df.query("Year == 1991 | Year == 2016")[['Name']].to_string(index=False)))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = 'Printe somente o nome dos atores que ganharam o Oscar em 1991 e 2016.'
    template: Type['Template'] = Template("Exercicio 12", titulo)
    print(template)
    ator_oscar_anos(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
