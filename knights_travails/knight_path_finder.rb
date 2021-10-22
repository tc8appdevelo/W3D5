require_relative "poly_tree_node"

class KnightPathFinder
    attr_reader :considered_position
    def initialize(starting_pos)
        @starting_pos = starting_pos
        @considered_position = []
    end

    def in_range?(pos)
        if (row > 7 || col > 7) || (row < 0 || col < 0)
            false
        else
            true
        end
    end

    def self.valid_moves(pos)
        row ,col = pos
        # val = gets.chomp 
    end

    def possible_moves(pos)
       moves = [
           [+2,-1], [+2, +1], #up
           [-2,-1], [-2, +1], #down
           [+1,-2], [-1, -2], #left
           [+1,+2], [-1, +2] #right 
       ]
       moves.map do |arr|
        arr[0], arr[1] = (arr[0] + pos[0]), (arr[1] + pos[1])
       end
    end

end