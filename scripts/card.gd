@tool
class_name Card extends Node2D 

signal mouse_entered()
signal mouse_exited()

@export var cardName: String = "Card Name" #Stores name of card
@export var cardDescription: String = "Card Description" #Stores pop-up description
@export var cardImage: Texture2D #Stores card art sprite 

#Resource cost variables
@export var cost_money: int = 100 
@export var cost_energy: int = 10
@export var cost_time: float = 1

#Sets visual labels as variables for costs, card name, description
@onready var costLabel_money: Label = $CostDisplay/MoneyCost/MoneyCostLabel
@onready var costLabel_energy: Label = $CostDisplay/EnergyCost/EnergyCostLabel
@onready var costLabel_time: Label = $CostDisplay/TimeCost/TimeCostLabel
@onready var nameLabel: Label = $CardName/NameLabel
@onready var descriptionLabel: Label = $CardDescription/DescriptionLabel
@onready var cardImageCanvas: Sprite2D = $CardImage/CardImageCanvas
@onready var description_node: Node2D = $CardDescription

@onready var resource_manager: resource = $"/root/card_hand/resource_manager"

# Called when the node enters the scene tree for the first time.
func _ready():
	description_node.visible = false
	

#Adjusts labels and image to show costs and sprite set in-editor
func set_card_values(_costM: int, _costE: int, _costT: float, 
_name: String, _description: String, _image: Texture2D):
	costLabel_money.set_text("$" + str(_costM))
	costLabel_energy.set_text(str(_costE))
	costLabel_time.set_text(str(_costT) + "h")
	
	nameLabel.set_text(_name)
	descriptionLabel.set_text((_description))
	cardImageCanvas.texture = _image
	

func highlight():
	description_node.visible = true
	

func unhighlight():
	description_node.visible = false

func activate():
	pass

func _spendResource():
	if resource_manager._can_play_card(cost_money, cost_energy, cost_time):
		resource_manager._calculateResources(cost_money, cost_energy, cost_time)
		print("played it")
	else:
		print("didn't work")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_card_values(cost_money, cost_energy, cost_time, 
	cardName, cardDescription, cardImage)
	

func _input(event):
	# Check if the "select_card" action is triggered
	if Input.is_action_just_pressed("select_card") and is_mouse_over():
		_spendResource()
		print("card clicked")
		

func is_mouse_over() -> bool:
	return get_global_mouse_position().distance_to(global_position) < 100  # Adjust for your card's size


func _on_area_2d_mouse_entered():
	mouse_entered.emit()
	highlight()
	


func _on_area_2d_mouse_exited():
	mouse_exited.emit()
	unhighlight()
	


func _on_area_2d_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
