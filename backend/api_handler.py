from difflib import SequenceMatcher
from flask import request, jsonify
import os
import requests
from dotenv import load_dotenv

load_dotenv()

API_TOKEN = os.getenv('API_TOKEN')
USER_EMAIL = os.getenv('USER_EMAIL')
BASE_URL = "https://www.universal-tutorial.com/api"


def get_auth_token():
    url = f"{BASE_URL}/getaccesstoken"
    headers = {
        "Accept": "application/json",
        "api-token": API_TOKEN,
        "user-email": USER_EMAIL
    }
    response = requests.get(url, headers=headers)
    auth_token = response.json()["auth_token"]
    return auth_token


def get_countries():
    country_name = request.args.get('name')
    countries = fetch_countries()
    filtered_countries = [country for country in countries if similarity(country_name, country['country_name']) > 0.8]
    if any(c['country_name'] == country_name for c in filtered_countries):
        regions = fetch_regions(country_name)
        return jsonify({'regions': regions})
    else:
        return jsonify(filtered_countries)


def similarity(a, b):
    return SequenceMatcher(None, a.lower(), b.lower()).ratio()


def fetch_countries():
    url = f"{BASE_URL}/countries/"
    headers = {
        "Authorization": f"Bearer {get_auth_token()}",
        "Accept": "application/json"
    }
    response = requests.get(url, headers=headers)
    return response.json()


def fetch_regions(country_name):
    url = f"{BASE_URL}/states/{country_name}"
    headers = {
        "Authorization": f"Bearer {get_auth_token()}",
        "Accept": "application/json"
    }
    response = requests.get(url, headers=headers)
    return response.json()
