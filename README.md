# Crypto Wallet / [[Click para ver]](/images.md)

Esté um projeto feito para fins didáticos onde foram concretizados conhecimentos em:
- Framework Ruby on Rails;
- Banco de dados Sqlite3;
- Algoritmos Ruby;
- HTML5;
  - Tags semânticas.
- Tailwind CSS;
  - Responssividade.
  - Tema de cores e fontes peronalizáveis.
- Stimulus Components
  - Notifications
- Hotwired/Turbo-rails
- Active Storage

## Setup

Para iniciar o projeto deve-se executar task de configuração:
>```bash
>rails dev:setup
>```
> Faz todas as configurações necessárias pra iniciar aplicação em ambiente de desenvolvimento.

Caso seja necessário também existem tasks com fins mais especificos, entretanto elas são opcionais se o comando acima foi usado.
>```bash
>rails dev:seed_types
>```
> Popula dados de **Tipos de mineração** no banco

>```bash
>rails dev:seed_coins
>```
> Popula dados de **Moedas** no banco

Por fim o projeto pode ser iniciado usando:
>```bash
>bin/dev
>```

## TODO

- [ ] Implementar [Breadcrumbs](https://i.imgur.com/lFfYWpg.png) de navegação;