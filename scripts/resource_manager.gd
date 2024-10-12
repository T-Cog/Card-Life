@tool
class_name resource extends Node2D

@export var resource_money: int = 100
@export var resource_energy: int = 300
@export var resource_time: float = 24

@onready var resourceLabel_money: Label = $MoneyDisplay/MoneyLabel
@onready var resourceLabel_energy: Label = $EnergyDisplay/EnergyLabel
@onready var resourceLabel_time: Label = $TimeDisplay/TimeLabel


func _setResourceLabels(_resM: int, _resE: int, _resT: float):
	resourceLabel_money.set_text("$" + str(_resM))
	resourceLabel_energy.set_text("Energy " + str(_resE))
	# resourceLabel_time.set_text("Time " + str(_resT))

func _can_play_card(_costM: int, _costE: int, _costT: float) -> bool:
	
	return resource_money >= _costM and resource_energy >= _costE and resource_time >= _costT
	

func _calculateResources(_costM: int, _costE: int, _costT: float):
	if _can_play_card(_costM, _costE, _costT):
		resource_money -= _costM
		resource_energy -= _costE
		resource_time -= _costT
		print("resources spent")
	else:
		print("not enough resources")
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_setResourceLabels(resource_money, resource_energy, resource_time)
