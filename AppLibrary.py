import requests

class AppLibrary:
    def __init__(self):
        self._base_url = "http://localhost:5000"
        #self.reset_application()

    def reset_application(self):
        print("Resetting application")
        requests.get(f"{self._base_url}/reset_db")