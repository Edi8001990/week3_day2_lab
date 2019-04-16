require('pg')

class PropertyTracker

attr_accessor :address, :number_of_rooms, :build_type
attr_reader :id, :year_built

    def initialize ( options )
      @id = options['id'].to_i if options['id']
      @address = options['address']
      @number_of_rooms = options['number_of_rooms'].to_i
      @build_type = options['build_type']
      @year_built = options['year_built'].to_i

    end


    def save()
      db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
      sql = "INSERT INTO property_tracker (address, number_of_rooms, build_type, year_built) VALUES ($1, $2, $3, $4) RETURNING id;"
      values = [@address, @number_of_rooms, @build_type, @year_built]
      db.prepare("save", sql)
      property_hashes = db.exec_prepared("save", values);
      @id = property_hashes[0]['id']
      db.close()
    end

    def PropertyTracker.all()
      db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
      sql = "SELECT * FROM property_tracker;"
      property_hashes = db.exec(sql)
      property = property_hashes.map{|property_hash| PropertyTracker.new(property_hash)}
      db.close()
      return property
    end


 def PropertyTracker.delete_all()
   db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
   sql = "DELETE FROM property_tracker;"
   db.prepare("delete_all", sql)
   db.exec_prepared("delete_all")
   db.close()
 end

 def delete
   db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
   sql = "DELETE FROM property_tracker WHERE id = $1;"
   values = [@id]
   db.prepare("delete", sql)
   db.exec_prepared("delete" ,values)
   db.close()
 end

 def update
   db = PG.connect({dbname: 'property_tracker', host: 'localhost'});
   sql = "UPDATE property_tracker SET address = $1 WHERE id = $2;"
   values = [@address, @id]
   db.prepare("update", sql)
   db.exec_prepared("update", values)
   db.close()
 end


end
