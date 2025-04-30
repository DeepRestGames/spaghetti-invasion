extends Node3D


func _on_proton_scatter_villaggio_build_completed() -> void:
	print(str(Time.get_ticks_msec()) + ": Foliage in villagio spawned!")


func _on_proton_scatter_salita_villaggio_chiesa_1_build_completed() -> void:
	print(str(Time.get_ticks_msec()) + ": Foliage in salita villaggio spawned!")


func _on_proton_scatter_fiume_build_completed() -> void:
	print(str(Time.get_ticks_msec()) + ": Foliage in fiume spawned!")
