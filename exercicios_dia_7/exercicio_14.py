import os
import sys
from typing import Type
import pandas as pd


def oscar_1987_1999(template: Type['Template']) -> None:
    """ Printa todos os nomes e as idades dos atores que ganharam o oscar de 1987 até 1999.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    df: pd.DataFrame = file.open_csv_from_pandas("dados/csv.csv")
    df_filter: pd.DataFrame = df.query('Year >= 1987 & Year <= 1999')
    df_oscar_1987_1999: pd.DataFrame = df_filter[['Name', 'Age']]
    print(template.generate_resposta(df_oscar_1987_1999.to_string()))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = 'Printe todos os nomes e as idades dos atores que ganharam o oscar de 1987 até 1999.'
    template: Type['Template'] = Template("Exercicio 14", titulo)
    print(template)
    oscar_1987_1999(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
