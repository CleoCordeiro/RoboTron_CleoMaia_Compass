import os
import sys
from typing import Type


def check_idade(idade: int) -> str:
    """ Verifica a idade e retorna uma mensagem de acordo com o caso.

    Args:
        idade (int): Idade a ser verificada.

    Returns:
        str: Mensagem de acordo com o caso.
    """
    if idade < 0:
        return 'Idade inválida'
    if idade < 12:
        return 'Você é uma criança'
    elif idade < 18:
        return 'Você é um adolescente'
    else:
        return 'Maior de idade'


def dialogo_idade(template: Type['Template']) -> None:
    """Função que realiza o dialogo com o usuário.
        Pede para o usuário inserir uma idade."""
    while True:
        try:
            idade: int = int(input(template.generate_pergunta('Insira a sua idade: ')))
            print(template.generate_resposta(check_idade(idade)))
            break
        except KeyboardInterrupt:
            print('Até Mais!')
            break
        except ValueError:
            print('Erro! Insira apenas números inteiros!')


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template
    from utils.template import Template
    titulo: str = '''Construa um programa que armazena uma idade em uma váriavel e compara,
se a idade for maior que 18, apresenta "Maior de idade",
se a idade for menor que 12, apresenta "Você é uma criança"
e se for maior que 12 e menor que 18, apresenta "Você é um adolescente.'''
    template: Type['Template'] = Template("Exercicio 4", titulo)
    print(template)
    dialogo_idade(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
