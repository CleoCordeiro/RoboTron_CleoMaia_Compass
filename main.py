
import glob
import os
from pick import pick
import importlib
import utils.text as text


def menu(options, banner):
    text.clear()
    selected_option, index = pick(options, banner, indicator='🡆 ',default_index=0)
    return selected_option, index


def main_menu():
    banner = text.generate_banner("It's Show Time!")+"\n Selecione a lista de exercícios:"
    options = ['Exercícios dia 5', 'Exercícios dia 7', 'Sair']
    selected_option, index = menu(options, banner)
    if selected_option == 'Exercícios dia 5':
        menu_dia5()
    if selected_option == 'Exercícios dia 7':
        menu_dia7()
    if selected_option == 'Sair':
        exit()


def menu_dia5():
    banner = text.generate_banner("Exercicios dia 5")+"\n Selecione o exercício:"
    count_files = len(glob.glob1('Exercicios_Dia_5/',"*.py"))
    options = []
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



def menu_dia7():
    banner = text.generate_banner("Exercicios dia 7")+"\n Selecione o exercício:"

    count_files = len(glob.glob1('Exercicios_Dia_7/',"*.py"))
    options = []
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
