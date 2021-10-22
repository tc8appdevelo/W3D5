class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end


    # def has_node?(node)
    #     @children.include?(node)
    # end

    # def parent=(node)
    #     if !has_node?(node)
            
    # end

end