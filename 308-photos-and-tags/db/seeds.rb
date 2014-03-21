ActiveRecord::Base.connection.reset_pk_sequence! "photos"

ActiveRecord::Base.connection.reset_pk_sequence! "tags"

ActiveRecord::Base.connection.reset_pk_sequence! "photos_tags"
