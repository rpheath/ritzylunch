class Direction
  def initialize(params)
    @street, @city, @state, @zip = params[:street], params[:city], params[:location][:state], params[:zip]
  end
  
  def to
    "456 West Pike Street Clarksburg, WV 26301-2712"
  end
  
  def from
    [@street, @city, @state, @zip].join(" ")
  end
  
  def to_s
    "from: #{self.from} to: #{self.to}"
  end
end