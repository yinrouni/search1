defmodule Search1Web.PhaseHighestView do
  use Search1Web, :view
  alias Search1Web.PhaseHighestView

  def render("index.json", %{phasehighsts: phasehighsts}) do
    %{data: render_many(phasehighsts, PhaseHighestView, "phase_highest.json")}
  end

  def render("show.json", %{phase_highest: phase_highest}) do
    %{data: render_one(phase_highest, PhaseHighestView, "phase_highest.json")}
  end

  def render("phase_highest.json", %{phase_highest: phase_highest}) do
    %{id: phase_highest.id,
      sort: phase_highest.sort,
      status: phase_highest.status}
  end
end
