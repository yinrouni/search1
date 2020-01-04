defmodule Search1Web.PhaseHighestController do
  use Search1Web, :controller

  alias Search1.Developments
  alias Search1.Developments.PhaseHighest

  action_fallback Search1Web.FallbackController

  def index(conn, _params) do
    phasehighsts = Developments.list_phasehighsts()
    render(conn, "index.json", phasehighsts: phasehighsts)
  end

  def create(conn, %{"phase_highest" => phase_highest_params}) do
    with {:ok, %PhaseHighest{} = phase_highest} <- Developments.create_phase_highest(phase_highest_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.phase_highest_path(conn, :show, phase_highest))
      |> render("show.json", phase_highest: phase_highest)
    end
  end

  def show(conn, %{"id" => id}) do
    phase_highest = Developments.get_phase_highest!(id)
    render(conn, "show.json", phase_highest: phase_highest)
  end

  def update(conn, %{"id" => id, "phase_highest" => phase_highest_params}) do
    phase_highest = Developments.get_phase_highest!(id)

    with {:ok, %PhaseHighest{} = phase_highest} <- Developments.update_phase_highest(phase_highest, phase_highest_params) do
      render(conn, "show.json", phase_highest: phase_highest)
    end
  end

  def delete(conn, %{"id" => id}) do
    phase_highest = Developments.get_phase_highest!(id)

    with {:ok, %PhaseHighest{}} <- Developments.delete_phase_highest(phase_highest) do
      send_resp(conn, :no_content, "")
    end
  end
end
