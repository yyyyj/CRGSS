module CRGSS
    class Rect

        property x
        property y
        property width
        property height

        def initialize(x,y,w,h)
            @x = x
            @y = y
            @width = w
            @height = h
        end

        def set(x,y,w,h)
            @x = x
            @y = y
            @width = w
            @height = h
        end
    end
end