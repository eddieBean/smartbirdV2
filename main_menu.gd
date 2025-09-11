extends MarginContainer

signal start_game()
signal start_ai_game(agents)

func _ready():
	$HBoxContainer/VBoxContainer/AISettings.hide()

func _on_ai_play_button_pressed() -> void:
	$HBoxContainer/VBoxContainer/StartingMenu.hide()
	$HBoxContainer/VBoxContainer/AISettings.show()



func _on_agent_slider_value_changed(value: float):
	var intValue = roundi(value)
	$HBoxContainer/VBoxContainer/AISettings/AISettingsInfo.text = "AI AGENTS:" + str(intValue)


func _on_start_ai_game_pressed() -> void:
	pass # Replace with function body.


func _on_human_play_button_pressed() -> void:
	start_game.emit()
	
