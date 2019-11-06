extends Control
signal num_changed
# Declare member variables here. Examples:
export (int) var num = 0 setget _on_num_changed

var mouse_entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func next_number():
    num += 1
    if num == 10:
        num = 0
    emit_signal("num_changed")
    
func prev_number():
    num -= 1
    if num == -1:
        num = 9
    emit_signal("num_changed")

func _on_mouse_entered():
    mouse_entered = true
#    print("mouse_enter")

func _on_mouse_exited():
    mouse_entered = false
#    print("mouse_exited")

func _on_input_event(viewport, event, shape_idx):
    if not mouse_entered: return
    if event.is_action_pressed("left_click"):
#        print(self.name,"left_clicked")
        next_number()
    if event.is_action_pressed("right_click"):
#        print(self.name,"right_clicked")
        prev_number()



func _on_Number_num_changed():
    $Area2D/Label.text = str(num)

func _on_num_changed(new_num):
    num = new_num
    emit_signal("num_changed")
