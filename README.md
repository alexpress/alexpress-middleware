# alexpress-middleware
Common middleware for `alexpress`

## Installation
Install with npm

```
npm install alexpress-middleware
```

## Middleware

### persistSession

Copies session attributes from the request to the response so that they persist across calls (as long as the session stays alive).

```coffeescript
app = require('alexpress')()
{persistSession} = require 'alexpress-middleware'

app.use persistSession

# other middleware

app.run(...)
```

### validateApp(appId)

Verifies that the application identifier of the calling Alexa skill matches your skill's id (to prevent other skills from calling your handler). Throws an exception `AppIdError` if the ids do not match.

```coffeescript
app = require('alexpress')()
{validateApp} = require 'alexpress-middleware'

app.use validateApp appId

# other middleware

# trap the error 
app.use (err, req, res, next) ->
	if err.type is 'appId'
      return res.tell "Hm... your skill is not authorized."

app.run(...)
```

### ask(speech[, prompt])

### send(speech[, prompt])

### tell(speech[, prompt])

Convenience middleware to send output speech (and reprompts) to the user. `ask` keeps the session alive while `tell` closes the session.

```coffeescript
app = require('alexpress')()
{ask, send, tell} = require 'alexpress-middleware'

app.use "/intent/ask" ask "using ask"
app.use "/intent/send" send "using send"
app.use "/intent/tell" tell "using tell"

app.run(...)
```
### render(speech[, prompt])

### renderAsk(speech[, prompt])

### renderTell(speech[, prompt])

Convenience methods which render output speech (and reprompt) from the given templates.

```coffeescript
app = require('alexpress')()
{ask, send, tell} = require 'alexpress-middleware'

app.use "/intent/ask" renderAsk "askTemplate"
app.use "/intent/send" render "renderTemplate"
app.use "/intent/tell" renderTell "tellTemplate"

app.run(...)
```
