defmodule AmnesiaApiWeb.UserController do
  use AmnesiaApiWeb, :controller
  require Logger
  alias AmnesiaApi.Accounts
  alias AmnesiaApi.Accounts.User


  action_fallback AmnesiaApiWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do

    passwd_hash = Pbkdf2.hash_pwd_salt(user_params["password"])

    user = Map.put(user_params, "password_hash", passwd_hash)

    create_user_result = Accounts.create_user(user)
    Logger.debug "create user result: #{inspect create_user_result}"
    with {:ok, %User{} = user} <- create_user_result do
      new_conn = Guardian.Plug.api_sign_in(conn, user)
        jwt = Guardian.Plug.current_token(new_conn)
        {:ok, claims} = Guardian.Plug.claims(new_conn)
        exp = Map.get(claims, "exp")
        conn
           |>  put_resp_header("authorization", "Bearer #{jwt}")
           |>  put_resp_header("x-expires", Integer.to_string(exp))
           |>  render "sign_in.json", user: user, jwt: jwt, exp: exp
    end
  end

  def login(conn, %{"user" => %{"email" => email, "password" => password}}) do
    user = AmnesiaApi.Repo.get_by(User, email: email)
    auth_success = Pbkdf2.verify_pass(password, user.password_hash)
    if auth_success do
      new_conn = Guardian.Plug.api_sign_in(conn, user)
      jwt = Guardian.Plug.current_token(new_conn)
      {:ok, claims} = Guardian.Plug.claims(new_conn)
      exp = Map.get(claims, "exp")

      new_conn
      |> put_resp_header("authorization", "Bearer #{jwt}")
      |> put_resp_header("x-expires", Integer.to_string(exp))
      |> render("sign_in.json", user: user, jwt: jwt, exp: exp)
    else
      conn
          |> send_resp(401, "Could not authenticate with email/password")
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
