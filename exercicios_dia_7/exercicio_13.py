import os
import sys
from typing import Type
import pandas as pd


def filme_ano(template: Type['Template']) -> None:
    """ Concatena o nome do filme e o ano de lançamento.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    df: pd.DataFrame = file.open_csv_from_pandas("dados/csv.csv")
    df["movie year"] = df["Movie"] + " " + df["Year"].astype(str)
    print(type(df["movie year"]))
    print(template.generate_resposta(df))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = 'Crie mais uma coluna em tempo de execução juntando os dados movie e year.'
    template: Type['Template'] = Template("Exercicio 13", titulo)
    print(template)
    filme_ano(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
