class_name Card extends Node2D

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
@onready var cardImageCanvas: Sprite2D = $CardImage/CardImageSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	set_card_values(cost_money, cost_energy, cost_time, cardName, cardDescription, cardImage)
	
	

#Adjusts labels and image to show costs and sprite set in-editor
func set_card_values(_costM: int, _costE: int, _costT: float, _name: String, _description: String, _image: Texture2D):
	costLabel_money.set_text("$" + str(_costM))
	costLabel_energy.set_text(str(_costE))
	costLabel_time.set_text(str(_costT) + "h")
	
	nameLabel.set_text(_name)
	descriptionLabel.set_text((_description))
	cardImageCanvas.Texture2D = _image
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
