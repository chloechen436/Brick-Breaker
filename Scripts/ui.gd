extends CanvasLayer

class_name UI

@onready var lifes_label = %LifesLabel
@onready var game_lost_container = $GameLostContainer
@onready var level_won_container = $LevelWonContainer

func set_lifes(lifes: int):
	lifes_label.text = "Lifes: %d" % lifes

func new_game():
	$"../Music".play()

func game_over():
	$"../Music".stop()
	$"../DeathSound".play()
	game_lost_container.show()
	
func _on_game_lost_button_pressed():
	get_tree().reload_current_scene()

func on_level_won():
	level_won_container.show()

func _on_level_won_button_pressed():
	LevelDefinitions.current_level += 1
	get_tree().reload_current_scene()
