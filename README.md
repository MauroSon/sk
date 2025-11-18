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

## License

This project is available for use under the terms specified by the project owner.

TESTE
