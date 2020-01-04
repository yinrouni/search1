defmodule Search1.Drugs do
  @moduledoc """
  The Drugs context.
  """

  import Ecto.Query, warn: false
  alias Search1.Repo

  alias Search1.Drugs.Drug

  @doc """
  Returns the list of drugs.

  ## Examples

      iex> list_drugs()
      [%Drug{}, ...]

  """
  def list_drugs do
    Repo.all(Drug)
  end

  @doc """
  Gets a single drug.

  Raises `Ecto.NoResultsError` if the Drug does not exist.

  ## Examples

      iex> get_drug!(123)
      %Drug{}

      iex> get_drug!(456)
      ** (Ecto.NoResultsError)

  """
  def get_drug!(id) do
	query = from d in Drug, 
		where: d.item_id==^id,
	preload: [:item]
        Repo.one!(query)
  end

  @doc """
  Creates a drug.

  ## Examples

      iex> create_drug(%{field: value})
      {:ok, %Drug{}}

      iex> create_drug(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_drug(attrs \\ %{}) do
    %Drug{}
    |> Drug.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a drug.

  ## Examples

      iex> update_drug(drug, %{field: new_value})
      {:ok, %Drug{}}

      iex> update_drug(drug, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_drug(%Drug{} = drug, attrs) do
    drug
    |> Drug.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Drug.

  ## Examples

      iex> delete_drug(drug)
      {:ok, %Drug{}}

      iex> delete_drug(drug)
      {:error, %Ecto.Changeset{}}

  """
  def delete_drug(%Drug{} = drug) do
    Repo.delete(drug)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking drug changes.

  ## Examples

      iex> change_drug(drug)
      %Ecto.Changeset{source: %Drug{}}

  """
  def change_drug(%Drug{} = drug) do
    Drug.changeset(drug, %{})
  end

  alias Search1.Drugs.MechanismDrug

  @doc """
  Returns the list of mechanism_drug.

  ## Examples

      iex> list_mechanism_drug()
      [%MechanismDrug{}, ...]

  """
  def list_mechanism_drug do
    Repo.all(MechanismDrug)
  end

  @doc """
  Gets a single mechanism_drug.

  Raises `Ecto.NoResultsError` if the Mechanism drug does not exist.

  ## Examples

      iex> get_mechanism_drug!(123)
      %MechanismDrug{}

      iex> get_mechanism_drug!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mechanism_drug!(id), do: Repo.get!(MechanismDrug, id)

  @doc """
  Creates a mechanism_drug.

  ## Examples

      iex> create_mechanism_drug(%{field: value})
      {:ok, %MechanismDrug{}}

      iex> create_mechanism_drug(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mechanism_drug(attrs \\ %{}) do
    %MechanismDrug{}
    |> MechanismDrug.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mechanism_drug.

  ## Examples

      iex> update_mechanism_drug(mechanism_drug, %{field: new_value})
      {:ok, %MechanismDrug{}}

      iex> update_mechanism_drug(mechanism_drug, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mechanism_drug(%MechanismDrug{} = mechanism_drug, attrs) do
    mechanism_drug
    |> MechanismDrug.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a MechanismDrug.

  ## Examples

      iex> delete_mechanism_drug(mechanism_drug)
      {:ok, %MechanismDrug{}}

      iex> delete_mechanism_drug(mechanism_drug)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mechanism_drug(%MechanismDrug{} = mechanism_drug) do
    Repo.delete(mechanism_drug)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mechanism_drug changes.

  ## Examples

      iex> change_mechanism_drug(mechanism_drug)
      %Ecto.Changeset{source: %MechanismDrug{}}

  """
  def change_mechanism_drug(%MechanismDrug{} = mechanism_drug) do
    MechanismDrug.changeset(mechanism_drug, %{})
  end
end
