from bs4 import BeautifulSoup
import pandas as pd
import requests


def json_to_csv(json_data: list, csv_file: str) -> None:
    '''Converte uma lista de dicionários em um arquivo csv'''
    df: pd.DataFrame = pd.DataFrame(json_data)
    df.to_csv(csv_file, index=False)


def scrapy() -> list:
    """
    Baixa a página da tabela periódica e retorna um dicionário com os dados
    """
    page: str = requests.get('https://ptable.com/#Propriedades').text
    soup: BeautifulSoup = BeautifulSoup(page, 'html.parser')
    elementos: list = []

    for li in soup.find_all("li", class_=["Solid", "Gas", "Liquid", "Unknown"]):
        linha, coluna = linus_pauling_diagram(int(li.b.text))
        if li.abbr.text == 'Lr':
            coluna += 17
        dict = {
            'Simbolo': li.abbr.text,
            'Nome': li.em.text,
            'NumeroAtomico': li.b.text,
            'Linha': linha,
            'Coluna': coluna,
            'EstadoFisico': li['class'][2]
            }
        elementos.append(dict)
    return(elementos)


def linus_pauling_diagram(eletrons: int) -> tuple:
    """
        Recebe o número de elétrons é faz a distribuição conforme o diagrama de Linus Pauling
    """
    eletronic_configuration = [['1s', 2],
                               ['2s', 2],
                               ['2p', 6],
                               ['3s', 2],
                               ['3p', 6],
                               ['4s', 2],
                               ['3d', 10],
                               ['4p', 6],
                               ['5s', 2],
                               ['4d', 10],
                               ['5p', 6],
                               ['6s', 2],
                               ['4f', 14],
                               ['5d', 10],
                               ['6p', 6],
                               ['7s', 2],
                               ['5f', 14],
                               ['6d', 10],
                               ['7p', 6]]
    last_period: str = '0'
    subclass_is_F: bool = False
    i: int = 0
    while eletrons > 0:
        """Lógica para salvar o último período do elemento
           Pega o periodo da lista na posição i e verifica se é maior ou igual ao ultimo período
           Se for maior, salva o novo período"""
        if int(eletronic_configuration[i][0][:1]) >= int(last_period[:1]):
            last_period = str(eletronic_configuration[i][0])

        """Verifica se o número de elétrons - a distribuição é  maior que 0
            se for maior que 0, decrementa o número de elétrons"""
        if eletrons - int(eletronic_configuration[i][1]) > 0:
            eletrons -= int(eletronic_configuration[i][1])

        else:
            """verifica se o último período é um período f"""
            if str(eletronic_configuration[i][0][1:2]) == 'f':
                subclass_is_F = True
            break
        i += 1
    return return_position(last_period, eletrons, subclass_is_F)


def return_position(last_period: str, eletrons: int, subclass_is_F: bool) -> tuple:
    """
    Recebe last_period, elétrons, subclass_is_F e retorna a posição x, y do elemento na tabela periódica
    """
    if(subclass_is_F):
        if(last_period[:1] == '6'):
            return(6, eletrons+3)
        if(last_period[:1] == '7'):
            return(7, eletrons+3)
    elif(last_period[1:2] == 's'):
        if(eletrons == 2 and last_period[:1] == '1'):
            return(1, 18)
        return (last_period[:1], eletrons)
    elif(last_period[1:2] == 'p'):
        return (last_period[:1], eletrons+12)
    elif(last_period[1:2] == 'd'):
        return (last_period[:1], eletrons+2)


def start() -> None:
    elementos: list = scrapy()
    json_to_csv(elementos, 'Dados/TabelaPeriodica.csv')


if __name__ == '__main__':
    start()
