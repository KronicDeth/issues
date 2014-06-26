defmodule Issues.GithubIssues do
  alias HTTPotion.Response

  @user_agent [ "User-agent": "Elixir Kronic.Deth@gmail.com" ]

  def fetch(user, project) do
    case HTTPotion.get(issues_url(user, project), @user_agent) do
      %Response{ body: body, status_code: status }
      when status in 200..299 ->
        { :ok, body }
      %Response{ body: body } ->
        { :error, body }
    end
  end

  def issues_url(user, project) do
    "https://api.github.com/repos/#{user}/#{project}/issues"
  end
end
