defmodule AmnesiaApiWeb.UserView do
  use AmnesiaApiWeb, :view
  alias AmnesiaApiWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("sign_in.json", %{user: user, jwt: jwt, exp: exp}) do
    %{"user_id" => user.id, "jwt" => jwt, "exp" => exp}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      surname: user.surname,
      email: user.email,      
      }
  end


end
