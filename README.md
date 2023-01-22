# **Porkin.io app**
O Porkin.io virtual do planejamento financeiro.
PIT01GP03
Programa intregador turma 01 grupo 03.
## Descrição geral
O desenvolvimento do aplicativo em questão faz parte do Projeto Integrador do curso "Desenvolvimento Mobile em Flutter" oferecido Proz Educação.
O projeto deve ser organizado em quatro Sprints e o tema a ser trabalhado deve estar associado à Finanças.
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

Autores do projeto:
- Beatriz Pereira de Sousa Lima
- Charleston Ribeiro
- Paulo Vinicius Amorim

Etapas concluídas:
- [x] Sprint I
- [X] Sprint II
- [X] Sprint III
- [X] Sprint IV


## SPRINT I
Objetivos Sprint I:

- Desenvolver protótipo/wireframe da Sprint I; 
- Programar em Flutter o protótipo;
- O projeto deve conter componentes reutilizáveis; 
- O projeto deve seguir as convenções da linguagem e boas praticas;
- O projeto deve apresentar os componentes e funcinalidades definidas pelas regras de negócio.

Todos os objetivos da Sprint I foram cumpridos.

Recursos utilizados:
- Editor gráfico Figma;
- Editor grádico Adobe XD;

- Funcionalidades presentes:
  - Navegação da tela Splash -> Login -> Home

 ## SPRINT II
 Objetivos Sprint II:

- Adaptar o projeto para um padrão de arquitetura;
- Implementar gerenciamento de estados;
- O projeto deve ser estruturado de acordo com a arquitetura definida; 
- O app deve apresentar comportamento de alteração de estados ao realizar navegações e ações no uso de funcionalidades.

Todos os objetivos da Sprint III foram cumpridos.

### Desenvolvimento Sprint II

O padrão de arquitetura implementado no app foi o Model View Controller Repository (MVCR) e por isso, a estruturação de arquivos e pastas foram organizadas considerando as Boas Práticas do sistema MVCR. A divisão por Features também foi adotada para compor a estruturação do aplicativo Porkin.io.

O projeto também implementou o gerenciador de estados Change Notifier. Dessa maneira, os campos de preenchimento presentes nas telas de Login, Cadastro e Recuperação de Senhas foram todos validados aplicando os recursos do Change Notifier.

Em relação à Home Page, foi trabalhado durante a Sprint II a funcionalidade de Carteira Virtual que permite a realização do CRUD de cadastro de transações financeiras pelo Usuário. 

As funcionalidades disponíveis com a finalização da Sprint II foram:
- Validação de dados para as telas Login, Cadastro e Recuperação de senha;
- Navegação para a tela Home;
- CRUD na carteira virtual da Home Page.

## SPRINT III
 Objetivo Sprint III:

- Configurar a conta que será utilizada para integração com Firebase.
O objetivo da Sprint III foi cumprido com sucesso.

### Desenvolvimento Sprint III

As telas Sign Up, Sign In e Password Recovery foram integradas com o serviço Authentication do Firebase. A carteira virtual presente na Tela Home também foi integrada com sucesso no Firebase. Neste caso, o serviço utilizado foi o FireStore Database. 
Com a integração ao Firebase, o usuário poderá realizar o cadastro, login no app, recuperação de senha e também registrar as suas transações financeiras de forma eficiente e segura.

Em resumo, as funcionalidades adicionais disponiveis com a finalização da Sprint III foram:
- Telas Sign Up, Sign In e Recuperação de senha integradas ao banco do dados Authentication do Firebase;
- Tela Home integrada ao banco de dados Firestore do Firebase.

## SPRINT IV
 Objetivo Sprint IV:
 
 - Realizar testes unitários e de widgets;
 - O projeto deve conter no mínimo 10% de cobertura de testes.

### Desenvolvimento Sprint IV

O projeto ao final da Sprint alcançou uma cobertura de 12.5% de testes, desta forma, o objetivo da Sprint foi realizado com sucesso. Além da implementação de testes, também foi desenvolvida a funcionalidade chamada Porkin.ios, essa funcionalidade permite ao usuário cadastrar diversos "cofrinhos" que lhes ajudarão no alcance das metas financeiras pessoais. Durante a ultima Sprint, o design geral do app Porkin.io foi atualizado. 

Funcionalidades adicionais obtidas na Sprint IV:
- Testes unitários;
- Porkio.ios.

#### Telas Sprint IV - Final

![autenticacao](https://user-images.githubusercontent.com/108772866/213932318-9d4fb739-edb7-4fc8-afaf-6236fdf4533f.jpeg)


![home](https://user-images.githubusercontent.com/108772866/213933062-eb4b51dd-2c64-489d-a462-3cb376602f5e.jpeg)







Por, Beatriz, Charleston e Paulo.


