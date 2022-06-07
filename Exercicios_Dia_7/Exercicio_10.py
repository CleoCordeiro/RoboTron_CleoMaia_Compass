import os
import sys
from typing import Type
from pandas import DataFrame


def atorIdadeIgual40(template: Type['Template']) -> None:
    df: DataFrame = file.open_csv_from_pandas("Dados/CSV.csv")
    print(template.generate_resposta(df.query('Age == 40')[['Name']].to_string(index=False)))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = '''Usando Pandas, procure por um dado específico (da sua escolha)
e printe somente o mesmo utilizando o CSV.'''
    template: Type['Template'] = Template("Exercicio 10", titulo)
    print(template)
    atorIdadeIgual40(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
