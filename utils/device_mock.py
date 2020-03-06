import random, http.client, time

class Device:
    def __init__(self, uuid):
        self.uuid = uuid
        self.pH = 7.0

    def measurePH(self):
        self.pH += (random.randint(-1, 1) / 10)
        if(self.pH > 10):
            self.pH == 10
        elif(self.pH < 3):
            self.pH = 3
        
        return self.pH

    def json(self):
        return "{" + f"\"device\" : \"{self.uuid}\", \"ph\" : {self.pH}" + "}"


if __name__ == "__main__":
    uuids = ["8e313a89-309a-4e31-87c4-6de8fd386439", "c81a3fc1-7834-4386-b6da-eb27c455063f", "855da0b3-1b16-4055-b480-223a71942733", "6f62cebf-3adb-4665-98cc-83357ac76f91"]
    devices = []

    sleep_time = 60 * 60 * 2 # 2hrs

    for id in uuids:
        devices.append(Device(id))

    while(True):
        headers = {"Content-type": "application/json"}
        conn = http.client.HTTPSConnection("api.eit.haavard.cloud")

        for device in devices:
            device.measurePH()
            params = device.json()
            conn.request("POST", "/v0/measurements/", params, headers)
            conn.getresponse().read()
        
        conn.close()
        time.sleep(sleep_time)

    

