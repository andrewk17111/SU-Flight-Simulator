#Author: John Grobaker
extends StaticBody

export(Resource) var Planetmesh 
var PlanetTexture = load("res://GrobakerAssets/Planets/Planets_Pallet.png")
var rng = RandomNumberGenerator.new()

#At creation set the speed of the planets
func _ready():
	#Set the speed of the planets
	rng.randomize()
	var playSpeed = rng.randf_range(.005, .01)
	$AnimationPlayer.playback_speed = playSpeed
	$AnimationPlayer.play("Spin")
	
	#Set the collision of planets
	$PlanetMesh.create_convex_collision()
	
	#Set the material of the mesh
	var PlanetMaterial = SpatialMaterial.new()
	PlanetMaterial.albedo_texture = PlanetTexture
	$PlanetMesh.set_surface_material(0, PlanetMaterial)
