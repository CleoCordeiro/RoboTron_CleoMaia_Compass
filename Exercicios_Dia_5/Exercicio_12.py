import os
import sys
from typing import Type


def calcular_idade(dias: int) -> tuple:
    anos: int = dias // 365
    meses: int = (dias % 365) // 30
    dias: int = (dias % 365) % 30
    return anos, meses, dias


def dialogo_idade(template: Type['Template']) -> None:
    while True:
        try:
            dias: int = int(input(template.generate_pergunta("Insira a idade em dias: ")))
            idade: tuple = calcular_idade(dias)
            print(template.generate_resposta(
                f"{dias} dias equivalem a {idade[0]} anos, {idade[1]} meses e {idade[2]} dias de idade."))
            break
        except ValueError:
            print("Erro! Insira apenas números!")


def start() -> None:
    global Template
    from utils.template import Template
    titulo: str = '''Leia um valor inteiro correspondente à idade de uma pessoa em dias
e informe-a em anos, meses e dias. Obs.: apenas para facilitar o cálculo,
considere todo ano com 365 dias e todo mês com 30 dias. Nos casos de teste
nunca haverá uma situação que permite 12 meses e alguns dias, como 360, 363 ou 364.
Este é apenas um exercício com objetivo de testar raciocínio matemático simples.'''
    template: Type['Template'] = Template("Exercicio 12", titulo)
    print(template)
    dialogo_idade(template)


if __name__ == '__main__':
    sys.path.insert(0, os.getcwd())
    start()
