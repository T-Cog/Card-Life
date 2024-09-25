class_name Card extends Node2D

@export var cardName: String = "Card Name"
@export var cardDescription: String = "Card Description"
@export var cost_money: int = 100
@export var cost_energy: int = 10
@export var cost_time: float = 1
@export var cardImage: Node2D

@onready var costLabel_money: Label = $CostDisplay/MoneyCost/MoneyCostLabel
@onready var costLabel_energy: Label = $CostDisplay/EnergyCost/EnergyCostLabel
@onready var costLabel_time: Label = $CostDisplay/TimeCost/TimeCostLabel

@onready var nameLabel: Label = $CardName/NameLabel
@onready var descriptionLabel: Label = $CardDescription/DescriptionLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	set_card_values(cost_money, cost_energy, cost_time, cardName, cardDescription)
	
	

func set_card_values(_costM: int, _costE: int, _costT: float, _name: String, _description: String):
	costLabel_money.set_text("$" + str(_costM))
	costLabel_energy.set_text(str(_costE))
	costLabel_time.set_text(str(_costT) + "h")
	
	nameLabel.set_text(_name)
	descriptionLabel.set_text((_description))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
