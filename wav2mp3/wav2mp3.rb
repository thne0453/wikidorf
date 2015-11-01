#! /usr/bin/ruby
require 'fileutils'

def prepareTest(dir)
	examplewav="daisy.wav"
	destination=File.join(dir, examplewav)
	puts "copy #{examplewav} to #{destination}"
	 if File.exist?(examplewav) 
	 	FileUtils.cp(examplewav, destination)
	 else 
	 	puts "#{examplewav} not found."
	 end
end

dir = "./tmp/"
puts "Dir: [#{dir}]"

prepareTest(dir)

Dir.foreach( dir) do |file|
	next if file !~ /\.wav$/

	#Pfad zur Quelldatei bilden
	source = File.join(dir, file)

	# ersetze ".wav" durch ".mp3" im Dateinnamen
	destination = file.sub(/\.wav$/, ".mp3")

	#Pfad zur Zieldatei bilden
	destination = File.join(dir, destination)
	puts "Convert WAV #{source} to MP3 #{destination}.."

	# Backticks führen externen Aufruf aus
	puts `lame "#{source}" "#{destination}"`
	# Golbale Variable $? gibt den Rueckgabewert des letzten extern ausgefuehrten Kommandos
	if  $? == 0
		puts "..success."
		puts "deleting #{source}.."
		File.delete(source) if File.exist?(source)			
	else
		puts "..failed."
	end
end
puts "done."
