class Automobil
	def initialize (hersteller, typ, baujahr, farbe, tankvolumen, verbrauch)
		@hersteller = hersteller
		@typ =typ
		@baujahr = baujahr
		@farbe = farbe 
		@tankvolumen=tankvolumen 
		@tank_inhalt=0.0
		@verbrauch = verbrauch
	end
	def print
		puts "Hersteller    :"+@hersteller 
		puts "Typ           :"+@typ
		puts "Baujahr       :"+@baujahr
		puts "Farbe 		:"+@farbe 
		puts "Tankinhalt	:"+@tank_inhalt.to_s + "Liter"		
	end

	def tanken ( menge )
		@tank_inhalt+=menge
		if @tank_inhalt> @tankvolumen
			@tank_inhalt = @tankvolumen
		end
	end

	def fahren (entfernung)
		verbrauch= entfernung *@verbrauch / 100
		@tank_inhalt -= verbrauch
		if @tank_inhalt <0
			@tank_inhalt =0
		end
	end
end

meinAuto = Automobil.new("Opel","Corsa", "1991", "schwarz", 45, 6.3)
chefsAuto = Automobil.new("Porsche","911", "2010","rot", 90, 12.7)

puts "Autos nach dem initialisieren:"
meinAuto.print
chefsAuto.print

puts ".....................................tanken..................................."

meinAuto.tanken( 35 )
chefsAuto.tanken( 35 )

puts "Autos nach dem tanken:"
meinAuto.print
chefsAuto.print

puts ".....................................fahren....................................."
meinAuto.fahren( 250)
chefsAuto.fahren(250)

puts "Autos nach dem fahren:"
meinAuto.print
chefsAuto.print