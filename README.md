# advicer

A new Flutter project.

## Camadas do clean architecture

Clean architecture funciona através de três camadas, onde cada uma possui uma função que impacta na funcionalidade de outra camada.

### Application
É a camada responsavel pela exibição das telas, componentes proprios, controle de rotas internas de uma tela a outra e configuração dos temas do app.
Outra responsabilidade dessa camada é o armazenamento dos gerenciadores de estado, sejam eles: BLOC, CUBIT, MOBX, PROVIDER.

#### Atribuições
- Exibição das regras de negocio em forma de tela;
- Comunicação com a camada domain;
- Gerencia de estado;

### Domain
É a camada responsavel por cuidar das regras de negocio da aplicação.
Também é onde fica os modelos da aplicação.

#### Atribuições
- Comunicação com a camada Data;

### Data
É a camada responsavel por efetuar as requisições via API, armazenamento interno e configurações de serviços externos ex: firebase.
Também é a camada que possui os modelos de dados e comunicações externas.

#### Atribuições
- Armazenamento interno;
- Comunicação com API;
- Serviços externos;
- SQLite;

### Testes

A construção dos testes seguem uma devida logica, sendo implementados em um esquema de piramide, onde os mais cruciais surgem como a base da mesma.
A ordem da piramide é a seguinte:

```sh
   /\       Integration test (É os testes de rotas, sistemas terceiros, integrações em geral.)
  /  \      Golden test (É uma evolução dos testes de widgets)
 /    \     Widget test (Testa os componentes e as telas da aplicação)
/______\    Unit Test (Testa as regras de negocio)
```

#### Unit test
É onde se testa as regras de negócio da aplicação, em todas as camadas possiveis, (app, domain, data).
Na camada app não testamos as telas, somente os gerenciadores de estado.

#### Widget test
É onde efetuamos todos os testes de telas, widgets customizados e pacotes que tenham alguma exibição na tela.

#### Golden test
É a mesma coisa que os <b>widgets Test</b>, mas eles são utilizados para funções mais especiais do Flutter para
que você possa fazer um relacionamento entre o código e os arquivos.

São utilizados para assistir ou comparar duas diferenças de imagens da interface.

Também pode ser utilizado para validar as configurações de build do Flutter, como busca do repositorio padrão do FLUTTER_ROOT, busca de fontes e icones.

```sh
flutter test --update-goldens
```

Para configurar os testes no momento do CI/CD é possivel utilizar o pacote alchemist.
:alembic: [Alchemist](https://pub.dev/packages/alchemist)

#### Integration test

É muito similar ao teste de widgets, sendo sua principal diferença a possibilidade de rodar os testes de widget em um emulador
para ver qual o comportamento do app, enquanto o integration test diz que sempre deve ser executado em um dispositivo real,
para implementar suas regras de back-end, podendo efetuar o teste de ponta a ponta do seu dispositivo até o back-end da aplicação.
Para testar com diversos Mocks, é preciso verificar se as funções estão todas corretamente implementadas,
pois cada alteração no back-end da aplicação poderá quebrar os testes e assim corrigi-los.