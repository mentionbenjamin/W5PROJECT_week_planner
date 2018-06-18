require_relative("../db/sql_runner.rb")

class Note

  attr_reader(:id, :title, :description)

  def initialize(options)
    @id = options["id"].to_i()
    @title = options["title"]
    @description = options["description"]
  end

  def save()
    sql = "INSERT INTO notes
          (title, description)
          VALUES ($1, $2)
          RETURNING id"
    values = [@title, @description]
    note_data = SqlRunner.run(sql, values)
    @id = note_data.first()["id"].to_i()
  end

  def self.all() #SELECT ALL FROM NOTES
    sql = "SELECT * FROM notes"
    days = SqlRunner.run(sql)
    result = notes.map{|note| Note.new(note)}
    return result
  end





end
