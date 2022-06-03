import pyfiglet
import os
 
colors = {
    'white' : '\033[37m',
    'red' : '\033[31m',
    'green' : '\033[32m',
    'blue' : '\033[34m',
    'ciano' : '\033[36m',
    'magenta' : '\033[35m',
    'yellow' : '\033[33m',
    'reset' : '\033[0;0m',
    'negrito' : '\033[1m'
}


def linha(tam=117):
    print('-' * tam)


def titulo(msg):
    linha()
    print_center_literalString(msg)
    linha()
    print()


def generate_banner(msg):
    banner = pyfiglet.figlet_format(msg, font="utils/ANSI Shadow", width=117)
    return banner


def print_banner(msg):
    print()
    print_center_literalString(generate_banner(msg))


def print_center_literalString(msg):
    for i in msg.splitlines():
        print(f"{colors['green']} {i.center(117)} {colors['reset']}")


def pergunta(msg):
    return(f"{colors['yellow']}{msg}{colors['reset']}")


def resposta(msg):
    print(f"{colors['blue']}{msg}{colors['reset']}")


def clear():
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')
        