defmodule Blog.Factories.Users do
  defmacro __using__(_opts) do
    alias Blog.Accounts.User

    quote do
      def user_factory do
        %User{
          email: sequence(:email, &"user#{&1}@example.com"),
          password: "hello world!",
          hashed_password: Bcrypt.hash_pwd_salt("hello world!")
        }
      end
    end
  end
end
