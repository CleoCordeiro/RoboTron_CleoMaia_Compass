# Leia um valor inteiro correspondente à idade de uma pessoa em dias
# e informe-a em anos, meses e dias. Obs.: apenas para facilitar o cálculo,
# considere todo ano com 365 dias e todo mês com 30 dias. Nos casos de teste
# nunca haverá uma situação que permite 12 meses e alguns dias, como 360, 363 ou 364.
# Este é apenas um exercício com objetivo de testar raciocínio matemático simples.

def calcularIdade(dias):
    anos = dias // 365
    meses = (dias % 365) // 30
    dias = (dias % 365) % 30
    return anos, meses, dias


def dialogoIdade():
    while True:
        try:
            dias = int(input(text.pergunta("Insira a idade em dias: ")))
            idade = calcularIdade(dias)
            text.resposta(f"{dias} dias equivalem a {idade[0]} anos, {idade[1]} meses e {idade[2]} dias de idade.")
            break
        except ValueError:
            print("Erro! Insira apenas números!")


def banner():
    text.print_banner("Exercicio 12")
    text.titulo('''
Leia um valor inteiro correspondente à idade de uma pessoa em dias
e informe-a em anos, meses e dias. Obs.: apenas para facilitar o cálculo,
considere todo ano com 365 dias e todo mês com 30 dias. Nos casos de teste
nunca haverá uma situação que permite 12 meses e alguns dias, como 360, 363 ou 364.
Este é apenas um exercício com objetivo de testar raciocínio matemático simples.''')


def start():
    global text
    import utils.text as text
    banner()
    dialogoIdade()
    

if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()