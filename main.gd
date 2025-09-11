extends Node2D

func _ready():
	$MainGame.hide()



func _on_main_menu_start_game():
	$MainMenu.hide()
	$MainGame.show()
	$MainGame.new_game()
	$MainGame/Bird.start(Vector2(300, 450))


func _on_main_game_game_over():
	$MainGame.hide()
	$MainMenu.show()
 
