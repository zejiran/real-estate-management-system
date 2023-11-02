from flask import Flask
from src.api_handler import get_countries, get_regions

app = Flask(__name__)

app.add_url_rule('/countries', view_func=get_countries, methods=['GET'])
app.add_url_rule('/regions', view_func=get_regions, methods=['GET'])

if __name__ == '__main__':
    app.run(debug=True)
