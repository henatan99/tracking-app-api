module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  def confirm_and_login_user(user)
    get '/login', params: { user: user, jwt: token }
    post '/login', params: {username: user.username}
    return json['auth_token']
  end
end
