extends Node2D

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
	set_values()
	
	
func set_values(_costMoney: int, _costEnergy: int, _costTime: float, _name: String, _description: String):
	costLabel_money.set_text("$" + str(cost_money))
	costLabel_energy.set_text(str(cost_energy))
	costLabel_time.set_text(str(cost_time) + "h")
	
	nameLabel.set_text(cardName)
	descriptionLabel.set_text((cardDescription))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

