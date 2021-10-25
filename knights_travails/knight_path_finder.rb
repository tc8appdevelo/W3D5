require_relative "poly_tree_node"
require "byebug"
class KnightPathFinder
    attr_reader :considered_positions, :root
    MOVES = [
           [+2,-1], [+2, +1], #up
           [-2,-1], [-2, +1], #down
           [+1,-2], [-1, -2], #left
           [+1,+2], [-1, +2] #right 
       ]
    def initialize(starting_pos)
        @starting_pos = starting_pos
        @considered_positions = [starting_pos]
    end

    def self.in_range?(pos)
        row, col = pos
        if (row > 7 || col > 7) || (row < 0 || col < 0)
            false
        else
            true
        end
    end

    def self.valid_moves(pos)
        # debugger
        moves = MOVES.map do |arr|
            # debugger
            arr[0], arr[1] = (arr[0] + pos[0]), (arr[1] + pos[1])
        end
        # val = gets.chomp 
        # debugger
        moves.select { |arr| KnightPathFinder.in_range?(arr) }
    end

    def new_moves_positions(pos)
        new_pos = []
        KnightPathFinder.valid_moves(pos).each do |ele|
            # debugger
            new_pos << ele if !@considered_positions.include?(ele)
        end
        # debugger
        @considered_positions += new_pos
        new_pos
    end

    def build_move_tree
        root = PolyTreeNode.new(@starting_pos)
        node = [root]
        until node.empty?
            current_node = node.shift
            # debugger
            current_pos = current_node.value
            new_moves_positions(current_pos).each do |next_position|
                child_node = PolyTreeNode.new(next_position)
                current_node.add_child(child_node)
                node << child_node
            end
        end
        # debugger
        # @considered_positions << node
    end

    def find_path(end_pos)
    end

#            [0,0] target = [4,4]
#        [1,2]            [2,1]
#    [3,3]   [3,4]
#[[4,4], [1,1], [3,4]]


end