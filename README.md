# MLB LED Scoreboard — Cloud Deployment

Runs the [MLB LED Scoreboard](https://github.com/MLB-LED-Scoreboard/mlb-led-scoreboard) in Docker with the browser emulator, accessible via WebSocket on port 8888.

## Requirements

- Docker

## Build

```bash
docker build -t mlb-scoreboard .
```

Optionally specify a branch or commit SHA to build

```bash
docker build --build-arg branch=some-branch-name -t mlb-led-scoreboard .
```

## Run

```bash
docker run -p 8888:8888 mlb-scoreboard
```

Then open your browser to `http://localhost:8888`.

## Configuration

### `config.json`

Controls scoreboard behavior — preferred teams, news ticker, standings, rotation, weather, and display settings.

**Weather:** Replace `YOUR_API_KEY_HERE` with a valid API key and set your `location`:
```json
"weather": {
  "apikey": "YOUR_API_KEY_HERE",
  "location": "Chicago,il,us"
}
```

### `emulator_config.json`

Controls the browser emulator — pixel size, FPS, quality, and the WebSocket port (default: `8888`).

## Deployment

For cloud deployment, [Fly.io](https://fly.io) is recommended for its native WebSocket support:

```bash
fly launch
fly deploy
```

## Credits

Built on top of [MLB-LED-Scoreboard](https://github.com/MLB-LED-Scoreboard/mlb-led-scoreboard).
