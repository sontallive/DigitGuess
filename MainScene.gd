extends Node2D

var help_show = false
onready var help = $Help

func _on_Help_changed():
    help_show = not help_show
    help.set_visible(help_show)
