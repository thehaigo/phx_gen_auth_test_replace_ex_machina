defmodule Blog.Factory do
  use ExMachina.Ecto, repo: Blog.Repo
  use Blog.Factories.Users

  def unique_user_email, do: "user#{System.unique_integer()}@example.com"

  def extract_user_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end
end
