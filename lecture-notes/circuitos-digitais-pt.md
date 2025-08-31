<!-- pt :: CI1068 - Circuitos Digitais (PT) :: 2025-07-06 20:52:12 -->

*Essas anotações foram originalmente escritas em papel e parte delas foi
perdida*.

# 2023/03/30

Para converter racionais em racionais binários, método de multiplicação
sucessiva / inverso do inteiro:

```
0,3(10) = 0,010011001100...  
0,3 * 2 = **0**,6 -> d1 = 0  
0,6 * 2 = **1**,2 -> d2 = 1  
0,2 * 2 = **0**,4 -> d3 = 0  
etc
```

Para quando a parte fracionária for 0.

## Lógica formal

Precedência: ¬, ∧, ∨, ⇒, ⇔.

nota: lógica formal ñ dispensa  
precedência é convenção

# 2023/04/04

Overflow só ocorre em operações com sinais iguais. Em operações com sinais
diferentes, o resultado sempre será mais perto de zero que os operandos. Com
sinais iguais, o resultado deve ter o mesmo sinal que os operandos. Caso
contrário, ocorreu o overflow. Lembrando que máquinas não subtraem, elas somam
com o complemento.

Exemplo de multiplicação:

![Esquema de como se multiplica 0b010 (2) por 0b011 (3)](/static/lecture-notes/ci1068/multiply.png)

Perceba que multiplicar um número de N bits por um de M bits, o pior caso tem
tamanho de M+N bits.

Máquinas de 64 bits também trabalham com palavras de 32 bits. A arquitetura
denota só o barramento e acesso à memória.

A álgebra booleana trata apenas de 0 e 1. Operações básicas:

| E   | AND | ∧ | * | &&   |
| OU  | OR  | ∨ | + | \|\| |
| NÃO | NOT | ~ | ! | -    |

Tabela verdade:

| X | Y | X ∧ Y | X ∨ Y | ~X |
| 0 | 0 | 0     | 0     | 1  |
| 0 | 1 | 0     | 1     | 1  |
| 1 | 0 | 0     | 1     | 0  |
| 1 | 1 | 1     | 1     | 0  |

É possível criar funções:

`f(X, Y, Z) = X + Y - Z`

Precedência:

1- Parênteses ()  
2- NOT  
3- AND  
4- OR  
5- XOR  

Tabela verdade de f:

| X | Y | Z | X + Y - Z |
| 0 | 0 | 0 | 0         |
| 0 | 0 | 1 | 0         |
| 0 | 1 | 0 | 0         |
| 0 | 1 | 1 | 1         |
| 1 | 0 | 0 | 1         |
| 1 | 0 | 1 | 1         |
| 1 | 1 | 0 | 1         |
| 1 | 1 | 1 | 1         |

`f(X, Y) = !XY + X!Y`: XOR "Ou exclusivo"

| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

Normalmente, XOR ⊕ pode ser 1 tanto somente se apenas 1 váriavel for 1, quanto
se houverem ímpares 1.

Algumas regras:

`X + !X * Y = X + Y` pois:

```
(X + !X) * (X + Y)
1 * (X + Y)
(X + Y)
```

Símbolos em circuitos:

- 𜰕 OR  
- 𜰖 AND  
- 𜰙𜰘 NOT  

# 2023/04/11

A álgebra booleana é toda baseada em dois valores: 0 e 1.

A precedência tem a seguinte ordem:  
- ()  
- -  
- *  
- +  
- ⊕  

| A | B | A * B | A + B | A ⊕ B |
| 0 | 0 | 0     | 0     | 0     |
| 0 | 1 | 0     | 1     | 1     |
| 1 | 0 | 0     | 1     | 1     |
| 1 | 1 | 1     | 1     | 0     |

|                  | +                                 | *                     |
| Identidade       | `X + 1 = 1`                       | X * 0 = 0             |
| Elem. Neutro     | `X + 0 = 0`                       | X * 1 = X             |
| Idempotência     | `X + X = X`                       | X * X = X             |
| Involução        | `!!X = X`                         |                       |
| Complemento      | `X + !X = 1`                      | X * !X = 0            |
| Distributividade | `X + (Y * Z) = (X + Y) * (X + Z)` | X * (Y + Z) = XY + XZ |

E a mais importante, a De Morgan:

`!(X + Y) = !X * !Y`  
`!(X * Y) = !X + !Y`

Para criar uma função a partir de uma tabela verdade, lista-se todos os casos
com * e conecta-se com +.

# 2023/04/13


