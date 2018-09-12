require_relative("../db/sql_runner.rb")

class Note

  attr_reader(:id, :title, :description)

  def initialize(options)
             @id = options["id"].to_i()
          @title = options["title"]
    @description = options["description"]
  end

  #SAVE
  def save()
          sql = "INSERT INTO notes
                (title, description)
                VALUES ($1, $2)
                RETURNING id"
       values = [@title, @description]
    note_data = SqlRunner.run(sql, values)
          @id = note_data.first()["id"].to_i()
  end

  #EDIT/UPDATE
  def update()
       sql = "UPDATE notes SET
             (title, description)
             = ($1, $2)
             WHERE id = $3"
    values = [@title, @description, @id]
    SqlRunner.run(sql, values)
  end

  #SELECT ALL FROM NOTES
  def self.all()
       sql = "SELECT * FROM notes"
     notes = SqlRunner.run(sql)
    result = notes.map{|note| Note.new(note)}
    return result
  end

  #FIND BY ID
  def self.find(id)
        sql = "SELECT * FROM notes
              WHERE id = $1"
     values = [id]
    results = SqlRunner.run(sql, values)
    return Note.new(results.first)
  end

  #DELETE BY ID
  def delete()
     sql = "DELETE FROM notes
           WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  #DELETE ALL
  def self.delete_all
    sql = "DELETE FROM notes"
    SqlRunner.run(sql)
  end

  #JOINING TO DAYS AND TO-DO
  def day()
        sql = "SELECT days.* FROM days
              INNER JOIN todos ON
              todos.day_id = days.id
              WHERE todos.note_id = $1;"
     values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|note| Note.new(note)}
  end

end
