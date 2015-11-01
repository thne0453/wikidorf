def my_function ( a,b )
	begin
		r = a/b
	rescue 
		puts " #{a} / #{b} = #{r}"
		puts "Division durch Null"
		raise
	end
	puts " #{a} / #{b} = #{r}"
	return r
end

def start_app
	100.times do
		puts "---------------"
		begin
			a=Random.rand(0..100) 
			b=Random.rand(0..4)			
			my_function( a, b )					
		rescue
			puts "Fehler "
		ensure
			puts "done."
		end
	end
end

start_app