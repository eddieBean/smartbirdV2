extends Node2D

func _ready():
	$MainGame.hide()



func _on_main_menu_start_game() -> void:
	$MainMenu.hide()
	$MainGame.show()
	$MainGame.new_game()


func _on_main_game_game_over() -> void:
	$MainGame.hide()
	$MainMenu.show()
