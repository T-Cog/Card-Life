extends Node2D

@onready var card_scene: PackedScene = preload("res://scenes/card_template.tscn")
@onready var card_meds: PackedScene = preload("res://scenes/cards/Meds.tscn")
@onready var card_work: PackedScene = preload("res://scenes/cards/Work.tscn")

@onready var spawn_point = $CanvasLayer/Spawn

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var medsCard = card_meds.instantiate()
	spawn_point.add_child(medsCard)
	#card.set_card_values(1, 2, 3, "spawn name", "spawn description", null)


func _on_button_2_pressed():
	var workCard = card_work.instantiate()
	spawn_point.add_child(workCard)
	#workCard.set_card_values(4, 5, 6, "spawn 2", "spawn something new")
