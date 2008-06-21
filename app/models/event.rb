class Event < ActiveRecord::Base

  def self.log(cid,info)
    date = Time.new.strftime("%m/%d/%Y, %I:%M%p")
    file = File.open("log/characters/"+cid+".log", "a")
    log = Logger.new(file)
    log.level = Logger::INFO
    log.info(date+": "+ info)
    log.close
  end

end