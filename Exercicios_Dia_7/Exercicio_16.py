import os
import sys
from typing import Type
from pandas import DataFrame


def menu(template: Type['Template']) -> None:
    """ Menu de opções do programa.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    utils.clear()
    banner: str = utils.generate_banner("Exercicio 16")
    options: list = ['Listar todos os nomes dos elementos',
                     'Listar todos os dados de um elemento',
                     'Listar todos os dados de todos os elementos',
                     'Sair']

    selected_option, index = pick(options, banner, indicator='🡆 ', default_index=0)

    if selected_option == 'Listar todos os nomes dos elementos':
        listar_nome(template)
    elif selected_option == 'Listar todos os dados de um elemento':
        pesquisar_simbolo(template)
    elif selected_option == 'Listar todos os dados de todos os elementos':
        listar_todos(template)
    elif selected_option == 'Sair':
        return


def listar_nome(template: Type['Template']) -> None:
    """ Lista todos os nomes dos elementos.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    print(template.generate_resposta(df['Nome'].to_string(index=False)))
    os.system('pause')
    menu(template)


def pesquisar_simbolo(template: Type['Template']) -> None:
    """ Pesquisa um elemento pelo seu símbolo e printa os dados.

    Args:
        template (Type[&#39;Template&#39;]): _description_
    """
    simbolo: str = input('Digite o símbolo do elemento: ')
    dados: DataFrame = df.loc[df['Simbolo'] == simbolo]

    if dados.empty:
        print(template.generate_resposta('Elemento não encontrado'))
    else:
        print(template.generate_resposta(dados))
    os.system('pause')
    menu(template)


def listar_todos(template: Type['Template']) -> None:
    """ Lista todos os dados de todos os elementos.

    Args:
        template (Type[&#39;Template&#39;]): Objeto do tipo Template.
    """
    print(template.generate_resposta(df.to_string(index=+1)))
    os.system('pause')
    menu(template)


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template, file, df, utils, pick
    from utils.template import Template
    import utils.file as file
    import utils as utils
    from utils.pick import pick
    titulo: str = '''A) Crie uma “aplicação” em loop que tenha uma opção para listar todos os elementos da tabela,
porém mostrando apenas uma propriedade do elemento.Ex: listar todos os nomes dos elementos na tabela.
B) Listar todos os dados de determinado elemento, buscando através do seu símbolo.
C) Listar todos os dados de todos os elementos inseridos.'''
    template: Type['Template'] = Template("Exercicio 16", titulo)
    df = file.open_csv_from_pandas("dados/tabela_periodica.csv")
    menu(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
