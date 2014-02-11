puts "Finding file in.txt..."

arr = []
counter = 0

File.foreach('in.txt'){|x|
	x2 = []
	x = x.unpack("U*")
	x.map {|y|
		if (y > 44032 && y < 55215)
			#y = y.to_s(16).rjust(4,'0')
			y = '0x' + sprintf("%02X", counter).rjust(4,'0') + ' ' + y.to_s
			counter += 1
		else
			y = [y].pack("U")
		end
		x2.push(y)
	}
	arr.push(x2)
}
print arr

File.open("out.txt", "w") do |f|
  arr.each do |row| f << row.join("") end
end