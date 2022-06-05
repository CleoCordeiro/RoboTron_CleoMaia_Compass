import json
import pandas as pd


def open_json(file: str) -> dict:
    """ Função que abre um arquivo json e retorna um dicionário.

    Args:
        file (str): path mais o nome do arquivo

    Returns:
        dict: dicionário com os dados do arquivo
    """
    with open(file, encoding='utf-8') as f:
        return json.load(f)


def dump_json(dados: dict) -> str:
    """ Função que transforma um dicionário em um json e retorna uma string.

    Args:
        dados (dict): path mais o nome do arquivo

    Returns:
        str: string com os dados do arquivo
    """
    return json.dumps(dados, indent=2, )


def open_csv_from_pandas(file: str) -> pd.DataFrame:
    """ Função que abre um arquivo csv e retorna um DataFrame.

    Args:
        file (str): path mais o nome do arquivo

    Returns:
        pd.DataFrame: DataFrame com os dados do arquivo
    """
    return pd.read_csv(file, encoding='utf-8')
