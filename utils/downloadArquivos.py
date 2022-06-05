import requests
import os


def download_file(url: str, filename: str) -> None:
    """ Função que verifica se o arquivo existe e se não existe, baixa o arquivo.

    Args:
        url (str): url do arquivo
        filename (str): path mais o nome do arquivo
    """
    if not os.path.exists('Dados'):
        os.makedirs('Dados')
    if not os.path.exists(filename):
        with open(filename, 'wb') as f:
            response = requests.get(url)
            f.write(response.content)


def start() -> None:
    """ Função que inicia o programa.
    Pega a url do arquivo e o nome do arquivo.
    Chama a função download_file."""
    files: dict = {
        "Dados/partida.json": "https://pastebin.com/raw/amF0XHEa",
        "Dados/campeonato.json": "https://pastebin.com/raw/GxdV3pRP",
        "Dados/CSV.csv": "https://pastebin.com/raw/LndbVMRT",
    }

    for key, value in files.items():
        download_file(value, key)


if __name__ == "__main__":
    start()
