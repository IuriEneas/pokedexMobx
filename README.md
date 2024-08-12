# Pokedex-Mobx

## Descrição

Este projeto visa implementar a REST API pokedex, permitindo a exibição e interação com informações de Pokémons. A Pokedex-Mobx é uma aplicação informativa que não possui qualquer vínculo com a marca POKEMON.

## Motivação

A ideia por trás deste projeto é criar uma pokedex informativa que possa ser usada por fãs para visualizar e salvar dados de Pokémons.

## Recursos Principais

- **Resgatar Dados**: A aplicação consome a API REST da Pokedex para exibir dados dos Pokémons.
- **Mostrar na Tela**: As informações dos Pokémons são exibidas em uma interface intuitiva.
- **Exibir Nível de Bateria**: Ao tocar na lente da pokedex, o nível de bateria do dispositivo é exibido.
- **Salvar Pokémon Favorito**: Ao clicar no ícone de um Pokémon, ele é salvo como favorito. A tela de favoritos pode ser acessada no canto superior direito.

## Tecnologias Utilizadas

- **Dart Flutter**
- Pacotes utilizados:
  - `retrofit: ^4.1.0`
  - `intl: ^0.19.0`
  - `get_it: ^7.7.0`
  - `dio: ^5.5.0+1`
  - `equatable: ^2.0.5`
  - `mobx: ^2.3.3+2`
  - `flutter_mobx: ^2.2.1+1`
  - `shared_preferences: ^2.3.1`
  - `carousel_slider: ^5.0.0`
  - `fluttertoast: ^8.2.5`

## Instalação

Para rodar o projeto, siga os passos abaixo:

1. Clone o repositório:
   ```bash
   git clone https://github.com/IuriEneas/pokedexMobx.git

2. Navegue até o diretório do projeto:cd pokedexMobx
   ```bash
   cd pokedexMobx

4. Instale as dependências:
   ```bash
   flutter pub get

5. Gere o código necessário para desenvolvimento e testes:
   ```bash
   flutter pub run build_runner watch

