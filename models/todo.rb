require_relative("../db/sql_runner.rb")

class Todo

  attr_reader(:id, :note_id, :day_id)

  def initialize(options)
         @id = options["id"].to_i()
    @note_id = options["note_id"].to_i()
     @day_id = options["day_id"].to_i()
  end

  #SAVE
  def save()
         sql = "INSERT INTO todos
               (note_id, day_id)
               VALUES ($1, $2)
               RETURNING id"
      values = [@note_id, @day_id]
    day_data = SqlRunner.run(sql, values)
         @id = day_data.first()["id"].to_i()
  end

  #SELECT ALL FROM TO-DO
  def self.all()
       sql = "SELECT * FROM todos"
     todos = SqlRunner.run(sql)
    result = todos.map{|todo| Todo.new(todo)}
    return result
  end

  #SELECT ALL NOTES FROM TO-DO
  def note()
        sql = "SELECT * FROM notes
              WHERE id = $1"
     values = [@note_id]
    results = SqlRunner.run(sql, values)
    return Note.new(results.first)
  end

  #SELECT ALL DAYS FROM TO-DO
  def day()
        sql = "SELECT * FROM days
              WHERE id = $1"
     values = [@day_id]
    results = SqlRunner.run(sql, values)
    return Day.new(results.first)
  end

  #DELETE ALL
  def self.delete_all
    sql = "DELETE FROM todos"
    SqlRunner.run(sql)
  end

  #DELETE BY ID
  def self.destroy(id)
    sql = "DELETE FROM todos
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

end
