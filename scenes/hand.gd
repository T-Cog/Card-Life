@tool
extends Node2D

@export var hand_radius: int = 100
@export var card_angle: float = -90
@export var angle_limit: float = 30
@export var max_card_spread_angle: float = 5

@onready var test_card = $TestCard
@onready var collision_shape: CollisionShape2D = $DebugShape

var hand: Array = []

func add_card(card: Node2D):
	hand.push_back((card_angle))
	pass

func reposition_cards():
	var card_spread = min(angle_limit / hand.size(), max_card_spread_angle) 
	for card in hand :
		pass

func get_card_position(angle_in_deg: float) -> Vector2:
	var x: float = hand_radius * cos(deg_to_rad(angle_in_deg))
	var y: float = hand_radius * sin(deg_to_rad(angle_in_deg))
	
	return Vector2(x, y)

func _card_transform_update(card: Node2D, angle_in_drag: float):
	card.set_position(get_card_position(card_angle))
	card.set_rotation(-deg_to_rad(-card_angle - 90))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	
	
	
	#tool logic
	if (collision_shape.shape as CircleShape2D).radius != hand_radius:
		(collision_shape.shape as CircleShape2D).set_radius(hand_radius)
		
	test_card.set_position(get_card_position(card_angle))
	test_card.set_rotation(-deg_to_rad(-card_angle - 90))
	#-90 -> rotate 0
	#45 -> rotate 45
	#-135 -> rotate -45
