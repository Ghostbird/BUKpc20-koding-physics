
extends Node2D

export(String) var next_level;

var passed = false;

func _process(delta):
	# Requirements passed and there is a next level
	if (passed and next_level != null):
		# Go to the next level
		get_tree().change_scene("res://levels/" + next_level + ".tscn")
