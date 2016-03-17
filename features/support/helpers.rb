#==============================================================================
# ** HelperFunctions
#==============================================================================

module HelperFunctions
  
  def format_timestamp(time_string)
    date, time = time_string.split(" ")
    date_ary = date.split("-").map { |s| s.to_i }
    time_ary = time.split(":").map { |s| s.to_i }
    return Time.new(*(date_ary + time_ary))
  end
  
  def format_iteration_str(iteration_num)
    return "Iteration #{(iteration_num + 1) / 2}-#{(iteration_num - 1) % 2 + 1}" 
  end
  
  def get_iteration_from_string(iteration_str)
    match_data = iteration_str.match(/^Iteration (\d+)-(\d+)/)
    if match_data
      return (match_data[1].to_i - 1) * 2 + match_data[2].to_i 
    else
      raise "Error converting iteration string to value."
    end
  end
    
end

#==============================================================================
# ** Cucumber
#==============================================================================

World(HelperFunctions)