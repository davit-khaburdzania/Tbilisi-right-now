request   = require 'request' 
Instagram = require 'instagram-node-lib' 

Instagram.set 'client_id', '0638f01d186241d39ac3c6401c5bddc1' 
Instagram.set 'client_secret', 'c95484f87da145c2b72e116d8964ec64'

Instagram.getImagesByTag = (tag, callback)->
  Instagram.tags.recent
    name: tag
    complete: (data, pagination) ->
      link = pagination.next_url
      request link, (error, response, body) ->
        if not error and response.statusCode is 200
          last = JSON.parse(body).data
          data = data.concat last
          callback data
        else
          callback null

exports.index = (req, res) ->
  data = Instagram.getImagesByTag 'tbilisi', (data) ->
   res.render 'index',   title: 'Tbilisi right now', data : data 
  
      