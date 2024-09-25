extends Node2D

@onready var card_scene: PackedScene = preload("res://scenes/card_template.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	card_scene.instantiate()
