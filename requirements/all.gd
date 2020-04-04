extends "res://requirements/base.gd"

var requirements = Array()

func _ready():
	var children = _recursive_children(self, Array())
	for child in children:
		if "passed" in child:
			requirements.push_back(child)

# warning-ignore:unused_argument
func _process(delta):
	for requirement in requirements:
		if !requirement.passed:
			return
	# All requirements have passed
	passed = true

func _recursive_children(node, array):
	for child in node.get_children():
		array.append(child)
		_recursive_children(child, array)
	return array
