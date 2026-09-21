extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup_button($MenuButtons/PlayContiner/PlayButton)
	setup_button($MenuButtons/CreditsContiner/CreditsButton)
	setup_button($MenuButtons/ExitContiner/ExitButton)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_exit_button_pressed() -> void:
	$QuitDialog.popup_centered()


func _on_quit_dialog_confirmed() -> void:
	get_tree().quit()


func _on_button_mouse_entered(button: Control) -> void:
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(button, "offset_transform_scale", Vector2(0.95, 0.95), 0.15)


func _on_button_mouse_exited(button: Control) -> void:
	var tween := create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(button, "offset_transform_scale", Vector2.ONE, 0.15)


func setup_button(button: Control) -> void:
	await get_tree().process_frame

	button.mouse_entered.connect(_on_button_mouse_entered.bind(button))
	button.mouse_exited.connect(_on_button_mouse_exited.bind(button))
