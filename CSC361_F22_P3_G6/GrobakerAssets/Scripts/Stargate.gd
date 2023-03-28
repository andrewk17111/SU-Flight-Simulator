#Author John Grobaker
extends Spatial

export var checkpoint_id: int

#At creation, set the global checkpoint locations with the positions
func _ready():
	$OmniLight.light_color = Color(255, 0, 0, 100)
	GlobalVariables.checkpoints[checkpoint_id] = $Position.global_transform.origin
	$StargateMesh/AnimationPlayer.play("Spin")

func _process(_delta):
	if GlobalVariables.current_checkpoint == checkpoint_id:
		$OmniLight.light_color = Color(0, 255, 0, 100)

#Detects if the player has entered the stargate
func _on_Area_Detector_body_entered(body):
	if body.name == "Starfox" and GlobalVariables.current_checkpoint == checkpoint_id:
		$OmniLight.light_color = Color(0, 0, 0, 100)
		GlobalVariables.current_checkpoint += 1
