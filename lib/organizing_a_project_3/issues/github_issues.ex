defmodule ElixirPractice.OrganizingAProject3.GitHubIssues do
  @user_agent "Elixir mikan@aosn.ws"
  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    issues_url(user, project)
    |> HTTPotion.get([headers: ["User-Agent": @user_agent]])
    |> handle_response
  end

  def issues_url(user, project) do
    "#{@github_url}/repos/#{user}/#{project}/issues"
  end

  def handle_response({%{status_code: 200, body: body}}) do
    {:ok, Poison.Parser.parse!(body)}
  end

  def handle_response({%{status_code: _, body: body}}) do
    {:error, Poison.Parser.parse!(body)}
  end
end
