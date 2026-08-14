extends Node2D
var dialogue_text =  [""]
var dialogue_speaker =  [""]
var dialogue_sprite =  [""]
const textboxlocation = preload("res://TextEngine.tscn")
const wronglevellocation = preload("res://tutorial_wrong.tscn")
signal start
var textbox_exists = false

# I've set it so you just need to change the parameters and give that signal
#Give it a signal and a copy of this text and itll work!
func _ready() -> void:
	var textbox = textboxlocation.instantiate()
	textbox.finished.connect(_on_textbox_finished)
	dialogue_text =  ["Yippe that's good enough, you have a somewhat resemblance to someone who knows basic laws", "Oh i just guessed...", "...", "Hey we got a new call for a crime!",
	"oh this guy...You know what, you'll be with this cat-thing.", "My name's Cat Banana :3",
	"thats a dumb name", "Yeah well the developer was already in a big time crunch making this so give him some slack.",
	"Hey wait aren't we not supposed to know that???", "OH SHOOT YOU DONT KNOW WHAT KIND OF LORE ISSUES YOU CAUSED BY ACKNOLEDGING THAT",
	"Uhh lets just go back to the script (that i technically have no knowledge of it)",
	"Hey, narrator here again!", "Do you hear something-", "Uhh no you didn't", "Anyways I came here to tell you that this game talks about sensitive scenes such as murder, gore, insanity, depression, etc (since you are a homicide detective after all!).", "Ofcourse they are toned down and with cartoon characters, but i needed to put a warning! These scenes are really plot relevant so i couldn't censor them, some people might not want to experience those things.", "I recommend exiting here if you're uncomftable before you see anything as one will show up soon.",
	"That warning (that i cannonically do not hear) sounds kinda omminous", "Anyways, we're going to be late, so lets rush there!",
	"This shouldn't be that hard of a case!", "Its located a bit down from here, south on the map!"]
	dialogue_speaker =  ["Police Llama", "Cat Banana", "Police Llama", "Llama (Your parter!)", "Police Llama", "Cat Banana", "Llama","Cat Banana",
	"Llama", "Cat Banana", "Police Llame", "Narrator", "Llama","Narrator", "Narrator", "Narrator", "Narrator", "Llama", "Llama", "Cat Banana", "Llama", "Narrator"]
	dialogue_sprite =  ["randomLlama", "catBananaCry", "randomLlama", "llama", "randomLlama", "catBanana", "llamaConfused","catBananaCry",
	"llamaConfused", "catBananaDisgust", "randomLlama", "null", "llamaConfused","null", "null", "null", "null", "llamaCry", "llama", "catBanana", "llama", "null"]
	textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
	add_child(textbox)
	start.emit()

func _on_textbox_finished() -> void:
	get_tree().change_scene_to_file("res://tutorial_wrong.tscn")
