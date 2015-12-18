module Football
  class Player
    attr_reader :name
    attr_reader :number

    def initialize (name, number)
      @name = name.split.map(&:capitalize).join(' ')
      @number = number
    end

    def import_from_csv(filename)
    end

    def to_s
      "#{@number}. #{@name}"
    end

  end

  if __FILE__ == $PROGRAM_NAME
    p = Player.new('tom','10')
    puts p.to_s
  end

end
