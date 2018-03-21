require('pg')
require('pry')

class Bounty
  attr_accessor :name, :species, :collected_by, :bounty_value
  attr_reader :id

  def initialize( options)
    @name = options['name']
    @species = options ['species']
    @collected_by = options['collected_by']
    @bounty_value = options ['bounty_value'].to_i
    @id = options ['id']
  end

  def save()
    # save all the info about this ojbect in a DB
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    #stuff

    a_sql = "
    INSERT INTO bounties
    (name, species, collected_by, bounty_value)
    VALUES
    ($1,$2,$3,$4)
    ;
    "
    values = [@name, @species, @collected_by, @bounty_value]
    db.prepare("save", a_sql)
    db.exec_prepared("save", values)
    db.close()
  end


  def update()
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})
    #stuff

    sql = "
    UPDATE bounties
    SET (name, species, collected_by, bounty_value)
    = ($1,$2,$3,$4)
    WHERE id = $5
    ;
    "
    values = [@name, @species, @collected_by, @bounty_value,@id]

    db.prepare("update", sql)
    orders = db.exec_prepared("update", values)
    db.close()

  end

  def delete()
    db = PG.connect({ dbname: 'bounty_hunter', host: 'localhost'})

    sql = "
    DELETE FROM bounties
    WHERE id = $1

    "
    values = [@id]

    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close()

  end
end
