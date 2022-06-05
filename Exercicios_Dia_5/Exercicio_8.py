import os
import sys
from typing import Type


def fatorial_ou_tabuada(x: int) -> None:
    """Função que verifica se x é par ou impar e chama a função adequada.

    Args:
        x (int): Número inserido pelo usuário.

    Returns:
        _type_: Retorna uma string com a tabuada ou o fatorial de x.
    """
    if x % 2 == 0:
        return f"O fatorial de {x} é {fatorial(x)}"
    else:
        return tabuada(x)


def fatorial(x: int) -> int:
    """Função que retorna o fatorial de x.

    Args:
        x (int): Número inserido pelo usuário.

    Returns:
        int: Retorna o fatorial de x.
    """
    if x == 1:
        return 1
    else:
        return x * fatorial(x-1)


def tabuada(x: int) -> str:
    """Função que retorna a tabuada de 1 a 10 de x.

    Args:
        x (int): Número inserido pelo usuário.

    Returns:
        str: Retorna uma string com a tabuada de 1 a 10 de x.
    """
    taboadaStr: str = "Taboada de " + str(x) + ":\n"
    for i in range(1, 11):
        taboadaStr += f"{x} x {i} = {x*i}\n"
    return taboadaStr


class ZeroNumberError(Exception):
    pass


def dialogo_fatorial_ou_tabuada(template: Type['Template']) -> None:
    """Função que realiza o diálogo com o usuário.
    Pede para o usuário inserir um número inteiro."""
    while True:
        try:
            x: int = int(input(template.generate_pergunta("Insira um número: ")))
            if x == 0:
                raise ZeroNumberError
            print(template.genare_resposta(fatorial_ou_tabuada(x)))
            break
        except ZeroNumberError:
            print("Não é possível fazer a operação com zero!")
            break
        except KeyboardInterrupt:
            print("Até Mais!")
            break
        except ValueError:
            print("Erro! Insira apenas números!")


def start() -> None:
    """
    Função que inicia o programa.
    Realiza importes na biblioteca utils.template e utils.file.
    """
    global Template
    from utils.template import Template
    titulo: str = '''Crie um programa que lê 1 valor inteiro para X.
Se o valor for par, calcular o fatorial de x em uma função e apresentar o resultado fora da função.
Se o valor for impar, apresentar em uma função a tabuada de 1 a 10 de X.'''
    template: Type['Template'] = Template("Exercicio 8", titulo)
    print(template)
    dialogo_fatorial_ou_tabuada(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
