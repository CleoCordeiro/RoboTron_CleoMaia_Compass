import glob
import os
import importlib

import utils.utils as utils
import utils.downloadArquivos as download_arquivos
import utils.downloadTabela as download_tabela
from utils.pick import pick


def menu(options: list, banner: str) -> tuple:
    """Gera um menu com as opções passadas como parâmetro.

    Args:
        options (list): Lista de opções do menu.
        banner (str): Banner do menu.

    Returns:
        tuple: Tupla com a opção selecionada e o índice da opção.
    """
    utils.clear()
    selected_option, index = pick(options, banner, indicator='🡆 ', default_index=0)
    return selected_option, index


def main_menu() -> None:
    """Menu principal do programa."""
    banner: str = utils.generate_banner("It's Show Time!")
    options: list = ['Exercícios dia 5', 'Exercícios dia 7', 'Sair']
    selected_option, index = menu(options, banner)
    if selected_option == 'Exercícios dia 5':
        menu_dia5()
    if selected_option == 'Exercícios dia 7':
        menu_dia7()
    if selected_option == 'Sair':
        exit()


def menu_dia5() -> None:
    """Menu dos exercícios do dia 5."""
    banner: str = utils.generate_banner("Exercicios dia 5")+"\n Selecione o exercício:"
    count_files: int = len(glob.glob1('Exercicios_Dia_5/', "*.py"))
    options: list = []
    for i in range(count_files):
        options.append(f"Exercicio {i+1}")
    options.append('Menu Principal')
    options.append('Sair')

    selected_option, index = menu(options, banner)
    if selected_option == 'Menu Principal':
        main_menu()
    if selected_option == 'Sair':
        exit()

    exercicio = importlib.import_module(f'Exercicios_Dia_5.Exercicio_{index+1}')
    exercicio.start()
    del exercicio
    os.system('pause')
    menu_dia5()


def menu_dia7() -> None:
    """Menu dos exercícios do dia 7."""
    banner: str = utils.generate_banner("Exercicios dia 7")+"\n Selecione o exercício:"

    count_files: int = len(glob.glob1('Exercicios_Dia_7/', "*.py"))
    options: list = []
    for i in range(count_files):
        options.append(f"Exercicio {i+1}")
    options.append('Menu Principal')
    options.append('Sair')
    selected_option, index = menu(options, banner)
    if selected_option == 'Menu Principal':
        main_menu()
    if selected_option == 'Sair':
        exit()
    exercicio = importlib.import_module(f'Exercicios_Dia_7.Exercicio_{index+1}')
    exercicio.start()
    del exercicio
    os.system('pause')
    menu_dia7()


if __name__ == "__main__":
    """Início do programa.
    Faz o download dos arquivos necessários para o programa funcionar.
    Faz a chamada do menu principal."""
    download_arquivos.start()
    download_tabela.start()
    main_menu()
