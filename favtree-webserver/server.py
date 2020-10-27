import os
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/tree')
def favTree():
    return jsonify(myFavouriteTree='Banyan Tree') 

if __name__ == '__main__':
    PORT=os.environ.get('HTTP_PORT', 8080)
    app.run(host='0.0.0.0',port=PORT)    