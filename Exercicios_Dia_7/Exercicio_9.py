import os
import sys
from typing import Type
from pandas import DataFrame


def print_age(template: Type['Template']) -> None:
    df: DataFrame = file.open_csv_from_pandas("Dados/CSV.csv")
    print(template.generate_resposta(df[['Age']].to_string(index=False)))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = 'Usando Pandas, leia apenas os dados da coluna Age do CSV.'
    template: Type['Template'] = Template("Exercicio 9", titulo)
    print(template)
    print_age(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
