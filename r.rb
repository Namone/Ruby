
baseInput = 0
expInput = 0
practiceArray = [1, 2, 1, 1, 1, 1, 4, 5] #will hopefully have duplicates removed
array1 = ["on", "in", "woo"]
array2 = ["to", "coming", "goo"]

puts "Run which method...?"
input = gets.chomp

# get values from user to be used with power (x, y)
def getValuesForPower()
puts "Enter the base: "
baseInput = gets.chomp.to_i
puts "Enter exponent: "
expInput = gets.chomp.to_i

power baseInput, expInput
end

# base * base * base * base... 
# number of bases being multiplied dependent on exp
def power (base, exp)

	currentExp = 1
	puts base
	power = 1
	while currentExp <= exp do

		power = power * base 

		puts power
		currentExp += 1
	end
end

# factorial (5 * 4 * 3 * 2 * 1...)
def factorial (maxNum) 
	currentNumber = 0 
	total = 1
	while currentNumber < maxNum
		temp = maxNum - currentNumber # 5 - 1 = 4, 5 - 2 = 3, 5 - 3 = 2...  (5 is an example number)
		total = total * temp # product of all numbers
		currentNumber += 1
	end
	puts total
		
end

# Done... Checks if value in array == to value in result (result has no values..so unless the value is already there it will evaluate, 
#always, to false)
def uniques(array) 
	arrayPos = 0
	result = [] # array the result will be "pushed" too
	x = 0
	for arrayPos in 0...array.length
		duplicate = false
		for x in 0...array.length
			duplicate ||= (array[arrayPos] == result[x]) # If duplicate is null, or false, check condition...
			puts arrayPos
			puts x
			puts result.inspect
		end
		if !duplicate
			result << array[arrayPos]
		end
	end
	puts result.inspect
end

#> combinations([“on”,”in”],[“to”,”rope”])
#=> [“onto”,”onrope”,”into”,”inrope”]
def combinations(array1, array2)
	resultArray = [] # empty array to push final result too (and output)
	tempArray = []
	tempString = ""
	x = 0
	y = 0
	stringX = ""
	stringY = ""
	newString = "placeholder"
	for x in 0...array1.length
		stringX = array1[x] # on, in, woo
		for y in 0...array2.length			
			stringY = array2[y] # to, coming, goo
			tempString = stringX + stringY
			
			# Make sure it isn't getting overwritten...
			if x == 0
				tempArray[y] = tempString
			elsif x == 1
				tempArray[y + array2.length] = tempString
			elsif x == 2
				tempArray[y + (array2.length * 2)] = tempString
			end

		end
	end	

	return tempArray																									
end

if input.eql? "power"
	getValuesForPower

elsif input.eql? "fact"
	puts "Enter factorial: "
	input = gets.chomp.to_i
	factorial input

elsif input.eql? "uniq"
	uniques practiceArray

elsif input.eql? "combo"
	array = combinations array1, array2
	puts array.inspect

else
	puts "Don't know, eh?"

end