Person.create! id: 1, name: "Sally",   password: "S", password_confirmation: "S"
Person.create! id: 2, name: "Charlie", password: "C", password_confirmation: "C"
Person.create! id: 3, name: "Linus",   password: "L", password_confirmation: "L"
Person.create! id: 4, name: "Patty",   password: "P", password_confirmation: "P"
Person.create! id: 5, name: "Snoopy",  password: "S", password_confirmation: "S"
ActiveRecord::Base.connection.reset_pk_sequence! "people"

Following.create! from_person_id: 2, to_person_id: 3
Following.create! from_person_id: 3, to_person_id: 5
