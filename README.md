O trabalho, então, consiste na implementação de um Analisador Léxico usando Lex que seja capaz de:

    Identificar palavras reservadas para representar:

        Estruturas de repetição (ao menos 'for' e 'while');
        Estruturas condicionais (ao menos 'if');
        Tipos de variáveis (ao menos 'int', 'char', 'void', e 'float');
        Operações aritméticas (+,-,*,/) com parênteses;
        Operações comparativas (>, <, >=, <=, ==);
        Operações lógicas (AND, OR, NOT);
        Operação de Atribuição (=);
        Separadores e contextos (<;>, <(>, <)>, <{>, <}>).

    Identificar Números Reais;
    Identificar Strings;
    Identificar IDs (variáveis e funções);
    Reportar erros (e dizer em qual linha o erro ocorre);
    Lidar com espaços em branco, tabulações e saltos de linha;
    Gerar uma tabela de símbolos com todos os identificadores encontrados (sem repetição de identificador).
    Ler um arquivo de entrada (tal como entrada.c);
    Imprimir todos os tokens encontrados e seus lexemas;
    Imprir a tabela de símbolos.

 

Segue o código inicial:
trab2-start-1.zip
Download trab2-start-1.zip

O código será corrigido inicialmente de forma automática. Para tanto, uma lista de entradas serão dadas para o programa, e as saídas serão comparadas à uma lista de saídas. As regras são:

    A cada token encontrado, imprimir: "<i>) <token> <lexema>\n", onde <i> é o número do token encontrado, <token> é o valor inteiro que define a classe do token, e <lexema> é o próprio lexema.
        Exemplo: a entrada "z = 10;" deverá resultar em 4 linhas de saída:
            1) 257 z
            2) 61 =
            3) 256 10
            4) 59;
        Dado #define ID 257 e #define NUM 256
    Em caso de erro léxico, o token não identificado não avança a contagem de tokens, e o programa deverá imprimir: "erro lexico na linha <numero_da_linha> - <lexema>"
        Onde <numero_da_linha> é a linha;
    Ao final do programa, imprimir a tabela de símbolos usando a função pré-implementada "imprime()".

Estou anexando o arquivo "entradas-e-saidas.zip" que contém arquivos "entradaX.c" e "saidaX_.c", com X contido em {1,2,3,4,5}. Diferente do Trabalho 1, o seu analex agora recebe arquivos como argumentos para os parâmetros da main. Então, a compilação e execução será algo como:

lex -o analex.c analex.l

gcc -o analex analex.c

./analex entrada1.c > saida1.txt

Contudo, como nossas linguagens e os números dos nossos tokens podem ser diferentes, o diff será insuficiente. Por tanto, também anexei um shell script para verificar automaticamente. Para rodar o script, basta executar:

./verifica_inconsistencias.sh entradas_saidas/

ATENÇÃO!!! Para executar o script, você deve estar na raíz do projeto (um "ls" no terminal deve te mostrar os arquivos .l e os .h). Se o script não rodar, execute chmod 777 verifica_inconsistencias.sh e depois tente novamente.

O resultado deverá te informar quais arquivos resultaram idênticos e quais foram diferentes.

O envio deve ser feito em um .zip que deve conter os seguintes arquivos:

    analex.l -> arquivo do lex;

    entradas_saidas/ -> a pasta com os arquivos de entrada semanticamente idênticos mas compátiveis com a sua linguagem;
    tokens.h -> arquivo com os #defines de cada token
    tabsimb.h -> arquivo que define a struct e as funções da tabela de símbolos

Peço para que sigam o nome dos arquivos para facilitar a correção.

Boa implementação!
