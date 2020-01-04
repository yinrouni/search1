defmodule Search1Web.ConditionController do
  use Search1Web, :controller

  alias Search1.Developments
  alias Search1.Developments.Condition

  action_fallback Search1Web.FallbackController

  def index(conn, _params) do
    conditions = Developments.list_conditions()
    render(conn, "index.json", conditions: conditions)
  end

  def create(conn, %{"condition" => condition_params}) do
    with {:ok, %Condition{} = condition} <- Developments.create_condition(condition_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.condition_path(conn, :show, condition))
      |> render("show.json", condition: condition)
    end
  end

  def show(conn, %{"id" => id}) do
    condition = Developments.get_condition!(id)
    render(conn, "show.json", condition: condition)
  end

  def update(conn, %{"id" => id, "condition" => condition_params}) do
    condition = Developments.get_condition!(id)

    with {:ok, %Condition{} = condition} <- Developments.update_condition(condition, condition_params) do
      render(conn, "show.json", condition: condition)
    end
  end

  def delete(conn, %{"id" => id}) do
    condition = Developments.get_condition!(id)

    with {:ok, %Condition{}} <- Developments.delete_condition(condition) do
      send_resp(conn, :no_content, "")
    end
  end
end
