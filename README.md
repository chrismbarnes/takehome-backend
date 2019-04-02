# Introduction

This project is a take-home challenge designed to evaluate backend developers who are interested in working at Dovetale.

The goal of this project is to build an application that supports creating and organizing lists of contacts through an API. The desired functionality of the application can be broken down as follows: 
- A user may create a "contact" which represents an individual that the user would like to store personal information on
- A user may create a "list" of contacts which provides a way for them to organize groups of contacts
- Within a list, a user may store "metadata" for each contact

To start, there is a Rails application that currently has two endpoints: `POST /users` and `POST /authenticate`.

The `POST /users` endpoint allows you to create new users by passing a username and password in the body of the request:

```
POST /users
params: username, password
response: 200
```

The `POST /authenticate` endpoint will return a JSON Web Token (JWT) when given a correct username and password combination:

```
POST /authenticate
params: username, password
response: 200
```


To complete this challenge, there are exercises that involve:
- adding token based user authentication to protect any new endpoints
- creating and implementing new endpoints to support the desired functionality
- updating the database schema and adding new models to support the new endpoints

**Please read the instructions carefully when completing the exercises below**. If you get stuck or anything is unclear, please feel free to reach out to us.

# Getting Started

1. Clone this repository to your local machine
2. Run `bundle install` in the project directory
3. Migrate the database using `rake db:migrate`
4. Run the Rails server using `rails s`


# Exercises

1. Create a User record by sending a POST request to `http://localhost:3000/users` with a username and password in the body

2. Send a POST request to the `/authenticate` endpoint to retrieve a JSON Web Token for all future requests.

    The JWT should be passed along in every request using the `Authorization` header with the Bearer authentication scheme:

    ```
    Authorization: Bearer <token>
    ```

3. We don't want users to be able to see each others information, so all of the endpoints you implement should be protected. There is an unimplemented `before_action` in `ApplicationController` called `authorize_request` that should be implemented to handle user authentication.

    Update `authorize_request` so that it:
    - decode the JSON Web Token found in the Authorization header (hint: use the JWT gem)
    - sets a variable `@current_user` to the correct User based on the user_id found in the token 
    - if no token or an incorrect token is passed, the API should return an `HTTP 401 Unauthorized` response

4. Create endpoints that allow a user to create and update contacts. You'll need to update the database in order to do this, so consider the types of fields that someone might want to store for a contact (email, phone number, etc).

5. Create endpoints that allow a user to create a list, add contacts to a list, and update metadata for a contact within a list.

    Example of how a user may use these endpoints:
    - The user creates a list called Prospects
    - The user adds an existing contact to this list
    - The user creates a metadata field called status which only exists within the Prospects list
    - The user updates the metadata for a contact in the Prospects list, updating the status field to "emailed"

6. Create an endpoint that allows a user to retrieve a list and all of the contacts within it. The response should return any metadata fields associated with the contacts in the list.

    For example, if a contact is stored in the Prospects list with a status metadata field, the status should be returned along with the email, phone number and whatever other information has been stored on the contact record.


# Submission

Please submit the updated repository containing the completed exercises as a single zip file.