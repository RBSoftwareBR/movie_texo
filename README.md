# Golden Raspberry Awards Data App

## Descrição

Este projeto é uma aplicação Flutter que fornece informações sobre os Golden Raspberry Awards, um evento anual que premia os piores filmes do ano. A aplicação consulta uma API para obter dados sobre filmes, estúdios, produtores e anos com múltiplos vencedores.

## Funcionalidades

- Listagem de filmes, incluindo vencedores e indicados.
- Exibição de estúdios com o maior número de vitórias.
- Informações sobre produtores com os maiores e menores intervalos entre vitórias.
- Anos que tiveram mais de um filme vencedor.

# Golden Raspberry Awards

Aplicação Flutter para exibir informações sobre os Golden Raspberry Awards.

## Relatório de Cobertura

O relatório de cobertura do código pode ser encontrado aqui: [Coverage Report](https://golden-raspberry-awards.web.app/coverage/)

## Versão Web para Testes

Uma versão web para testes está disponível em: [Golden Raspberry Awards Web App](https://golden-raspberry-awards.web.app/)

## Versão Android para Testes

Uma versão web para testes está disponível em: [app-release.apk](https://github.com/RBSoftwareBR/movie_texo/releases/download/1.0.0/app-release.apk)

## Imagens das Telas (Golden Images)

Aqui estão algumas imagens das telas principais da aplicação:

### Dashboard Page

![Dashboard Page](https://golden-raspberry-awards.web.app/goldens/dashboard_page_default.png)

### Movie List Page

![Movie List Page](https://golden-raspberry-awards.web.app/goldens/movie_list_page.png)

## Arquitetura

O projeto segue a arquitetura de domínio limpo (Clean Architecture), organizada da seguinte maneira:

- **Domain**: Contém as entidades do negócio, use cases e a interface do repositório.
- **Data**: Implementação dos repositórios e fontes de dados (API, banco de dados local, etc.).
- **Presentation**: UI e lógica de apresentação, utilizando o padrão de design bloc.

## Configuração do Projeto

1. Clone o repositório para sua máquina local.
2. Abra o projeto em seu ambiente de desenvolvimento Flutter.
3. Instale todas as dependências executando `flutter pub get`.
4. (Opcional) Gere os arquivos de mock para testes com `flutter pub run build_runner build`.

## Executando os Testes

Para executar os testes unitários, use o seguinte comando:

```bash
flutter test
```

Claro, aqui está a seção solicitada para adicionar ao seu `README.md`:

---

## Executando a Aplicação no Flutter

Para executar a aplicação no Flutter, siga os seguintes passos:

### Pré-requisitos
- Certifique-se de ter o [Flutter](https://flutter.dev/) instalado em sua máquina.
- Um emulador ou dispositivo físico para executar a aplicação.

### Passos para Execução

1. **Clone o Repositório**:
   Clone o repositório da aplicação para a sua máquina local usando:
   ```bash
   git clone <URL_DO_REPOSITORIO>
   ```
   Substitua `<URL_DO_REPOSITORIO>` pelo URL do seu repositório.

2. **Instale as Dependências**:
   Navegue até o diretório do projeto e execute o seguinte comando para instalar as dependências necessárias:
   ```bash
   flutter pub get
   ```

3. **Defina a Variável de Ambiente `API_BASE_PATH`**:
   Para executar a aplicação, você precisa definir o caminho base da API. Use a flag `--dart-define` para isso. Execute o comando:
   ```bash
   flutter run --dart-define=API_BASE_PATH="SEU_CAMINHO_DA_API"
   ```
   Substitua `SEU_CAMINHO_DA_API` pelo caminho da sua API.

4. **Execute a Aplicação**:
   A aplicação será iniciada no seu emulador ou dispositivo. Agora você pode interagir com a aplicação Flutter.

## Contribuição

Sinta-se à vontade para contribuir com o projeto. Antes de fazer um pull request, certifique-se de escrever testes para as novas funcionalidades ou correções.

## Estrutura de Diretórios

O projeto está organizado da seguinte maneira:

- `lib/domain`: Contém as entidades, use cases e interfaces de repositório.
- `lib/data`: Implementações dos repositórios, fontes de dados e modelos de dados.
- `lib/presentation`: Widgets, telas e lógica de apresentação.
- `test`: Testes unitários e de integração.

## Dependências

Lista de principais dependências usadas no projeto:

- `flutter_bloc`: Gerenciamento de estado e lógica de negócios.
- `dartz`: Trabalho com Either para lidar com falhas e sucessos de maneira funcional.
- `mockito`: Criação de mock objects para testes.
- `http`: Realizar chamadas de API.

## Versão

Este documento refere-se à versão 1.0.0 do projeto.

## Autores

- [Renato Augusto Bosa Filho] - *Desenvolvedor Inicial* - [renatobosa92@gmail.com]

## Como Contribuir

1. **Fork o Projeto**: Faça um fork do repositório e clone-o para o seu ambiente de desenvolvimento local.
2. **Crie uma Branch**: Para novas funcionalidades ou correções, crie uma branch baseada na branch `main`.
3. **Faça suas Alterações**: Implemente suas alterações, adicione testes e documente qualquer mudança no `README.md`, se necessário.
4. **Execute os Testes**: Certifique-se de que todos os testes estão passando.
5. **Envie um Pull Request**: Envie um pull request para a branch `main`. Inclua uma descrição detalhada das mudanças e por que elas são necessárias.
