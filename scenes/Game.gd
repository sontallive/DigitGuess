extends VBoxContainer

signal new_message(msg)
# Declare member variables here. Examples:
var guss_times = 0
var guess
var Guess = load("res://game/Guess.gd")
var GuessCase = load("res://game/GuessCase.gd")
onready var result_shower = $ResultShower
onready var number_panel = $NumberPanel
onready var guess_times = $GuessTimes

# Called when the node enters the scene tree for the first time.
func _ready():
    
    guess = Guess.new()
    new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_GuessButton_pressed():
    if guess.finished:
        new_game()
        return
    var nums = number_panel.get_nums()
#    print(nums)
    var result = guess.guess(nums)
    if not result == null:
#        print("result is:",result)
        var guess_case = GuessCase.new()
        guess_case.set_data(nums,result)
        result_shower.add_data(guess_case)
        set_guess_time(guess.guess_times)
    else:
        emit_signal("new_message","Please Input Unique Digits!")
        return
    if guess.finished:
        if guess.success:
            emit_signal("new_message","Decode Success!")
        else:
            emit_signal("new_message","Game Over!\nYou can check the right answer.\nPress to Restart!")
            number_panel.nums = guess.answer
func new_game():
    guess.restart()
    number_panel.nums = [0,0,0,0]
    emit_signal("new_message","")
    result_shower.reset()
    set_guess_time(0)
#    print("answer is:",guess.get_answer())

func _on_Game_new_message(msg):
    $Message.text = msg


func _on_Exit_pressed():
    get_tree().quit()

func set_guess_time(time):
    guess_times.text = "Guess:%d/10" % time
