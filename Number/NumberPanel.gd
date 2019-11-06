extends HBoxContainer

# Declare member variables here. Examples:
var nums = [0,0,0,0] setget _nums_changed

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func get_nums():
    var children = get_children()
    for i in range(children.size()):
        nums[i] = children[i].num
    return nums

func _nums_changed(new_nums):
    nums = new_nums
    var children = get_children()
    for i in range(children.size()):
        children[i].num = nums[i]

