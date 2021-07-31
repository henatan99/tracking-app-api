![](https://img.shields.io/badge/Microverse-blueviolet)

# Project Name

This project is a backend rails API for tracking-app which is built based on RESTfull approach. Authorized users can make various requests. 

## Models 
- User model 
- Measurement model
- Measured model
- Goal model

![screenshot](./app_screenshot.png)

Additional description about the project and its features.

## Built With

- Major languages: `Ruby`, `CSS`
- Frameworks: `Rails`
- Technologies used: `JWT`, `postgresql`

## Live Demo

[Live Demo Link](https://pure-tundra-23506.herokuapp.com/)

## Getting Started

**This is an example of how you may give instructions on setting up your project locally.**
**Modify this file to match your project, remove sections that don't apply. For example: delete the testing section if the currect project doesn't require testing.**


To get a local copy up and running follow these simple example steps.

### Prerequisites
`Ruby` | `Rails` | `postgresql`
### Setup
- git clone git@github.com:henatan99/tracking-app-api.git
- run `bundle install` 
- run `db:migrate`
- Once project is implemented 
### Install
- `bundle install`
### Usage
- User controller requests 
`GET /users`
`POST /users`
`GET /users/:id`
`PUT /users/:id`
`DELETE /users/:id`
------------------------------------------
For get requests
------------------------------------------
```
     {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      },
```
------------------------------------------
    For post requests
------------------------------------------
```
    headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      data: {
        username,
      },
```
- Measurement controller requests
`GET /measurements`
`POST /measurements`
------------------------------------------
For get requests
------------------------------------------
```
     {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      },
```
- Measureds controller requests
`GET /users/:user_id/measureds`
`POST /users/:user_id/measureds`
`GET /users/:user_id/measureds/:id`
`PUT /users/:user_id/measureds/:id`
`DELETE users/:user_id/measureds/:id`
---------------------------------------------
For get requests
---------------------------------------------
```
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      },
```
-----------------------------------------
 For post request
-----------------------------------------
```
 headers: {
        Authorization: `Bearer ${token}`,
      },
      data: {
        value,
        measurement_id: measurementId,
      },
```
- Goals controller requests
`GET /users/:user_id/goals`
`POST /users/:user_id/goals`
-----------------------------------
For get post requests
-----------------------------------
```
    data: {
        quantity,
        day_one: dayOne,
        day_last: dayLast,
        measurement_id: measurementId,
      },
      headers: {
        Authorization: `Bearer ${token}`,
      },
```
- FilterByMeasurementId controller requests
`GET /users/:user_id/filter_by_measurement_id_measureds`
- Auth controller requstes
`POST /login`
------------------------------------------------
For post requests
------------------------------------------------
```
 headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      data: {
        username,
      },
```
### Run tests
Go to the root directory and run 
`rspec`
### Deployment
To deploy to heroku 
- `bundle install`
- run migration locally: `rails db:migrate`
- `heroku create tracking-app-api`
- `git push heroku master` or `git push heroku <branch>:master`

## Authors

👤 **Henok Mossissa**

- GitHub: [@henatan99](https://github.com/henatan99)
- Twitter: [@henatan99](https://twitter.com/henatan99)
- LinkedIn: [Henok Mossissa](https://www.linkedin.com/in/henok-mekonnen-2a251613/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.