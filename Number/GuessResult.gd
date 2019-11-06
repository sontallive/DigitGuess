extends Panel

func _ready():
    pass

func set_numbers(nums):
    var label = $HBoxContainer/nums
    var nums_str = ""
    for num in nums:
        nums_str += str(num)
    label.text = nums_str
    
func set_results(result):
    var label = $HBoxContainer/judges
    var judges_str = "%dT%dM" % [result.x,result.y]
    label.text = judges_str
    
func set_data(data):
    set_numbers(data.nums)
    set_results(data.judges)
    
func set_index(num):
    $HBoxContainer/index.text = "%d." % num