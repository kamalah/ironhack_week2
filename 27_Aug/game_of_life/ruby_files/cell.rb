class Cell
  	def initialize(state, neighbours)
    	@state = state # either 1 or 0 for alive or dead
    	@neighbours = neighbours # an array that represents the surrounding cells
  	end

  	def regenerate
    	live = @neighbours.count(1)
    	if @state == 1
    		(live == 2 || live == 3) ? 1 : 0
    	else
    		(live == 3) ? 1 : 0
    	end
    end
end
