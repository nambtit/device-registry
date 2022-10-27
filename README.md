# Device Registry

This project is the **Device Registry Service**,
an example REST API web service for registering smart devices.
It is written in Python using Flask, and it stores data in a SQLite database.
Note that it is not a "real" web service, but rather one to use for practicing purposes.

What does the Device Registry Service do?
It stores records for all smart devices a user owns in one central place.
A home could have multiple kinds of smart devices:
WiFi routers, voice assistants, thermostats, light switches, and even appliances.
This service stores information like name, location, type, model, and serial number for each device.
Its API enables callers to practice CRUD (Create, Retrieve, Update, Delete) operations.
In theory, a dashboard or monitoring app could use a registry service like this to quickly access devices.

## Validation

Validations such as min/max-length are not implemented. However, AuthN / AuthZ, Auth token expiry, and fields mandatory are checked in the APIs.

## Installation

The Device Registry Service is designed to run on your local machine.
It should run on any operating system (Windows, macOS, Linux).
To install it:

1. Install [Python](https://www.python.org/) 3.8 or higher.
2. Clone the GitHub repository on to your local machine.
3. Install dependency packages from the command line:
   1. Change directory to the project's root directory.
   2. Run `pip install -r requirements.txt` to install all dependencies.


## Running the web service

### From your IDE

The Device Registry Service is written using [Flask](https://flask.palletsprojects.com/en/2.0.x/).
Before running it from the command line,
set the `FLASK_APP` environment variable to the name of the app's main module, `registry`.

* Windows: `set FLASK_APP=registry`
* macOS and Linux: `export FLASK_APP=registry`

To run the web service, run `flask run`.

You should see output like this from the command line:

```bash
$ flask run
 * Serving Flask app 'registry' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)
```

When running, the web service can be accessed at `http://127.0.0.1:5000/`
(the address printed by the `flask run` output).
If you load that address in a web browser, you should see docs for the REST API.

### From Docker
To build the image, navigate to the root of the project:
```bash
docker build -t device-registry .
```

To run the service and make it accessible from port 9000:
```bash
docker run -p 9000:5000 --rm device-registry
```

After the service is started, APIs are ready to be consumed. Please check [DeviceRegistry collection](DeviceRegistry.postman_collection.json) for the examples.

## Database

Out of the box, the Device Registry Service uses a [SQLite](https://www.sqlite.org/index.html) database.
SQLite is not meant to be a high-scale production database,
but it works just fine for this small example web service.

Everytime the service is launched, it creates a fresh, empty, in-memory SQLite database. Any changes will persist, until the app is restarted.

## Setting configuration options

The Device Registry Service stores all its configuration options in `config.py`.
The following configuration options have default values,
but they may optionally be overridden using environment variables:

* `AUTH_USERNAME1`: the username for user 1
* `AUTH_PASSWORD1`: the password for user 1
* `AUTH_USERNAME2`: the username for user 2
* `AUTH_PASSWORD2`: the password for user 2
* `AUTH_TOKEN_EXPIRATION`: the expiration time in seconds for authentication tokens

***Warning:*** Overriding these options is not recommended for most cases.

## Reading the REST API docs

Please check [DeviceRegistry collection](DeviceRegistry.postman_collection.json) for the examples.