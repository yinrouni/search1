defmodule Search1.Administrations do
  @moduledoc """
  The Administrations context.
  """

  import Ecto.Query, warn: false
  alias Search1.Repo

  alias Search1.Administrations.Administration

  @doc """
  Returns the list of administrations.

  ## Examples

      iex> list_administrations()
      [%Administration{}, ...]

  """
  def list_administrations do
    Repo.all(Administration)
  end

  @doc """
  Gets a single administration.

  Raises `Ecto.NoResultsError` if the Administration does not exist.

  ## Examples

      iex> get_administration!(123)
      %Administration{}

      iex> get_administration!(456)
      ** (Ecto.NoResultsError)

  """
  def get_administration!(id), do: Repo.get!(Administration, id)

  @doc """
  Creates a administration.

  ## Examples

      iex> create_administration(%{field: value})
      {:ok, %Administration{}}

      iex> create_administration(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_administration(attrs \\ %{}) do
    %Administration{}
    |> Administration.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a administration.

  ## Examples

      iex> update_administration(administration, %{field: new_value})
      {:ok, %Administration{}}

      iex> update_administration(administration, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_administration(%Administration{} = administration, attrs) do
    administration
    |> Administration.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Administration.

  ## Examples

      iex> delete_administration(administration)
      {:ok, %Administration{}}

      iex> delete_administration(administration)
      {:error, %Ecto.Changeset{}}

  """
  def delete_administration(%Administration{} = administration) do
    Repo.delete(administration)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking administration changes.

  ## Examples

      iex> change_administration(administration)
      %Ecto.Changeset{source: %Administration{}}

  """
  def change_administration(%Administration{} = administration) do
    Administration.changeset(administration, %{})
  end

  alias Search1.Administrations.DevAd

  @doc """
  Returns the list of dev_ads.

  ## Examples

      iex> list_dev_ads()
      [%DevAd{}, ...]

  """
  def list_dev_ads do
    Repo.all(DevAd)
  end

  @doc """
  Gets a single dev_ad.

  Raises `Ecto.NoResultsError` if the Dev ad does not exist.

  ## Examples

      iex> get_dev_ad!(123)
      %DevAd{}

      iex> get_dev_ad!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dev_ad!(id), do: Repo.get!(DevAd, id)

  @doc """
  Creates a dev_ad.

  ## Examples

      iex> create_dev_ad(%{field: value})
      {:ok, %DevAd{}}

      iex> create_dev_ad(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dev_ad(attrs \\ %{}) do
    %DevAd{}
    |> DevAd.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dev_ad.

  ## Examples

      iex> update_dev_ad(dev_ad, %{field: new_value})
      {:ok, %DevAd{}}

      iex> update_dev_ad(dev_ad, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dev_ad(%DevAd{} = dev_ad, attrs) do
    dev_ad
    |> DevAd.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a DevAd.

  ## Examples

      iex> delete_dev_ad(dev_ad)
      {:ok, %DevAd{}}

      iex> delete_dev_ad(dev_ad)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dev_ad(%DevAd{} = dev_ad) do
    Repo.delete(dev_ad)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dev_ad changes.

  ## Examples

      iex> change_dev_ad(dev_ad)
      %Ecto.Changeset{source: %DevAd{}}

  """
  def change_dev_ad(%DevAd{} = dev_ad) do
    DevAd.changeset(dev_ad, %{})
  end
end
