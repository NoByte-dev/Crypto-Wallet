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
  - Dropdown
- Hotwired/Turbo-rails

## Setup

Para iniciar o projeto deve-se executar task de configuração:
>```bash
>rails dev:setup
>```
> Faz todas as configurações necessárias pra iniciar aplicação em ambiente de desenvolvimento.
Caso seja necessário também existem tasks com fins mais especificos, entre tanto elas são opcionais se o comando acima foi usado.

Caso seja necessário também existem tasks com fins mais especificos, entre tanto elas são opcionais se o comando acima foi usado.
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

- [x] Responsividade as views de News, Edit e Show;
- [ ] Estilizar botões da página principal que levam para index de Moedas e Tipos de moedas;
- [ ] Organização arquivo de configuração I18n;
- [ ] Tradução de models via I18n;
- [ ] Implementar gem **Devise**
- [ ] **Active Store** para lidar com imagens;
- [x] Implementar logo tipo na navbar;
- [ ] Implementar paginação nas tabelas;
- [ ] Implementar [Breadcrumbs](https://i.imgur.com/lFfYWpg.png) de navegação;