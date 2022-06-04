# Crie um programa que lê 1 valor inteiro para X.
# Se o valor for par, calcular o fatorial de x em uma função
# e apresentar o resultado fora da função. Se o valor for impar,
# apresentar em uma função a tabuada de 1 a 10 de X.

def fatorial_ou_tabuada(x):
    if x % 2 == 0:
        text.resposta(f"O fatorial de {x} é {fatorial(x)}")
    else:
        text.resposta(tabuada(x))

def fatorial(x):
    if x == 1:
        return 1
    else:
        return x * fatorial(x-1)

def tabuada(x):
    taboadaStr = "Taboada de " + str(x) + ":\n"
    for i in range(1,11):
        taboadaStr += f"{x} x {i} = {x*i}\n"
    return taboadaStr

class ZeroNumberError(Exception):
    pass

def dialogo_fatorial_ou_tabuada():
    while True:
        try:
            x = int(input("Insira um número: "))
            if x == 0:
                raise ZeroNumberError
            fatorial_ou_tabuada(x)
            break
        except ZeroNumberError:
            print("Não é possível fazer a operação com zero!")
            break
        except KeyboardInterrupt:
            print("Até Mais!")
            break
        except ValueError: 
            print("Erro! Insira apenas números!")


def banner():
    text.print_banner("Exercicio 8")
    text.titulo('''
Crie um programa que lê 1 valor inteiro para X.
Se o valor for par, calcular o fatorial de x em uma função e apresentar o resultado fora da função.
Se o valor for impar, apresentar em uma função a tabuada de 1 a 10 de X.''')


def start():
    global text
    import utils.text as text
    banner()
    dialogo_fatorial_ou_tabuada()
  
   
if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()