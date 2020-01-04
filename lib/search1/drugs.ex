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
	preload: [:item, :namecodes,:namebrands,:namegenerics, [mechanisms: :item],
		 [developments: :condition],[developments: :phasehighst]]
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

  alias Search1.Drugs.NameCode

  @doc """
  Returns the list of namecodes.

  ## Examples

      iex> list_namecodes()
      [%NameCode{}, ...]

  """
  def list_namecodes do
    Repo.all(NameCode)
  end

  @doc """
  Gets a single name_code.

  Raises `Ecto.NoResultsError` if the Name code does not exist.

  ## Examples

      iex> get_name_code!(123)
      %NameCode{}

      iex> get_name_code!(456)
      ** (Ecto.NoResultsError)

  """
  def get_name_code!(id), do: Repo.get!(NameCode, id)

  @doc """
  Creates a name_code.

  ## Examples

      iex> create_name_code(%{field: value})
      {:ok, %NameCode{}}

      iex> create_name_code(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_name_code(attrs \\ %{}) do
    %NameCode{}
    |> NameCode.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a name_code.

  ## Examples

      iex> update_name_code(name_code, %{field: new_value})
      {:ok, %NameCode{}}

      iex> update_name_code(name_code, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_name_code(%NameCode{} = name_code, attrs) do
    name_code
    |> NameCode.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a NameCode.

  ## Examples

      iex> delete_name_code(name_code)
      {:ok, %NameCode{}}

      iex> delete_name_code(name_code)
      {:error, %Ecto.Changeset{}}

  """
  def delete_name_code(%NameCode{} = name_code) do
    Repo.delete(name_code)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking name_code changes.

  ## Examples

      iex> change_name_code(name_code)
      %Ecto.Changeset{source: %NameCode{}}

  """
  def change_name_code(%NameCode{} = name_code) do
    NameCode.changeset(name_code, %{})
  end

  alias Search1.Drugs.NameBrand

  @doc """
  Returns the list of namebrands.

  ## Examples

      iex> list_namebrands()
      [%NameBrand{}, ...]

  """
  def list_namebrands do
    Repo.all(NameBrand)
  end

  @doc """
  Gets a single name_brand.

  Raises `Ecto.NoResultsError` if the Name brand does not exist.

  ## Examples

      iex> get_name_brand!(123)
      %NameBrand{}

      iex> get_name_brand!(456)
      ** (Ecto.NoResultsError)

  """
  def get_name_brand!(id), do: Repo.get!(NameBrand, id)

  @doc """
  Creates a name_brand.

  ## Examples

      iex> create_name_brand(%{field: value})
      {:ok, %NameBrand{}}

      iex> create_name_brand(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_name_brand(attrs \\ %{}) do
    %NameBrand{}
    |> NameBrand.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a name_brand.

  ## Examples

      iex> update_name_brand(name_brand, %{field: new_value})
      {:ok, %NameBrand{}}

      iex> update_name_brand(name_brand, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_name_brand(%NameBrand{} = name_brand, attrs) do
    name_brand
    |> NameBrand.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a NameBrand.

  ## Examples

      iex> delete_name_brand(name_brand)
      {:ok, %NameBrand{}}

      iex> delete_name_brand(name_brand)
      {:error, %Ecto.Changeset{}}

  """
  def delete_name_brand(%NameBrand{} = name_brand) do
    Repo.delete(name_brand)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking name_brand changes.

  ## Examples

      iex> change_name_brand(name_brand)
      %Ecto.Changeset{source: %NameBrand{}}

  """
  def change_name_brand(%NameBrand{} = name_brand) do
    NameBrand.changeset(name_brand, %{})
  end

  alias Search1.Drugs.NameGeneric

  @doc """
  Returns the list of namegenerics.

  ## Examples

      iex> list_namegenerics()
      [%NameGeneric{}, ...]

  """
  def list_namegenerics do
    Repo.all(NameGeneric)
  end

  @doc """
  Gets a single name_generic.

  Raises `Ecto.NoResultsError` if the Name generic does not exist.

  ## Examples

      iex> get_name_generic!(123)
      %NameGeneric{}

      iex> get_name_generic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_name_generic!(id), do: Repo.get!(NameGeneric, id)

  @doc """
  Creates a name_generic.

  ## Examples

      iex> create_name_generic(%{field: value})
      {:ok, %NameGeneric{}}

      iex> create_name_generic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_name_generic(attrs \\ %{}) do
    %NameGeneric{}
    |> NameGeneric.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a name_generic.

  ## Examples

      iex> update_name_generic(name_generic, %{field: new_value})
      {:ok, %NameGeneric{}}

      iex> update_name_generic(name_generic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_name_generic(%NameGeneric{} = name_generic, attrs) do
    name_generic
    |> NameGeneric.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a NameGeneric.

  ## Examples

      iex> delete_name_generic(name_generic)
      {:ok, %NameGeneric{}}

      iex> delete_name_generic(name_generic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_name_generic(%NameGeneric{} = name_generic) do
    Repo.delete(name_generic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking name_generic changes.

  ## Examples

      iex> change_name_generic(name_generic)
      %Ecto.Changeset{source: %NameGeneric{}}

  """
  def change_name_generic(%NameGeneric{} = name_generic) do
    NameGeneric.changeset(name_generic, %{})
  end
end
