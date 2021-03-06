import os
import sys
from typing import Type


def duracao_jogo(horaInicial: int, horaFinal: int) -> int:
    """Função que calcula a duração do jogo.

    Args:
        horaInicial (int): Hora de início do jogo.
        horaFinal (int): Hora de fim do jogo.

    Returns:
        int: Retorna a duração do jogo.
    """
    if horaInicial < horaFinal:
        return horaFinal - horaInicial
    else:
        return 24 + horaFinal - horaInicial


def dialogo_duracao_jogo(template: Type['Template']) -> None:
    """Função que realiza o diálogo com o usuário.
    Pede para o usuário inserir a hora de início e fim do jogo."""
    while True:
        try:
            horaInicial: int = int(input(template.generate_pergunta("Insira a hora de início do jogo: ")))
            horaFinal: int = int(input(template.generate_pergunta("Insira a hora de fim do jogo: ")))
            print(template.generate_resposta(f"O jogo durou {duracao_jogo(horaInicial, horaFinal)} hora(s)"))
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
    titulo: str = '''Leia a hora inicial e a hora final de um jogo. A seguir calcule a duração do jogo,
sabendo que o mesmo pode começar em um dia e terminar em outro,
tendo uma duração mínima de 1 hora e máxima de 24 horas. Entrada:
A entrada contém dois valores inteiros representando a hora de início
e a hora de fim do jogo. Saída: Apresente a duração do jogo conforme exemplo abaixo.'''
    template: Type['Template'] = Template("Exercicio 11", titulo)
    print(template)
    dialogo_duracao_jogo(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
