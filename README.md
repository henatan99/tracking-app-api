![](https://img.shields.io/badge/Microverse-blueviolet)

# Project Name

This project is a RESTfull rails backend API for personal health tracking application. The API let's users and front-end developers fetch various data with GET, POST, UPDATE and DESTROY requests.

## Models 
Four database model classes are defined
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
- User requests from front end. Many of the requests require user_login through JWT authentication.

#### users controller requests
`GET /users`
`POST /users`
`GET /users/:id`
`PUT /users/:id`
`DELETE /users/:id`
For get requests
```
     {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      },
```
For post requests
```
    headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      data: {
        username,
      },
```
Response data for create action
```
      render json: { user: @user, jwt: token, success: "Welcome, #{@user.username}", measurements: measurements }
```
Response data for create
#### Measurement controller requests
`GET /measurements`
`POST /measurements`

For get requests
```
     {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      },
```
Response data for create action
```
    json_response(@measurement, :created)
```

#### Measureds controller requests
`GET /users/:user_id/measureds`
`POST /users/:user_id/measureds`
`GET /users/:user_id/measureds/:id`
`PUT /users/:user_id/measureds/:id`
`DELETE users/:user_id/measureds/:id`

For get requests
```
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      },
```

For post request
```
 headers: {
        Authorization: `Bearer ${token}`,
      },
      data: {
        value,
        measurement_id: measurementId,
      },
```
Response data for index action 
```
    render json: { measureds: @user.measureds, goals: @user.goals }
```

Response data for create action 
```
    if Goal.all.goals_measurement_ids(@user).include?(measured_params[:measurement_id])
      @user.measureds.create!(measured_params)
      json_response(@measured, :created)
    else
      render json: { failure: 'Goal not created!' }
    end
```

#### Goals controller requests
`GET /users/:user_id/goals`
`POST /users/:user_id/goals`

For post requests
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
Response data for create action 
``` 
    json_response(@goal, :created)
```

#### FilterByMeasurementId controller requests
`GET /users/:user_id/filter_by_measurement_id_measureds`

For get requests
```
      {
        headers: {
          Authorization: `Bearer ${token}`,
        },
      },
```
Response data for index action
```
def index
    @measureds_by_measurement = []
    @measurements.each do |measurement|
      filtered = @user.measureds.order_by_measurement_id.select do |measured|
        measurement.id == measured.measurement_id
      end
      @measureds_by_measurement.push(filtered) if filtered
    end
    # json_response(@measureds_by_measurement)
    render json: { measureds_by_measurement: @measureds_by_measurement, goals: @user.goals }
  end
```
#### Auth controller requstes
`POST /login`

For post requests
```
 headers: {
        'Content-Type': 'application/json',
        Accept: 'application/json',
      },
      data: {
        username,
      },
```

Response data
```
      render json: { user: user, jwt: token, success: "Welcome, #{user.username}", measurements: measurements }
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