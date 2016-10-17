class Box
  def initialize(input)
    @input = input
  end

  def paper_to_order
    total = 0
    get_boxes.each do |box|
      l, w, h = dimensions_for(box)

      paper = 2*l*w + 2*w*h + 2*h*l
      slack = [l*w, w*h, h*l].min
      total += paper + slack
    end

    total
  end

  def ribbon_to_order
    ribbon = 0
    get_boxes.each do |box|
      l, w, h = dimensions_for(box)

      min = [l+w, w+h, h+l].min * 2
      ribbon += min + l*w*h
    end

    ribbon
  end

  private

  def get_boxes
    @boxes ||= @input.split("\n")
  end

  def dimensions_for(box)
    box.split("x").map(&:to_i)
  end
end
