class_name Util

## Ye Who Enter Here
##
## Godot's built-in editor can save over other files. This is frustrating when, say,
## you're editing a scene and making changes to its code; saving the scene may revert
## code changes.
##
## To alleviate:
##   * Turn ON Editor/Editor Settings/Text Editor/Behavior/Files/Auto Reload Scripts on External Change;
##   * Close all files on Godot's built-in script editor;
##   * In the Script tab, turn ON Debug/Debug With External Editor.

## Code Order (from https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html)

## 01. @tool
## 02. class_name
## 03. extends
## 04. # docstring
##
## 05. signals
## 06. enums
## 07. constants
## 08. @export variables
## 09. public variables
## 10. private variables
## 11. @onready variables
##
## 12. optional built-in virtual _init method
## 13. optional built-in virtual _enter_tree() method
## 14. built-in virtual _ready method
## 15. remaining built-in virtual methods
## 16. public methods
## 17. private methods
## 18. subclasses


## A wrapper around `load()` that errors if the filepath isn't found.
static func safe_load(path: String) -> Resource:
	if not ResourceLoader.exists(path):
		printerr("Couldn't find file: " + path)

	return load(path)


static func sum(a, b):
	return a + b


static func mult(a, b):
	return a * b


static func to_int(n: String) -> int:
	return int(n)


static func get_lines(string: String) -> Array:
	return Array(string.strip_edges().split("\n"))