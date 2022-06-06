import pyfiglet
import os

"""Dicionário com as cores do terminal."""
colors = {
    'WHITE': '\033[37m',
    'RED': '\033[31m',
    'GREEN': '\033[32m',
    'BLUE': '\033[34m',
    'CIANO': '\033[36m',
    'MAGENTA': '\033[35m',
    'YELLOW': '\033[33m',
    'RESET': '\033[0;0m',
    'NEGRITO': '\033[1m'
}


def generate_banner(msg):
    """Gera o banner em formato ASCII.

    Args:
        msg (_type_): Mensagem a ser exibida no banner.

    Returns:
        _type_: Banner gerado.
    """
    banner = pyfiglet.figlet_format(msg, font="utils/ANSI Shadow", width=117)
    return banner


def clear():
    """Limpa a tela de acordo com o sistema operacional."""
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')
