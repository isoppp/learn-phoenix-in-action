defmodule AcutionWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      AcutionWeb.Telemetry,
      # Start the Endpoint (http/https)
      AcutionWeb.Endpoint
      # Start a worker by calling: AcutionWeb.Worker.start_link(arg)
      # {AcutionWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AcutionWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AcutionWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
