import json
import os
import requests

from dotenv import load_dotenv, find_dotenv


class IqAirModule:
    URL_GEO = "http://api.airvisual.com/v2/nearest_city?key={api_key}"
    URL_GPS = (
        "http://api.airvisual.com/v2/nearest_city?lat={lat}&lon={lon}&key={api_key}"
    )

    def __init__(self):
        load_dotenv(find_dotenv())

    def get_gps_data(self):
        res = requests.get(
            self.URL_GPS.format(
                lat=os.environ.get("LAT"),
                lon=os.environ.get("LON"),
                api_key=os.environ.get("IQAIR_TOKEN"),
            )
        )

        return res.text

    def get_aqius(self, res):
        res = json.loads(res)
        aqius = int(res["data"]["current"]["pollution"]["aqius"])

        return aqius

    def run(self):
        res = self.get_gps_data()
        aqius = self.get_aqius(res)
        print(aqius)


if __name__ == "__main__":
    m = IqAirModule()
    m.run()
