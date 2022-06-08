import os
import sys
from typing import Type
from pandas import DataFrame


def ator_oscar_1993(template: Type['Template']) -> None:
    """ Printa o nome do Ator que ganhou o Oscar em 1993.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    df: DataFrame = file.open_csv_from_pandas("dados/csv.csv")
    print(template.generate_resposta(df.query('Year == 1993')[['Name']].to_string(index=False)))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = 'Printe o nome do Ator que ganhou o Oscar em 1993.'
    template: Type['Template'] = Template("Exercicio 11", titulo)
    print(template)
    ator_oscar_1993(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
