extends HBoxContainer

onready var box1 = $VBoxContainer1
onready var box2 = $VBoxContainer2
onready var GuessResult = load("res://Number/GuessResult.tscn")
var size
var children1
var children2

func _ready():
    children1 = box1.get_children()
    children2 = box2.get_children()
    reset()
    
func reset():
    size = 0

    for child in children1:
        child.set_visible(false)
    for child in children2:
        child.set_visible(false)

func add_data(data):
    if size >= 10:
        return false
    size += 1
    
    var child
    if size <= 5:
        child = children1[size-1]
    else:
        child = children2[size-6]
    child.set_data(data)
    child.set_index(size)
    child.set_visible(true)
    return true
    