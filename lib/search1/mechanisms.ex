defmodule Search1.Mechanisms do
  @moduledoc """
  The Mechanisms context.
  """

  import Ecto.Query, warn: false
  alias Search1.Repo

  alias Search1.Mechanisms.Mechanism

  @doc """
  Returns the list of mechanisms.

  ## Examples

      iex> list_mechanisms()
      [%Mechanism{}, ...]

  """
  def list_mechanisms do
    Repo.all(Mechanism)
  end

  @doc """
  Gets a single mechanism.

  Raises `Ecto.NoResultsError` if the Mechanism does not exist.

  ## Examples

      iex> get_mechanism!(123)
      %Mechanism{}

      iex> get_mechanism!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mechanism!(id) do
  query = from d in Mechanism, 
		where: d.item_id==^id,
	preload: [:item, :mechanism_drug, [drugs: :item]]
        Repo.one!(query)
  
  end

  @doc """
  Creates a mechanism.

  ## Examples

      iex> create_mechanism(%{field: value})
      {:ok, %Mechanism{}}

      iex> create_mechanism(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mechanism(attrs \\ %{}) do
    %Mechanism{}
    |> Mechanism.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mechanism.

  ## Examples

      iex> update_mechanism(mechanism, %{field: new_value})
      {:ok, %Mechanism{}}

      iex> update_mechanism(mechanism, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mechanism(%Mechanism{} = mechanism, attrs) do
    mechanism
    |> Mechanism.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Mechanism.

  ## Examples

      iex> delete_mechanism(mechanism)
      {:ok, %Mechanism{}}

      iex> delete_mechanism(mechanism)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mechanism(%Mechanism{} = mechanism) do
    Repo.delete(mechanism)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mechanism changes.

  ## Examples

      iex> change_mechanism(mechanism)
      %Ecto.Changeset{source: %Mechanism{}}

  """
  def change_mechanism(%Mechanism{} = mechanism) do
    Mechanism.changeset(mechanism, %{})
  end
end
