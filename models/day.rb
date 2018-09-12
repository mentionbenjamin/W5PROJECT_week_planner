require_relative("../db/sql_runner.rb")

class Day

  attr_reader(:id, :day)

  def initialize(options)
     @id = options["id"].to_i()
    @day = options["day"]
  end

  #SAVE
  def save()
         sql = "INSERT INTO days
               (day)
               VALUES ($1)
               RETURNING id"
      values = [@day]
    day_data = SqlRunner.run(sql, values)
    @id = day_data.first()["id"].to_i()
  end

  #SELECT ALL FROM DAYS
  def self.all()
       sql = "SELECT * FROM days"
      days = SqlRunner.run(sql)
    result = days.map{|day| Day.new(day)}
    return result
  end

  #FIND BY ID
  def self.find(id)
        sql = "SELECT * FROM days
              WHERE id = $1"
     values = [id]
    results = SqlRunner.run(sql, values)
    return Day.new(results.first)
  end

  #DELETE ALL
  def self.delete_all
    sql = "DELETE FROM days"
    SqlRunner.run(sql)
  end

  #JOINING TO DAYS AND TO-DO
  def notes()
        sql = "SELECT notes.* FROM notes
              INNER JOIN todos ON
              todos.note_id = notes.id
              WHERE todos.day_id = $1;"
     values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|note| Note.new(note)}
  end

end
