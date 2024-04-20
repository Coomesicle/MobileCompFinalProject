from flask import Flask, request, jsonify
from flask_cors import CORS
import json
import os

distance = {"distance" : 0}
percent = {"percent" : 0}
status = {"status" : False}
app = Flask(__name__)

CORS(app)

def load_json_data(file_name):
    file_path = os.path.join(os.path.dirname(__file__), '..', file_name)
    with open(file_path, 'r') as file:
        data = json.load(file)
    return data

# Route for Identity_Entity
@app.route("/atlas/getIdentity_Entity", methods=["GET"])
def get_identity_entity():
    data = load_json_data('Identity_Entity.json')
    return jsonify(data)

# Route for Identity_Language
@app.route("/atlas/getIdentity_Language", methods=["GET"])
def get_identity_language():
    data = load_json_data('Identity_Language.json')
    return jsonify(data)

# Route for Identity_Thing
@app.route("/atlas/getIdentity_Thing", methods=["GET"])
def get_identity_thing():
    data = load_json_data('Identity_Thing.json')
    return jsonify(data)

# Route for Relationship
@app.route("/atlas/getRelationship", methods=["GET"])
def get_relationship():
    data = load_json_data('Relationship.json')
    return jsonify(data)

# Route for Service
@app.route("/atlas/getService", methods=["GET"])
def get_service():
    data = load_json_data('Service.json')
    return jsonify(data)



# GET /garbotron
@app.route("/garbotron", methods=["GET"])
def get_garbotron():
    with open('garbotron.json', 'r') as file:
        garbotron_data = json.load(file)
    return jsonify(garbotron_data)



# GET, PUT /garbotron/distance
@app.route("/garbotron/distance", methods=["GET", "PUT"])
def get_distance():
    if request.method == "PUT":
        new_data = request.get_json()
        if "distance" in new_data:
            var = new_data['distance']
            distance['distance'] = var[0:5]
            return jsonify({"message": "Updated distance"}), 200
        return jsonify({"error": "Invalid data, use \"distance\" as key"}), 400
    if request.method == "GET":
        return jsonify(distance)
    return jsonify({"error": "Invalid request"}), 400


# GET, PUT /garbotron/percent
@app.route("/garbotron/percent", methods=["GET", "PUT"])
def get_percent():
    if request.method == "PUT":
        new_data = request.get_json()
        if "percent" in new_data:
            var = new_data['percent']
            percent['percent'] = var[0:4]
            return jsonify({"message": "Updated percent"}), 200
        return jsonify({"error": "Invalid data, use \"percent\" as key"}), 400
    if request.method == "GET":
        return jsonify(percent)
    return jsonify({"error": "Invalid request"}), 400

@app.route("/garbotron/status", methods=["PUT", "GET"])
def service_status():
    if request.method == "PUT":
        new_data = request.get_json()
        if "status" in new_data:
            var = new_data['status']
            status['status'] = var
            return jsonify({"message": "Updated status"}), 200
        return jsonify({"error": "Invalid data, use \"status\" as key"}), 400
    if request.method == "GET":
        return jsonify(status)
    return jsonify({"error": "Invalid request"}), 400

    

if __name__ == "__main__":
    app.run(debug=True)

