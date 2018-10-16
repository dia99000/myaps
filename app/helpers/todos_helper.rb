module TodosHelper
	def updated_at(todo)
		times = todo.updated_at.to_s.split(" ")
		time = times[0].gsub("-","").gsub("2018","").gsub("2019","")
		time.split("")
		month = time[0] + time[1]
		date = time[2] + time[3]
		return month + '/' + date
	end
end
