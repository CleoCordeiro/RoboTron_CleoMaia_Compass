import pyfiglet

from . import cores


class Template:
    def __init__(self, banner: str, titulo: str):
        self.banner = banner
        self.titulo = titulo

    def generate_banner(self) -> str:
        banner_ascii = pyfiglet.figlet_format(
            self.banner, font="utils/ANSI Shadow", width=117)
        return self.centralizar(banner_ascii)

    def generate_titulo(self) -> str:
        titulo_centralizado: str = self.linha()
        titulo_centralizado += self.centralizar(self.titulo)
        titulo_centralizado += self.linha()
        return titulo_centralizado

    def linha(self) -> str:
        return ('-' * 117) + '\n'

    def centralizar(self, texto: str) -> str:
        centralizado: str = ''
        for i in texto.splitlines():
            centralizado += f"{cores.GREEN} {i.center(117)} {cores.RESET}\n"
        return centralizado

    def generate_pergunta(self, pergunta: str) -> str:
        return f"{cores.YELLOW}{pergunta}{cores.RESET}"

    def generate_resposta(self, resposta: str) -> str:
        return f"{cores.BLUE}{resposta}{cores.RESET}\n"

    def __str__(self) -> str:
        return self.generate_banner() + self.generate_titulo()
