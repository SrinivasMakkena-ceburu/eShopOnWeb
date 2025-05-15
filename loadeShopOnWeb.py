import requests
import time
import random
url = "http://192.168.10.117:5000"
routes = [
    "/order/my-orders",
    "/manage/my-account",
    "/Basket",
    "/Basket/Update",
    "/?pageId=1",
    "/Basket",
    "/Basket/Checkout",
    "/Basket/Success"
]
while True:
    print("Press Ctrl+C to stop the script.")
    print("Starting requests...")
    for route in routes:
        full_url = url + route
        try:
            response = requests.get(full_url)
            if response.status_code == 200:
                print(f"Success: {full_url}")
            else:
                print(f"Failed: {full_url} - Status Code: {response.status_code}")
        except requests.exceptions.RequestException as e:
            print(f"Error: {full_url} - {e}")
        print("Sleeping for a random duration...")
        time.sleep(random.randint(1, 5))