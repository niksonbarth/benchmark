defmodule PhoenixBench.Repo.Migrations.CreateBenchs do
  use Ecto.Migration

  def change do
    create table(:benchs) do

      timestamps()
    end

  end
end
