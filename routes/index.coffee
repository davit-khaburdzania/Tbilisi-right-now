
exports.index = (req, res) ->
  Instagram = require 'instagram-node-lib' 
  Instagram.set 'client_id', '0638f01d186241d39ac3c6401c5bddc1' 
  Instagram.set 'client_secret', 'c95484f87da145c2b72e116d8964ec64' 

  Instagram.tags.recent
    name: 'tbilisi'
    complete: (data, pagination) ->
      res.render 'index',   title: 'Tbilisi right now', data : data 
 
