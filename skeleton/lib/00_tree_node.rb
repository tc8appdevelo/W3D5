class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end


    def has_node?(node)
        @children.include?(node)
    end

    def parent=(node)

        if @parent != nil && node == nil
            idx = @parent.children.index(self)
            @parent.children.delete_at(idx)
            @parent = nil
        end

        if @parent == nil && node == nil
            return
        end
        
        if @parent == nil
            @parent = node
            node.children << self #if node.childre.include?(self)
        else
            idx = @parent.children.index(self)
            @parent.children.delete_at(idx)
            node.children << self if !node.children.include?(self)
            @parent = node
        end

    end

    


end

#     a.children
#    b c
#   d e f