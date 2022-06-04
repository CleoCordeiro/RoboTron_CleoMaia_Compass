
import pyfiglet
import glob
import os
from pick import pick
import importlib


def generate_banner(text: str) -> str:
    return pyfiglet.figlet_format(text, font="utils/ANSI Shadow", width=117)


def clear() -> None:
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')


def menu(options: list, banner: str) -> tuple:
    clear()
    selected_option, index = pick(options, banner, indicator='🡆 ', default_index=0)
    return selected_option, index


def main_menu() -> None:
    banner: str = generate_banner("It's Show Time!")
    options: list = ['Exercícios dia 5', 'Exercícios dia 7', 'Sair']
    selected_option, index = menu(options, banner)
    if selected_option == 'Exercícios dia 5':
        menu_dia5()
    if selected_option == 'Exercícios dia 7':
        menu_dia7()
    if selected_option == 'Sair':
        exit()


def menu_dia5() -> None:
    banner: str = generate_banner("Exercicios dia 5")+"\n Selecione o exercício:"
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
    banner: str = generate_banner("Exercicios dia 7")+"\n Selecione o exercício:"

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
    main_menu()
