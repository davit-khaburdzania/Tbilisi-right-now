express = require 'express' 
routes  = require './routes' 
http    = require 'http' 
path    = require 'path' 
app     = express();

app.configure ->
  app.set   'views',       __dirname + '/views'
  app.set   'view engine', 'jade'

  app.use   express.favicon()
  app.use   express.logger 'dev'
  app.use   express.bodyParser()
  app.use   express.methodOverride()
  app.use   app.router
  app.use   express.static path.join __dirname, 'public'


app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index
app.get '/:tag', routes.index

http.createServer(app).listen 8080
