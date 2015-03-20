# This file is part of the ReFiManager package.
# (c) Ondřej Záruba <zarubaondra@gmail.com>
#
# For the full copyright and license information, please view
# the license.md file that was distributed with this source code.

Configurator = require "../Configurator"

class UrlFactory

  getUrl: (type, id) ->
    baseUrl = @getBaseUrl()
    url = "#{baseUrl}/#{type}"
    if id?
      url = "#{url}/#{id}"

    return url

  addQueries: (url, queries) ->
    _queries = []
    for name, value of queries
      _queries.push "#{name}=#{value}"
    if _queries.length
      queriesString = queries.join "&"
      url = "#{url}?#{queriesString}"
    return url


  getBaseUrl: () ->
    return Configurator.getBaseUrl()

module.exports = new UrlFactory()