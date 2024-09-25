extends Node2D

@onready var card_scene: PackedScene = preload("res://scenes/card_template.tscn")

@onready var spawn_point = $CanvasLayer/Spawn

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var card: Card = card_scene.instantiate()
	spawn_point.add_child(card)
	card.set_card_values(1, 2, 3, "spawn name", "spawn description")


func _on_button_2_pressed():
	var card: Card = card_scene.instantiate()
	spawn_point.add_child(card)
	card.set_card_values(4, 5, 6, "spawn 2", "spawn 2")
