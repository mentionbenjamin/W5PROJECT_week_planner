require_relative("../db/sql_runner.rb")
require_relative("./day.rb")

class User

  attr_reader(:id, :title, :description, :day_id)

  def initialize(options)
    @id = options["id"].to_i()
    @title = options["title"]
    @description = options["description"]
    @day_id = options["day_id"]
  end

  def save()
    sql = "INSERT INTO notes
          (title, description, day_id)
          VALUES ($1, $2, $3)
          RETURNING id"
    values = [@title, @description, @day_id]
    note_data = SqlRunner.run(sql, values)
    @id = note_data.first()["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM notes"
    notes = SqlRunner.run(sql)
    result = notes.map{|note| User.new(note)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM notes"
    SqlRunner.run(sql)
  end



end
