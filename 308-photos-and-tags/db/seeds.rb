Photo.create! id: 1, pic_name: "Flatirons at dawn"
Photo.create! id: 2, pic_name: "Flatirons at sunset"
Photo.create! id: 3, pic_name: "Sunset from my window"
Photo.create! id: 4, pic_name: "Mysterious blur"
ActiveRecord::Base.connection.reset_pk_sequence! "photos"
Tag.create! id: 1, tag_name: "Flatirons"
Tag.create! id: 2, tag_name: "dawn"
Tag.create! id: 3, tag_name: "sunset"
Tag.create! id: 4, tag_name: "Pluto"
ActiveRecord::Base.connection.reset_pk_sequence! "tags"
Photo.find(1).tag_ids = [1, 2]
Photo.find(2).tag_ids = [2, 3]
Photo.find(3).tag_ids = [3, 3]
ActiveRecord::Base.connection.reset_pk_sequence! "photos_tags"
