#! /usr/bin/ruby


#Klasse Geld, speichert Betraege  intern in Euro, rechnet zw DM und Euro um
#Aufruf:
# ./dm2euro.rb input.txt

class Geld
	EUR 	  = 1.9558
	TRENNER   = ','
	NACHKOMMA = 2

	def initialze (betrag ="0 DM")
		set ( betrag )
	end

	def Geld.factor
		return EUR
	end

	def set ( betrag )
	    rxpIsDM  = /([\d,]+)\s+DM/
	    rxpIsEUR = /([\d,]+)\s+EUR/
	    if betrag =~ rxpIsDM	    
	      @betrag = $1.sub(/,/,".").to_f 
	      @betrag = @betrag / EUR
		elsif betrag =~ rxpIsEUR
			@betrag= $1.sub(/,/,".").to_f 
		else
			raise
		end
		return self
	end

	def to_EUR
		return sprintf("%.#{NACHKOMMA}f EUR", @betrag ).sub( /\./, TRENNER)
	end

	def to_DM
		return sprintf("%.#{NACHKOMMA}f DM", @betrag * EUR).sub( /\./, TRENNER)
	end
end

geld = Geld.new
rxpFindeGeld =/([\d,]+\s+(DM|EUR))/

# $*[0] = erstes Argument des Programms
File.foreach( $*[0] ) do |line|
	line.gsub( rxpFindeGeld) do |match|
		geld.set(match).to_EUR
	end
	puts line
end		