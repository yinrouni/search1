defmodule Search1.Developments do
  @moduledoc """
  The Developments context.
  """

  import Ecto.Query, warn: false
  alias Search1.Repo

  alias Search1.Developments.Development

  @doc """
  Returns the list of developments.

  ## Examples

      iex> list_developments()
      [%Development{}, ...]

  """
  def list_developments do
    Repo.all(Development)
  end

  @doc """
  Gets a single development.

  Raises `Ecto.NoResultsError` if the Development does not exist.

  ## Examples

      iex> get_development!(123)
      %Development{}

      iex> get_development!(456)
      ** (Ecto.NoResultsError)

  """
  def get_development!(id), do: Repo.get!(Development, id)

  @doc """
  Creates a development.

  ## Examples

      iex> create_development(%{field: value})
      {:ok, %Development{}}

      iex> create_development(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_development(attrs \\ %{}) do
    %Development{}
    |> Development.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a development.

  ## Examples

      iex> update_development(development, %{field: new_value})
      {:ok, %Development{}}

      iex> update_development(development, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_development(%Development{} = development, attrs) do
    development
    |> Development.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Development.

  ## Examples

      iex> delete_development(development)
      {:ok, %Development{}}

      iex> delete_development(development)
      {:error, %Ecto.Changeset{}}

  """
  def delete_development(%Development{} = development) do
    Repo.delete(development)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking development changes.

  ## Examples

      iex> change_development(development)
      %Ecto.Changeset{source: %Development{}}

  """
  def change_development(%Development{} = development) do
    Development.changeset(development, %{})
  end

  alias Search1.Developments.Condition

  @doc """
  Returns the list of conditions.

  ## Examples

      iex> list_conditions()
      [%Condition{}, ...]

  """
  def list_conditions do
    Repo.all(Condition)
  end

  @doc """
  Gets a single condition.

  Raises `Ecto.NoResultsError` if the Condition does not exist.

  ## Examples

      iex> get_condition!(123)
      %Condition{}

      iex> get_condition!(456)
      ** (Ecto.NoResultsError)

  """
  def get_condition!(id), do: Repo.get!(Condition, id)

  @doc """
  Creates a condition.

  ## Examples

      iex> create_condition(%{field: value})
      {:ok, %Condition{}}

      iex> create_condition(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_condition(attrs \\ %{}) do
    %Condition{}
    |> Condition.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a condition.

  ## Examples

      iex> update_condition(condition, %{field: new_value})
      {:ok, %Condition{}}

      iex> update_condition(condition, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_condition(%Condition{} = condition, attrs) do
    condition
    |> Condition.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Condition.

  ## Examples

      iex> delete_condition(condition)
      {:ok, %Condition{}}

      iex> delete_condition(condition)
      {:error, %Ecto.Changeset{}}

  """
  def delete_condition(%Condition{} = condition) do
    Repo.delete(condition)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking condition changes.

  ## Examples

      iex> change_condition(condition)
      %Ecto.Changeset{source: %Condition{}}

  """
  def change_condition(%Condition{} = condition) do
    Condition.changeset(condition, %{})
  end

  alias Search1.Developments.PhaseHighest

  @doc """
  Returns the list of phasehighsts.

  ## Examples

      iex> list_phasehighsts()
      [%PhaseHighest{}, ...]

  """
  def list_phasehighsts do
    Repo.all(PhaseHighest)
  end

  @doc """
  Gets a single phase_highest.

  Raises `Ecto.NoResultsError` if the Phase highest does not exist.

  ## Examples

      iex> get_phase_highest!(123)
      %PhaseHighest{}

      iex> get_phase_highest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_phase_highest!(id), do: Repo.get!(PhaseHighest, id)

  @doc """
  Creates a phase_highest.

  ## Examples

      iex> create_phase_highest(%{field: value})
      {:ok, %PhaseHighest{}}

      iex> create_phase_highest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_phase_highest(attrs \\ %{}) do
    %PhaseHighest{}
    |> PhaseHighest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a phase_highest.

  ## Examples

      iex> update_phase_highest(phase_highest, %{field: new_value})
      {:ok, %PhaseHighest{}}

      iex> update_phase_highest(phase_highest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_phase_highest(%PhaseHighest{} = phase_highest, attrs) do
    phase_highest
    |> PhaseHighest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PhaseHighest.

  ## Examples

      iex> delete_phase_highest(phase_highest)
      {:ok, %PhaseHighest{}}

      iex> delete_phase_highest(phase_highest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_phase_highest(%PhaseHighest{} = phase_highest) do
    Repo.delete(phase_highest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking phase_highest changes.

  ## Examples

      iex> change_phase_highest(phase_highest)
      %Ecto.Changeset{source: %PhaseHighest{}}

  """
  def change_phase_highest(%PhaseHighest{} = phase_highest) do
    PhaseHighest.changeset(phase_highest, %{})
  end
end
