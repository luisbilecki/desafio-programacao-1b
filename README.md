# Painel de Vendas

Esse sistema é resultante da avaliação de um processo seletivo de uma empresa de tecnologia. É responsável por processar um arquivo de texto contendo dados de venda e salvá-los em um banco de dados.

--------------

## Dependências do projeto

* Ruby 2.3
* Rails 4.2.5
* SQLite

--------------
## Como rodar?

1.Faça o clone desse projeto para sua máquina
```
git clone https://github.com/luisbilecki/desafio-programacao-1b.git
```
2.Vá até o diretório do projeto
```
cd desafio-programacao-1b
```
3.Utilizando o bundle instale as *gems* necessárias
```
bundle
```
ou
```
bundle install
```
4.Crie o banco de dados
```
rake db:drop db:create
```
5.Faça as migrações no banco de dados
```
rake db:migrate
```
6.Suba o servidor
```
rails s -b 0.0.0.0 -p 3000
```
7.Acesse o projeto em seu navegador através da URL
```
http://localhost:3000
```
