from flask import Flask, request, render_template
from application import app
import random
import requests
from os import getenv

@app.route('/', methods=['GET'])
def get_users():
    response = requests.get(getenv('BACKEND_URL')).json()
    return render_template('index.html', title='Home', response=response)
