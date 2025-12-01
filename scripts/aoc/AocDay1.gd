class_name AocDay1 extends AocSolution


func solve() -> int:
	var lines = get_lines(1)
	var rotation: int = 50
	var result: int = 0

	for line in lines:
		rotation = wrapi(rotation + _get_rotation_change(line), 0, 100)

		if rotation == 0:
			result += 1

	return result


func solve_part_2() -> int:
	var lines = get_lines(1)
	var rotation: int = 50
	var result: int = 0

	for line in lines:
		var rot := _get_rotation_change(line)
		var sgn := signi(rot)
		var remaining = abs(rot)

		while remaining > 0:
			remaining -= 1
			rotation += sgn
			rotation = wrapi(rotation, 0, 100)

			if rotation == 0:
				result += 1

	return result


func _get_rotation_change(line) -> int:
	var dir = -1 if line.begins_with("L") else 1
	var rot: int = int(line.substr(1))
	return rot * dir