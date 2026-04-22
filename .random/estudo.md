
UnB - Universidade de Brasilia  FGA - Faculdade do Gama  FGA0242 - Técnicas de Programação para Plataformas Emergentes

---

## Estudo Dirigido - Testes Unitários

**Tópicos da aula**
- Exercícios conceituais e práticos sobre o conteúdo de testes unitários. 
- Assuntos abordados: 
  - Testes unitários
  - Frameworks de testes unitários
  - Arquitetura de frameworks de testes unitários
  - Asserções, testes, casos de testes, suítes de testes
  - Independência funcional de testes / condição de corrida em testes
  - Testes simples
  - Testes de exceção
  - Categorias de testes
  - Testes com _timeout_
  - Ignorando testes
  - Testes parametrizados

:warning: Essa lista de exercícios cobre todo o conteúdo de testes unitários e
serve como atividade extra-classe em reposição à aula do dia 06/04/2026.

### **Exercicios de fixação**

#### Parte I: Questões Teóricas (Conceitual)
1. Defina o que são testes unitários e explique(1.1) a diferença entre testar um método isolado e testar um componente de software(1.2).

R: Testes unitários são aquele que testam  o que seria a menor unidade de um software, sendo amplamente considerado, a menor unidade de um software orientado a objeto, um método pertencente a uma classe, testar um método isoladamente não garante que o componente(conjunto de  métodos) esteja coerente

Rr: Testes unitários verificam a menor unidade funcional do software de forma isolada, em linguagens orientadas a objetos, essa unidade é popularmente e amplamente aceita que é "um método"(1.1), sobre a diferença entre testar um método isoladamente e testar um componente de software, quando escrevemos testes unitários, estamos testando somente o comportamento  daquela unidade e frequentemente, quando há acoplamento externo, precisamos criar mocks/stubs para executar o teste, dessa forma, testar exclusivamente as unidades de um componente, não garante que a interligacão entre essas unidades sigam o comportamento  esperado, podem haver problemas externos às unidades, como erro no contrato, ordem de chamada, estado compartilhados, race condition, divergência entre mocks e comportamento  real, o que faz com que testes unitários e testes de componentes não sejam substituiveis, mas sim, complementares(1.2)

2. Segundo Martin Fowler, qual é a característica principal que define um
   framework em oposição a uma biblioteca? Como o JUnit exemplifica essa
   definição através da "Inversão de Controle"?

Rr: Biblioteca é um conjunto de funcõe que você invoca quando precisar, já framework é um esqueleto de aplicacão pronto, com fluxo de controle já definido, você só pluga seu codigo nos pontos de extensão, então para o Martin, é o Principio  da Inversão de controle, o Junit tem isso no principio de Hollywood(Don´t call us, we will call you), você não  chama os métodos que você escreve, usando as anotações(@Test, @Before, @After..) e o runner do Junit  que chama pra ti


3. Explique o conceito de Condição de Corrida (Race Condition) no contexto de
   testes unitários. Por que testes que dependem de estado compartilhado ou
   ordem de execução são considerados um "anti-pattern"?

R: Condicões de corrida ocorrem quando temos objetos compartilhados entre o testes, desse modo, a mudanca de estado de um objeto pode inteferir diretamente no resultado de um teste, já que o teste verifica se os estados do objetos após algum comportamente, batem com o esperado. Esse comportamente é considerado um anti-pattern, pois viola o principio de atomicidade de um teste, também conhecido como principio da  de Independência, dessa forma, podem ocorrer comportamentos não deterministicos quando temos testes de estado compartilhado, o classico caso de roda uma vez, passou, roda novamente, não passou, roda novamente, passou, não tendo diferença na implementacao dos testes entre as runs, ou até sobre a ordem de execução, como há a dependcia entre testes, torna o paralelismo inviavel, pois poderia ocorrer race conditions

4. Diferencie os seguintes termos dentro do ecossistema JUnit:

Hierarquia
  assercão <  metodo de teste < caso de teste < suíte

   a) Asserção (Assertion)  
   R: Verificacão do estado de um objeto, na traducao direta seria, "verifique que x é igual ao y esperado"
   Rr: assercão é qualquer afirmacão  verificavel sobre o comportamento do codigo sob teste, se a afirmacão for falsa, o teste  falha
   b) Método de Teste (Test Method)  
   R: é a implementacao de um método para testar o comportamente de um codigo, para o Junit, é o metodo anotado  com @Test
   c) Caso de Teste (Test Case)  
   R: Conjunto de métodos de teste, que forma umam classe
   d) Suíte de Testes (Test Suite)  
   R: Conjunto de casos de testes, que agrupam classes de teste

5. A arquitetura do JUnit 4 é fundamentada em Design Patterns clássicos do GoF.
   Explique como o padrão Composite é utilizado na organização de suítes de
   testes e como o padrão Template Method se relaciona com a execução de métodos
   marcados com @Test.
   R: O padão composite permite a criacão de subclasses permitindo uma segmentacão maior dos testes, criando suites especificas para cada tipo  de teste. 
      Já o template method se relaciona os testes marcados com @Test pois esse é o template padrão do que seria um teste

  Rr: O padrão composite, compõe objetos em estrutura de arvore, para representar hierarquias, no Junit, O component mais acima da composicao é o Runner, tendo a folha como a classe de Test, que é a menor unidade executavel, essa estrutura de composite permite a organizacao especifica desejada pelo desenvolvedor na maneira que ele criar suas classes(suites, componenetes) de teste, exemplificando, o runner pode chamar o componente abaixo dele sem se preocupar se a classe abaixo é uma folha ou ainda uma classe filha, pois todos possuem a composicao e executam atraves de recursao
     O padrão template, define o esqueleto de um algoritmo em uma classe mãe, delegando certo passos para as classes filhas, permitindo que as filahs redefinam os passos internos dos algoritmo, em especifico no Junit, nos temos o template method sendo o nosso runer e a classe de test permitindo a reescrita dos metodos internos

6. Como desenvolvedores, de que forma "complementamos" a implementação do
   framework JUnit para que ele execute nossa lógica de negócio? Relacione sua
   resposta com o conceito de Hooks (ganchos).

   Rr: Nós descrevemos os metodos de testes, que são considerados os "ganchos" pois o runner do Junit possui pontos de extensão, que são examente os hooks, que nós os usamos via anotacao (@Test...), o desenvolvedor preenche esse ganhos atraves da escrita de metodos que contenham a logica de execucao  dos testes

7. Explique o funcionamento dos Testes Parametrizados. Em qual cenário eles são
   mais eficientes do que escrever múltiplos métodos de teste individuais?

Rr: Testes parametrizados permitem executar o mesmo método de teste varias vezez, mas cada execução com diferentes entradas e saidas esperadas, sem duplicacao de código, em vez de escrever N métodos de teste, você escreve 1 método + uma tabela de dados, eles são mais eficientes quando a lógica de assercão é a mesma e precisa-se sometne mudar os dados
Seu funcionamento é , para cada conjunto de dados, cria uma nova instancia da classe de teste e roda todo os @Test nela.


8. O JUnit 4 permite o uso de Categories. Qual a utilidade prática de
   categorizar testes em um ambiente de Integração Contínua (CI/CD)?

R: Podemos categorizar  testes que rodem somente quando forem fazer um deploy completo, fazer categorias pare evitar rodar novamente testes que de categorias de padrões que não foram alteradas

Rr: o uso de categorias do Junit, nós permite marcar testes com tags(as categorias) e depois selecionar/filtrar quais categorias rodam por execucao, dessa forma, podemos seprar categorias no CI/CD que não foram alteradas, podemos criar categorais mais rigidas para o deploy, dentre outros.

#### Parte II: Questões Práticas (Raciocínio e Implementação)
9. Analise o código abaixo e identifique o erro de lógica ou de anotação que
   impedirá o teste de validar corretamente a exceção esperada:

```Java
@Test
public void testeDivisaoPorZero() {
    Calculadora calc = new Calculadora();
    int resultado = calc.dividir(10, 0);
    // O método dividir lança ArithmeticException
}
```

Como você corrigiria este teste para que ele passasse apenas se a exceção for
lançada, utilizando os recursos nativos do JUnit 4?

R: O testeDivisaoPorZero apenas lanca uma execao, mas na definicao do testes, declaramos como void, não temos nada que irá fazer o catch da execao, para fazer o catch colocariamos um assert se chegar uma exceção

Rr: Nesse teste, não tem nada que indique ao junit a inteção de testar a exeção, deveria ter algo como @Test(expected = ArithmeticException.class)

10. Escreva uma classe de teste em Junit4 chamada `StringUtilTest`. Implemente
    um método que verifique se o método `converterParaMaiusculo(String input)`
    de uma classe `StringUtil` funciona corretamente. Utilize pelo menos duas
    asserções diferentes (ex: `assertEquals` e `assertNotNull`).


´´´java

public class StringUtilTest {

@test

public void TesteConverteParaMaisuculo(){

  
  StringUtil util - new StringUtil();
  String resultado - util. converterParaMaiusculo("hello");
  assertNotNul(resultado);
  assert("HELLO", resultado)
}
}

´´´


11. Considere um sistema de banco de dados onde o desenvolvedor escreveu o
    seguinte teste:

```Java
public class BancoTest {
    private static Conexao conn = new Conexao();

    @Test
    public void inserirUsuario() {
        conn.executar("INSERT INTO usuarios...");
        assertEquals(1, conn.totalUsuarios());
    }

    @Test
    public void deletarUsuario() {
        conn.executar("DELETE FROM usuarios...");
        assertEquals(0, conn.totalUsuarios());
    }
}
```

Por que esse teste é vulnerável a condições de corrida ou falhas intermitentes?
O que deve ser feito para isolar o estado entre os testes?

Rr: Esse teste é vuneralvel pois ele nao possui o metodo destruidor, eles geram novas conexoes, mas nao há desconectam, há depender do banco de dados, pode haver um compotramento diferente de acordo com a quantidade de conexoes
Como usaram o static, usa-se a mesma conexao para todo os testes, static viola o isolamento do Junit
Suposicao dos estados iniciais, tano o equal 0 ou 1, nao da pra ter certeza
Junit nao garante ordem entre os testes, nao é pq inserir ta antes de delete que de fato essa é a ordem de execution

12. Crie um exemplo de Teste com Timeout. Imagine um método `processarLote()`
    que não pode levar mais de 500 milissegundos para ser executado. Escreva a
    estrutura do teste utilizando a anotação apropriada.

@test(timout - 500)
public void testeProcessarLote(){
  Result r = processador.processarLote();
  assertNotNull(r);
  assertTrue(r.isSucess());
}

13. Dado o código abaixo, explique qual será o resultado da execução deste teste
    se o método calcularDesconto retornar 10.00001 para um valor esperado de
    10.0.

```Java
@Test
public void testePreco() {
    double esperado = 10.0;
    double atual = produto.calcularDesconto();
    assertEquals(esperado, atual, 0.001);
}
```

O teste passará ou falhará? Justifique baseando-se no conceito de "delta" em
asserções de ponto flutuante.

Rr: A sobrecarga do delta por 0.001 faz com que o metodo assertEquals aceite um certo delta na comparacao, logo como a mudanca é menor que o delta, o teste passará

14. Demonstre a criação de uma Suíte de Testes (TestSuite) que agrupe duas
    classes hipotéticas: LoginTest.class e CadastroTest.class. Utilize as
    anotações @RunWith e @SuiteClasses.

```java
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({
    LoginTest.class,
    CadastroTest.class
})
public class SuiteAutenticacao {
    // corpo vazio — classe é apenas um container para as anotações.
    // O Suite runner lê as anotações via reflexão e executa cada classe listada.
}
```

15. Escreva o esqueleto de um Teste Parametrizado para validar um método
    `ehPar(int n)`. Você deve definir:

    a) O Runner específico para parâmetros.  
    b) O método estático que fornece os dados (ex: 2 -> true, 3 -> false).  
    c) O construtor da classe de teste para receber esses dados.  

```java
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;
import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.Collection;

// a) Runner específico para testes parametrizados
@RunWith(Parameterized.class)
public class EhParTest {

    private int entrada;
    private boolean esperado;

    // c) Construtor recebe os parâmetros na mesma ordem do Object[]
    public EhParTest(int entrada, boolean esperado) {
        this.entrada = entrada;
        this.esperado = esperado;
    }

    // b) Método estático que fornece os dados
    @Parameters
    public static Collection<Object[]> dados() {
        return Arrays.asList(new Object[][] {
            { 2, true },
            { 3, false },
            { 4, true },
            { 5, false }
        });
    }

    @Test
    public void testEhPar() {
        assertEquals(esperado, Numero.ehPar(entrada));
    }
}
```
