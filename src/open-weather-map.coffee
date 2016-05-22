# Description:
#   Get weather information using OpenWeatherMap for Hubot.
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_OPEN_WEATHER_MAP_APIKEY = required API key from http://openweathermap.org/faq#error401
#   HUBOT_OPEN_WEATHER_MAP_URL (optional)
#   HUBOT_OPEN_WEATHER_MAP_DEFAULT_CITIES (optional)
#
# Commands:
#   hubot weather         provide weather information for the default cities
#   hubot weather <city>  provide weather information for a <city>
#   hubot weather help    explain OpenWeatherMap commands
#
# Author:
#   github.com/TrevorS
#   github.com/endodino

weatherURL = process.env.HUBOT_OPEN_WEATHER_MAP_URL or 'http://api.openweathermap.org/data/2.5/weather?q='
cities     = process.env.HUBOT_OPEN_WEATHER_MAP_DEFAULT_CITIES
apiKey = process.env.HUBOT_OPEN_WEATHER_MAP_APIKEY

module.exports = (robot) ->
  robot.respond /weather help$/i, (msg) ->
    msg.send 'Usage: hubot weather or hubot weather <city>'
    msg.finish()

  robot.respond /weather (.*)/i, (msg) ->
    weatherFor(msg, msg.match[1])

  robot.respond /weather$/i, (msg) ->
    if cities
      for city in cities.split(/\s*;\s*/)
        weatherFor(msg, city)

  weatherFor = (msg, input) ->
    robot.http(weatherURL + input + "&appid=" + apiKey)
      .get() (err, res, body) ->
        json = JSON.parse body
        msg.send "It is currently #{kelvinToFahrenheit json.main.temp}°F in #{json.name}."

  kelvinToFahrenheit = (temp) ->
    ((temp - 273.15) * 1.8 + 32).toPrecision(4)
