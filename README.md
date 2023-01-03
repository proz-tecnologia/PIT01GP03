# **Porkin.io app**
O Porkin.io virtual do planejamento financeiro.
PIT01GP03
Programa intregador turma 01 grupo 03.
## Descrição geral
O desenvolvimento do aplicativo em questão faz parte do Projeto Integrador do curso "Desenvolvimento Mobile em Flutter" oferecido Proz Educação.
O projeto deve ser organizado em Cinco Sprints e o tema a ser trabalhado deve estar associado à Finanças.
## Sobre o Porkin.io app
É um aplicativo que visa auxiliar a organização financeira, de tal maneira que possa contribuir com o alcance dos objetivos do usuário.
O app Porkin.io pretende cumprir seu propósito:
- Incluindo como um dos principais publico-alvos jovens na faixa-etária de 11 a 21 anos;
- Estes jovens estão em processo de inserção no mundo financeiro. Logo, torna-se interessante o uso de um aplicativo que comprenda essa situação como também considere as principais necessidades deste publico no quesito finanças e realização de sonhos.
- Fazendo uso de uma linguagem clara, descontraída e simples;
- Disponibilizando conteudos relacionados à educação financeira adaptada para o perfil do usuário;
A fim de melhor conhecer o perfil e as necessidades dos jovens de 11 a 21 anos e posteriormente, disponibilizar funcionalidades apropriadas no aplicativo, os integrantes do projeto elaboraram e aplicaram um formulário de pesquisa de mercado compartilhado a seguir:
https://docs.google.com/forms/d/1vhUbLryUbQpkHt8wAdCPbYObKz27KpfN3V9-OCa5op8/edit#responses
As estatisticas geradas a partir do formulário corroboraram as pretensões iniciais para desenvolvimento do aplicativo em questão. Nesse sentido, aproximadamente 63% dos jovens que responderam o formulário recebem mesada ou uma quantia de dinheiro eventualmente sendo que 93% deles possuem um objetivo financeiro a longo prazo.
Etapas concluídas:
- [x] Sprint I
- [X] Sprint II
- [ ] Sprint III
- [ ] Sprint IV
- [ ] Sprint V

## SPRINT I
Sprint Objetivos Sprint I:

- Desenvolver protótipo/wireframe da Sprint I;
- Programar em Flutter o protótipo;
- O projeto deve conter componentes reutilizáveis; 
- O projeto deve seguir as convenções da linguagem e boas praticas;
- O projeto deve apresnetar os componentes e funcinalidades definidas pelas regras de negócio.

Recursos utilizados:
- Editor gráfico Figma;
- Editor grádico Adobe XD;

Autores do projeto:
- Beatriz Pereira de Sousa Lima
- Charleston Ribeiro
- Diego Gomes
- Paulo Amorim
### Protótipo elaborado conforme Sprint I
![screens_prototipos](https://user-images.githubusercontent.com/108772866/198699526-6d94e51f-df4f-4d22-be44-b540795b3ddf.jpeg)
### Telas elaboradas em Flutter conforme Sprint I
Como tela adicional ao protótipo elaborado, inclui-se a tela Recovery password.

![screens_flutter](https://user-images.githubusercontent.com/108772866/198755644-fc47a5e5-ae01-42bf-965a-d39e418b9acf.png)


- Funcionalidades presentes:
  - Navegação da tela Splash -> Login -> Home

  ## SPRINT II
 Objetivos Sprint II:

- Adaptar o projeto para um padrão de arquitetura;
- Implementar gerenciamento de estados;
- O projeto deve ser estruturado de acordo com a arquitetura definida; 
- O app deve apresentar comportamento de alteração de estados ao realizar navegações e ações no uso de funcionalidades.

### Desenvolvimento Sprint II

O padrão de arquitetura implementado no app foi o Model View Controller Repository (MVCR) e por isso, a estruturação de arquivos e pastas foram organizadas considerando as Boas Práticas do sistema MVCR. A divisão por Features também foi adotada para compor a estruturação do aplicativo Porkin.io.

O projeto também implementou o gerenciador de estados Change Notifier. Dessa maneira, os campos de preenchimento presentes nas telas de Login, Cadastro e Recuperação de Senhas foram todos validados aplicando os recursos do Change Notifier.

Em relação à Home Page, foi trabalhado durante a Sprint II a funcionalidade de Carteira Virtual que permite a realização do CRUD de cadastro de transações financeiras pelo Usuário. A Figura abaixo exemplifica o CRUD em funcionamento. 


![HomePage](https://user-images.githubusercontent.com/108772866/206205216-56242830-2c72-42ed-9933-4f82757863bb.png)


Em resumo, as funcionalidades disponíveis com a finalização da Sprint II são:
- Validação de dados para as telas Login, Cadastro e recuperação de senha;
- Navegação para a tela Home;
- CRUD na carteira virtual da Home Page.

![Fluxograma telas](https://user-images.githubusercontent.com/108772866/206206037-60110ad8-5982-4373-b76a-949440993bf8.png)


Novas funcionalidades virão nas próximas Sprints!





