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

   /\       Integration test (É os testes de rotas, sistemas terceiros, integrações em geral.)
  /  \      Golden test (É uma evolução dos testes de widgets)
 /    \     Widget test (Testa os componentes e as telas da aplicação)
/______\    Unit Test (Testa as regras de negocio)