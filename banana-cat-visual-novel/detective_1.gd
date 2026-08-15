extends Node2D
var dialogue_text =  [""]
var dialogue_speaker =  [""]
var dialogue_sprite =  [""]
const textboxlocation = preload("res://TextEngine.tscn")
signal start
var textbox_exists = false

# I've set it so you just need to change the parameters and give that signal
#Give it a signal and a copy of this text and itll work!
func _ready() -> void:
	var textbox = textboxlocation.instantiate()
	textbox.finished.connect(_on_textbox_finished)
	dialogue_text =  ["Oh no it looks like that cookie died!!!", "Oh what a shame", "I think he died of a heart attack,  so theres no point bothering trying to investigate at all!",
	"Hmm this looks suspicious...", "Look around and try to find anything that looks off, then talk to me when you're ready to piece everything together!",
	"WAIT WHY AM I DOING EVERYTHING?", "uhh think of this as some kinda tutorial to how the mechanics work", "Did i hear tutorial? Hey its me the narrator again!",
	"I swear im hearing something...", "Uhh its just the wind?", "huh sure that makes sense", "Anyways let me tell you how to do detective work!",
	"There are a few places that seem suspicious and stand out. Think bloodstains, knives, witnesses, basically anthing thats not the background",
	"Click on those and you'll add it to your Evidence Log. When you get all of it, click your Llama partner to use it to make a comic of the sequence of events! This system is heavily inspired by Danganronpa's, so if you played that i'll be a cakewalk!",
	"Also you may need to check the areas that are outside the incident. Move your mouse to the corner of the screen to travel between places!",
	"Good luck and have fun!"]
	dialogue_speaker =  ["A Monkey?", "Monkey", "Crab?", "Llama", "Llama",
	"Cat Banana", "Llama", "Narrator", "Llama", "Narrator", "Llama", "Narrator", "Narrator", "Narrator", "Narrator", "Narrator"]
	dialogue_sprite =  ["monkey", "monkey", "null", "llamaConfused", "llama", "catBananaCry", "llama", "null", "llamaPoint", "null", "llama", "null", "null", "null", "null", "null", "null"]
	textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
	add_child(textbox)
	start.emit()

func _on_textbox_finished() -> void:
	get_tree().change_scene_to_file("res://tutorial_wrong.tscn")
