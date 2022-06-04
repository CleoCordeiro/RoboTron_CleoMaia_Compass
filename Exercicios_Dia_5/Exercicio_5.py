# Construa um programa que recebe 20 valores para X
# e no final apresenta a média aritmética dos valores pares digitados

def media_20_numeros(x):
    return sum(x)/len(x)

def dialogo_media_20_numeros():
    while True:
        try:
            x = []
            for i in range(20):
                x.append(float((input(text.pergunta(f"Insira o {i+1}º número: ")))))
            text.resposta(f"A média dos números {x} é: {media_20_numeros(x):.2f}")
            break
        except KeyboardInterrupt:
            print("Até Mais!")
            break
        except ValueError: 
            print("Erro! Insira apenas números!")

def banner():
    text.print_banner("Exercicio 5")
    text.titulo('''
Construa um programa que recebe 20 valores para X e no final
 apresenta a média aritmética dos valores pares digitados''')

def start():
    global text
    import utils.text as text
    banner()
    dialogo_media_20_numeros()

if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()