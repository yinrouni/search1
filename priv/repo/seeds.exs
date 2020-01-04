# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Search1.Repo.insert!(%Search1.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
#
alias Search1.Repo
alias Search1.Items.Item
alias Search1.Drugs.Drug
alias Search1.Mechanisms.Mechanism
alias Search1.Drugs.MechanismDrug

Repo.insert!(%Item{name: "A", is_drug: true})
Repo.insert!(%Item{name: "aa", is_drug: true})
Repo.insert!(%Item{name: "aab", is_drug: true})
Repo.insert!(%Item{name: "A", is_drug: false})
Repo.insert!(%Item{name: "aa", is_drug: false})
Repo.insert!(%Item{name: "aab", is_drug: false})


Repo.insert!(%Drug{item_id: 1})
Repo.insert!(%Drug{item_id: 2})
Repo.insert!(%Drug{item_id: 3})

Repo.insert!(%Mechanism{item_id: 4})
Repo.insert!(%Mechanism{item_id: 5})
Repo.insert!(%Mechanism{item_id: 6})

Repo.insert!(%MechanismDrug{drug_id: 1, mechanism_id: 1})
Repo.insert!(%MechanismDrug{drug_id: 1, mechanism_id: 2})
Repo.insert!(%MechanismDrug{drug_id: 2, mechanism_id: 3})
Repo.insert!(%MechanismDrug{drug_id: 3, mechanism_id: 3})


