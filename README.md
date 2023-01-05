# advicer

A new Flutter project.

## Camadas do clean architecture

Clean architecture funciona através de três camadas, onde cada uma possui uma função que impacta na funcionalidade de outra camada.

### Application
É a camada responsavel pela exibição das telas, componentes proprios, controle de rotas internas de uma tela a outra e configuração dos temas do app.
Outra responsabilidade dessa camada é o armazenamento dos gerenciadores de estado, sejam eles: BLOC, CUBIT, MOBX, PROVIDER.

### Data
É a camada responsavel por efetuar as requisições via API, armazenamento interno e configurações de serviços externos ex: firebase.

### Domain
É a camada responsavel por cuidar das regras de negocio da aplicação.