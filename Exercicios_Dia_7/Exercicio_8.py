import os
import sys
from typing import Type

from pandas import DataFrame


def print_csv(template: Type['Template']) -> None:
    """ Printa o conteúdo do CSV.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    csv_file: DataFrame = file.open_csv_from_pandas("dados/csv.csv")
    print(template.generate_resposta(csv_file.to_string()))


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file
    from utils.template import Template
    import utils.file as file
    titulo: str = '''Abra o arquivo CSV com pandas e guarde em uma variável de sua escolha
e printe o conteúdo no terminal.'''
    template: Type['Template'] = Template("Exercicio 8", titulo)
    print(template)
    print_csv(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
