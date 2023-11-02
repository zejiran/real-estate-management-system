from flask import Flask
from api_handler import get_countries

app = Flask(__name__)

app.add_url_rule('/countries', view_func=get_countries, methods=['GET'])

if __name__ == '__main__':
    app.run(debug=True)
