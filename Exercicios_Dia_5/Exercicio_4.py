# Construa um programa que armazena uma idade em uma váriavel e compara,
# se a idade for maior que 18, apresenta "Maior de idade",
# se a idade for menor que 12, apresenta "Você é uma criança"
# e se for maior que 12 e menor que 18, apresenta "Você é um adolescente

def check_idade(idade):
    if idade < 0:
        return 'Idade inválida'
    if idade < 12:
        return 'Você é uma criança'
    elif idade < 18:
        return 'Você é um adolescente'
    else:
        return 'Maior de idade'


def dialogoIdade():
    while True:
        try:
            idade = int(input('Insira a sua idade: '))
            text.resposta(check_idade(idade))
            break
        except KeyboardInterrupt:
            print('Até Mais!')
            break
        except ValueError:
            print('Erro! Insira apenas números inteiros!')


def banner():
    text.print_banner("Exercicio 4")
    text.titulo('''
Construa um programa que armazena uma idade em uma váriavel e compara,
se a idade for maior que 18, apresenta "Maior de idade",
se a idade for menor que 12, apresenta "Você é uma criança"
e se for maior que 12 e menor que 18, apresenta "Você é um adolescente''')
     

def start():
    global text
    import utils.text as text
    banner()
    dialogoIdade()
    

if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()