require_relative "poly_tree_node"

class KnightPathFinder
    attr_reader :con_pos
    def initialize(starting_pos)
        @starting_pos = PolyTreeNode.new(starting_pos)
        @con_pos = []
    end

    def in_range?(pos)
        row, col = pos
        if (row > 7 || col > 7) || (row < 0 || col < 0)
            false
        else
            true
        end
    end

    def valid_moves(pos)
        
        # val = gets.chomp 
        valid_moves = possible_moves(pos).select { |arr| in_range?(arr) }
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