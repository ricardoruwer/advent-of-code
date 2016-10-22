class Grid
  def initialize(input)
    @input = input
  end

  def count_lights_on
    @grid = Hash.new

    get_rules.each do |rule|
      from, to = rule.scan(/\d{1,3}[,]\d{1,3}/)

      if rule.start_with?("turn on")
        switch(from, to, true)
      elsif rule.start_with?("turn off")
        switch(from, to, false)
      elsif rule.start_with?("toggle")
        toggle(from, to)
      end
    end

    @grid.select { |_,light| light == true }.size
  end

  def brightness
    @grid = Hash.new

    get_rules.each do |rule|
      from, to = rule.scan(/\d{1,3}[,]\d{1,3}/)

      if rule.start_with?("turn on")
        change_brightness(from, to, "+1")
      elsif rule.start_with?("turn off")
        change_brightness(from, to, "-1")
      elsif rule.start_with?("toggle")
        change_brightness(from, to, "+2")
      end
    end

    @grid.values.inject(:+)
  end

  private

  def get_rules
    @input.split("\n")
  end

  def switch(from, to, status)
    from_x, from_y = from.split(",").map(&:to_i)
    to_x, to_y = to.split(",").map(&:to_i)

    from_x.upto(to_x) do |line|
      from_y.upto(to_y) do |column|
        @grid["#{line},#{column}"] = status
      end
    end
  end

  def toggle(from, to)
    from_x, from_y = from.split(",").map(&:to_i)
    to_x, to_y = to.split(",").map(&:to_i)

    from_x.upto(to_x) do |line|
      from_y.upto(to_y) do |column|
        if @grid["#{line},#{column}"].nil?
          status = true
        else
          status = (not @grid["#{line},#{column}"])
        end

        @grid["#{line},#{column}"] = status
      end
    end
  end

  def change_brightness(from, to, value)
    from_x, from_y = from.split(",").map(&:to_i)
    to_x, to_y = to.split(",").map(&:to_i)

    from_x.upto(to_x) do |line|
      from_y.upto(to_y) do |column|
        if @grid["#{line},#{column}"].nil?
          @grid["#{line},#{column}"] = 0
        end

        result = @grid["#{line},#{column}"] + value.to_i
        @grid["#{line},#{column}"] = result if result >= 0
      end
    end
  end
end
