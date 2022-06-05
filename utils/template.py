from . import cores
from . import utils as utils


class Template:
    def __init__(self, banner: str, titulo: str):
        """Template class.

        Args:
            banner (str): O banner do exercício
            titulo (str): O titulo do exercício
        """
        self.banner = banner
        self.titulo = titulo

    def generate_banner(self) -> str:
        """Função que gera o banner dos exercícios

        Returns:
            str: Banner do exercício
        """
        banner_ascii = utils.generate_banner(self.banner)
        return self.centralizar(banner_ascii)

    def generate_titulo(self) -> str:
        """Função que gera o titulo do exercício

        Returns:
            str: Titulo do exercício
        """
        titulo_centralizado: str = self.linha()
        titulo_centralizado += self.centralizar(self.titulo)
        titulo_centralizado += self.linha()
        return titulo_centralizado

    def linha(self) -> str:
        """Função que gera uma linha de separação."""
        return ('-' * 117) + '\n'

    def centralizar(self, texto: str) -> str:
        """Função que centraliza e muda a cor do texto.

        Args:
            texto (str): O texto a ser centralizado.

        Returns:
            str: O texto centralizado e com a cor alterada.
        """
        centralizado: str = ''
        for i in texto.splitlines():
            centralizado += f"{utils.colors['GREEN']} {i.center(117)} {utils.colors['RESET']}\n"
        return centralizado

    def generate_pergunta(self, pergunta: str) -> str:
        """Função que gera a pergunta do exercício.

        Args:
            pergunta (str): A pergunta a ser gerada.

        Returns:
            str: A pergunta do exercício.
        """
        return f"{cores.YELLOW}{pergunta}{cores.RESET}"

    def generate_resposta(self, resposta: str) -> str:
        """Função que gera a resposta do exercício.

        Args:
            resposta (str): A resposta a ser gerada.

        Returns:
            str: A resposta do exercício.
        """
        return f"{cores.BLUE}{resposta}{cores.RESET}\n"

    def __str__(self) -> str:
        """Função utilizada para imprimir o template."""
        return self.generate_banner() + self.generate_titulo()
