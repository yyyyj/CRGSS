module CRGSS	
	class Sprite

		getter :x
		getter :y
		getter :z
		getter :angle
		getter :ox
		getter :oy
		getter :src_rect
		getter :spr  # Don't mess with this one
		
		include CRGSS::Drawable

		def initialize
			@x=0
			@y=0
			@z=0
			@ox=0
			@oy=0
			@angle=0
			@src_rect = Rect.new(0,0,0,0)
			
			@spr = SF::Sprite.new
			CRGSS.resources << self
		end
		
		def bitmap=(bitmap)
			@spr.texture = bitmap.bmp
			@src_rect = bitmap.rect
		end
		
		def src_rect=(rect)
			return if rect==@src_rect
			@spr.texture_rect = SF::Rect.new(rect.x,rect.y,rect.width,rect.height)
		end

		def width
			return @src_rect.width
		end

		def height
			return @src_rect.height
		end
		
		def x=(x)
			return if x==@x
			@x=x
			@spr.position.x = x
		end
		
		def y=(y)
			return if y==@y
			@y=y
			@spr.position.y = y
		end
		
		# set Z value then reorder the resource array
		def z=(z)
			return if z==@z
			@z = z
			CRGSS.resources.sort_by &.z
		end
		
		def position=(pos)
			return if @spr.position == pos
			@x = pos.x
			@y = pos.y
			@spr.position = pos
		end
		
		def origin=(pos)
			return if pos==@spr.origin
			@ox = pos.x
			@oy = pos.y
			@spr.origin = pos
		end

		def ox=(o)
			return if o==@ox
			@ox = o
			@spr.origin(SF.vector2(o,@oy))
		end

		def oy=(o)
			return if o==@oy
			@oy = o
			@spr.origin(SF.vector2(@ox,o))
		end
		
		def draw(window)
			window.draw(@spr)
		end
		
		def angle=(angle)
			return if angle==@angle
			@angle=angle
			@spr.rotation = angle
		end

		def dispose
			return if disposed?
			@spr.finalize
			@spr = nil
		end

		def disposed?
			return true if @spr = nil
		end
	end
end
