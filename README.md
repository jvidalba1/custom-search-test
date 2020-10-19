# README

### Steps for setting project

1. Clone repository
2. `bundle install` over main directory
3. Set env variables in `.env` file in the main folder

```
GOOGLE_API_URL=
GOOGLE_API_KEY=
GOOGLE_API_CX=
BING_API_URL=
BING_API_KEY=
```

4. Run server: `bundle exec rails server`

### Making requests

```
GET /search
Body:
{
  "search": {
    "engine": "<google, bing or both>",
    "text": "text for searching"
  }
}
```

### Unit tests

Run in the console over the main directory `rspec`

### To Improve

- Unit Tests
- Cache strategy
- Background jobs
