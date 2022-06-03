def HelloWorld(): 
    text.resposta("Hello World")


def banner():
    text.print_banner("Exercicio 1")
    text.titulo("Construa um programa que quando executado mostra Hello World")
   

def start():
    global text
    import utils.text as text
    banner()
    HelloWorld()
    
    
    
if __name__ == '__main__':
    import os, sys
    sys.path.insert(0, os.getcwd())
    start()