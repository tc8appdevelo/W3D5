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

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        raise "not a child"if node.parent == nil 
        node.parent = nil
    end


    def dfs(target)
        # puts "----------------"
        # puts target
        return self if self.value == target

        self.children.each do |child|
            search_result = child.dfs(target)
            return search_result until search_result.nil?
        end
        nil
    end

    def bfs(target)
        
        queue = [self]
        return nil if queue.empty?
        until queue.empty?
            ele = queue.shift
            return ele if ele.value == target
            ele.children.each do |child|
                queue << child
            end
        end
    end

end