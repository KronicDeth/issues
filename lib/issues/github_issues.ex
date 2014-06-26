defmodule Issues.GithubIssues do
  alias HTTPotion.Response

  @user_agent [ "User-agent": "Elixir Kronic.Deth@gmail.com" ]

  def fetch(user, project) do
    response = HTTPotion.get(issues_url(user, project), @user_agent)

    flag = if Response.success? response do
      :ok
    else
      :error
    end

    { flag, response.body }  
  end

  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end
end
