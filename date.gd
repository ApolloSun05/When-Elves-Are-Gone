class_name DateTime extends Resource

@export_range(0, 59) var seconds: int = 0
@export_range(0, 59) var minutes: int  = 0
@export_range(0, 23) var hours: int = 0

var delta_time: float = 0

func increase_by_secs(delta_seconds: float) -> void:
	delta_time +=  delta_seconds
	if delta_time < 1.0: return
	
	var delta_int_secs := int(delta_time)
	delta_time -= float(delta_int_secs)
	
	seconds += delta_int_secs
	minutes += seconds/60
	seconds %= 60
	
	hours += minutes/60
	minutes %= 60
	
	hours %= 24
