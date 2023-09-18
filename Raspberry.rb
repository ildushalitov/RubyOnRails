class Raspberry 
    @@states = ["Отсутствует","Цветение","Зеленая","Красная"]
    protected
    attr_reader :state 
    attr_reader :index
    public
    def initialize(index)
        @index = index 
        @state = @@states[0]
    end

    def ripe?()
        @state == "Красная"
    end

    def grow!()
        if @state == "Красная"
            p "Ягода уже созрела"
        else
            @state = @@states[@@states.find_index(@state)+1]
        end
    end
end

class RaspberryBush
    def initialize(raspberry_amount)
        @raspberries = []
        raspberry_amount.times do |i| 
            @raspberries.push(Raspberry.new(i))
        end
    end

    def grow_all!()
        if @raspberries.size == 0
            p "нет ягод"
        elsif @raspberries[0].ripe?
            p "ягоды уже созрели"
        else 
            @raspberries.map(&:grow!)
        end
    end

    def ripe_all?()
        @raspberries.select{|r| r.ripe?}.size == @raspberries.size 
    end

    def give_away_all!()
        @raspberries = []
    end
end

class Human
    attr_accessor :name
    protected 
    @plant
    public
    def initialize(name, plant)
        @name = name 
        @plant = plant
    end 

    def work!()
        @plant.grow_all!
    end

    def harvest()
        if @plant.ripe_all? 
            @plant.give_away_all! 
            p "урожай собран"
        else
            p "еше рано собирать урожай"
        end
    end
    
    def self.knowledge_base()
        p "собери малину и достань курицу из холодильника"
    end
end

Human.knowledge_base
h = Human.new("Alex", RaspberryBush.new(10))
h.work!
h.harvest
h.work!
h.work!
h.harvest
