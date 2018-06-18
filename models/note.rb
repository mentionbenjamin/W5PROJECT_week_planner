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
    notes = SqlRunner.run(sql)
    result = notes.map{|note| Note.new(note)}
    return result
  end

  def self.find(id) #FIND BY ID
    sql = "SELECT * FROM notes
           WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Note.new(results.first)
  end

  def self.delete_all #DELETE ALL
    sql = "DELETE FROM notes"
    SqlRunner.run(sql)
  end

  def day() #JOINING TO DAYS AND TO-DO
    sql = "SELECT days.* FROM days INNER JOIN todos ON todos.day_id = days.id WHERE todos.note_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|note| Note.new(note)}
  end





end
