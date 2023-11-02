# Real Estate Management System

This repository provides a robust solution for managing real estate properties. It includes a user-friendly Flutter application for property entry and listing, along with a Python service to ensure the accuracy and normalization of location data.

## Python Backend Service

This is the backend component of the Real Estate Management System, which includes API endpoints for handling property information and integrating with a third-party API to manage country and region data. Follow the instructions below to set up and run the backend server.

### Installation

To set up the backend environment and install the required dependencies, follow the steps below:

1. Clone the repository to your local machine.
2. Navigate to the backend directory.
3. Install dependencies using pipenv:

```bash
pipenv install
```

### Running the Server

To run the backend server, execute the following command:

```bash
pipenv run python main.py
```

The server will start on http://localhost:5000/ by default.

### Running Tests

To run the unit tests and check the test coverage, use the following command:

```bash
pipenv run coverage run --source=main,api_handler -m unittest test_api.py && pipenv run coverage report
```

This command will execute the tests and display the coverage report in the terminal.

### API Endpoints

- GET /countries?name={country_name}: Retrieves a list of countries based on a partial or exact name match.

### Environment Variables

Ensure you have the following environment variables set in a `.env` file:

```plaintext
API_TOKEN=<api_token>
USER_EMAIL=<email>
```

Make sure to replace `<api_token>` and `<email>` with your actual API token and email.

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](LICENSE)**
- Copyright 2023 © Juan Alegría
