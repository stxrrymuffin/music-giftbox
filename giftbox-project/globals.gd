extends Node

var in_cutscene: bool = false

var played_through: bool = false

var total_points: int = 0

signal switchin_scene

func switch_scene():
	switchin_scene.emit()
