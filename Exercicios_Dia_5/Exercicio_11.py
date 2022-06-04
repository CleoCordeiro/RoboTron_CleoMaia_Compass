#  Leia a hora inicial e a hora final de um jogo.
#  A seguir calcule a duração do jogo, sabendo que o mesmo pode começar em um dia e terminar em outro,
#  tendo uma duração mínima de 1 hora e máxima de 24 horas.
#  Entrada: A entrada contém dois valores inteiros representando a hora de início e a hora de fim do jogo.
#  Saída: Apresente a duração do jogo conforme exemplo abaixo

def duracao_jogo(horaInicial, horaFinal):
    if horaInicial < horaFinal:
        return horaFinal - horaInicial
    else:
        return 24 + horaFinal - horaInicial

def dialogo_duracao_jogo():
    while True:
        try:
            horaInicial = int(input(text.pergunta("Insira a hora de início do jogo: ")))
            horaFinal = int(input(text.pergunta("Insira a hora de fim do jogo: ")))
            text.resposta(f"O jogo durou {duracao_jogo(horaInicial, horaFinal)} hora(s)")
            break
        except KeyboardInterrupt:
            print("Até Mais!")
            break
        except ValueError: 
            print("Erro! Insira apenas números!")

def banner():
    text.print_banner("Exercicio 11")
    text.titulo('''
Leia a hora inicial e a hora final de um jogo. A seguir calcule a duração do jogo,
sabendo que o mesmo pode começar em um dia e terminar em outro,
tendo uma duração mínima de 1 hora e máxima de 24 horas. Entrada:
A entrada contém dois valores inteiros representando a hora de início
e a hora de fim do jogo. Saída: Apresente a duração do jogo conforme exemplo abaixo.''')

def start():
    global text
    import utils.text as text
    banner()
    dialogo_duracao_jogo()
    
if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()