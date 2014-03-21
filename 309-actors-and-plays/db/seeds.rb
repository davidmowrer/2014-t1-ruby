ActiveRecord::Base.connection.reset_pk_sequence! "actors"

ActiveRecord::Base.connection.reset_pk_sequence! "plays"

ActiveRecord::Base.connection.reset_pk_sequence! "castings"
