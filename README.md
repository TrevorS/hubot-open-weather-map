# hubot-open-weather-map

Get weather information using OpenWeatherMap for Hubot.

## Installation

In the Hubot project repo, run:

`npm install hubot-open-weather-map --save`

Then add **hubot-open-weather-map** to your `external-scripts.json`:

```json
["hubot-open-weather-map"]
```

## Configuration

* HUBOT_OPEN_WEATHER_MAP_URL - An alternative OpenWeatherMap URL
* HUBOT_OPEN_WEATHER_MAP_DEFAULT_CITIES - A `;` delimited list of default cities.

## Sample Interaction

```
TrevorS> hubot weather Savannah, GA
hubot> It is currently 54.81°F in Savannah.

TrevorS> hubot weather
hubot> It is currently 59.36°F in Norcross.
hubot> It is currently 80.60°F in Georgetown.
hubot> It is currently 54.81°F in Savannah.
```
