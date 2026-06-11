extends CanvasLayer

@onready var anim = $AnimationPlayer

# We define the signal here
signal transition_halfway_done

func change_scene(target_path: String):
	# 1. Play the closing animation
	anim.play("scene_Switch")
	await anim.animation_finished
	
	# 2. Tell the game we are ready to swap scenes
	transition_halfway_done.emit()
	
	# 3. Actually swap the scene
	get_tree().change_scene_to_file(target_path)
	
	# 4. Play the opening animation
	anim.play_backwards("scene_Switch")
