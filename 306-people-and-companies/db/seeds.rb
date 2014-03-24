Employee.create! name: "John", co_id: 1
Employee.create! name: "Jill", co_id: 2
Employee.create! name: "Jack", co_id: 2
Employee.create! name: "Ursula", co_id: nil
ActiveRecord::Base.connection.reset_pk_sequence! "employees"
Company.create! name: "Microsoft"
Company.create! name: "IBM"
Company.create! name: "Sun"
ActiveRecord::Base.connection.reset_pk_sequence! "companies"
