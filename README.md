# SK (Kanbino)

A Rails application built with modern web technologies.

## Tech Stack

- Ruby 3.4.1
- Rails 8.0.2
- SQLite3
- Hotwire (Turbo Rails + Stimulus)
- Puma web server

## Prerequisites

- Ruby 3.4.1
- SQLite3
- Docker (optional, for containerized deployment)

## Installation

### Local Setup

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Setup database:
   ```bash
   rails db:create
   rails db:migrate
   ```

3. Start server:
   ```bash
   rails server
   ```

The application will be available at `http://localhost:3000`

### Docker Setup

Build and run with Docker:
```bash
docker build -t sk .
docker run -p 3000:3000 sk
```

## Development

### Running Tests

```bash
rails test
rails test:system
```

### Code Quality

- **Brakeman** - Security analysis
- **RuboCop** - Code style and linting

Run code quality checks:
```bash
bundle exec brakeman
bundle exec rubocop
```

## Deployment

This application supports deployment with:
- **Kamal** - Container deployment tool
- **Thruster** - HTTP/2 proxy for asset caching

Deploy with Kamal:
```bash
kamal deploy
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Receitas

### Misto Quente

Classic Brazilian grilled ham and cheese sandwich.

**Ingredientes:**
- 2 fatias de pão de forma
- 2 fatias de queijo (mussarela ou prato)
- 2 fatias de presunto
- Manteiga

**Modo de Preparo:**
1. Passe manteiga nas fatias de pão
2. Coloque o queijo e o presunto entre as fatias
3. Grelhe em uma sanduicheira ou frigideira até dourar
4. Sirva quente

### Bolo de Morango

Delicioso bolo caseiro de morango com cobertura cremosa, perfeito para festas e ocasiões especiais.

**Ingredientes da Massa:**
- 3 xícaras de farinha de trigo
- 2 xícaras de açúcar
- 4 ovos
- 1 xícara de leite
- 1/2 xícara de manteiga derretida
- 1 colher de sopa de fermento em pó
- 1 pitada de sal
- 1 colher de chá de essência de baunilha

**Ingredientes da Cobertura:**
- 500g de morangos frescos
- 1 lata de creme de leite
- 1 lata de leite condensado
- Morangos extras para decoração

**Modo de Preparo:**
1. Pré-aqueça o forno a 180°C e unte uma forma média
2. Misture os ingredientes secos (farinha, açúcar, sal e fermento)
3. Em outra tigela, bata os ovos com o leite, a manteiga derretida e a baunilha
4. Incorpore os ingredientes líquidos aos secos até obter uma massa homogênea
5. Asse por 35-40 minutos ou até que um palito saia limpo
6. Deixe esfriar completamente
7. Para a cobertura, bata no liquidificador os morangos, creme de leite e leite condensado
8. Corte o bolo ao meio, recheie com metade da cobertura
9. Cubra com a segunda camada e despeje o restante da cobertura
10. Decore com morangos frescos e leve à geladeira por 2 horas

**Tempo de Preparo:** 30 minutos | **Tempo de Forno:** 40 minutos | **Rendimento:** 12-15 fatias

_Para mais detalhes, consulte [docs/bolo_de_morango.md](docs/bolo_de_morango.md)_

## License

This project is available for use under the terms specified by the project owner.