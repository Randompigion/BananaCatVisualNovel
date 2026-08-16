extends Node2D
var dialogue_text =  [""]
var dialogue_speaker =  [""]
var dialogue_sprite =  [""]
const textboxlocation = preload("res://TextEngine.tscn")
signal start
var textbox_exists = false
var evidence = {"monkeyChocolate" = 0, "cookieCorpse" = 0, "Knife" = 0, "crabChocolate" = 0, "hiddenCookie" = 0}
signal StartDetective

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
	"Rub your mouse and it, then click on those and you'll add it to your Evidence Log. When you get all of it, click your Llama partner to use it to make a comic of the sequence of events!",
	"Also you may need to check the areas that are outside the incident. Move your mouse to the corner of the screen to travel between places! Its a bit finicky, so try to go for the top corners",
	"Good luck and have fun!"]
	dialogue_speaker =  ["A Monkey?", "Monkey", "Crab?", "Llama", "Llama",
	"Cat Banana", "Llama", "Narrator", "Llama", "Narrator", "Llama", "Narrator", "Narrator", "Narrator", "Narrator", "Narrator"]
	dialogue_sprite =  ["monkey", "monkey", "null", "llamaConfused", "llama", "catBananaCry", "llama", "null", "llamaPoint", "null", "llama", "null", "null", "null", "null", "null", "null"]
	textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
	add_child(textbox)
	start.emit()

func _on_textbox_finished() -> void:
	if not evidence == {"monkeyChocolate" = 1, "cookieCorpse" = 1, "Knife" = 1, "crabChocolate" = 1, "hiddenCookie" = 1}:
		StartDetective.emit()
	else:
		get_tree().change_scene_to_file("res://1_st_think_game.tscn")


func _on_cursor_monkeydialouge() -> void:
	var textbox = textboxlocation.instantiate()
	textbox.finished.connect(_on_textbox_finished)
	dialogue_text =  ["hii im a monkey!!!", "Yeah i know that.", "What happened to the cookie?",
	"Oh he died of a heart attack. Did you know I'm a Monkey?!", "So you had no involvement whatsoever with his death?",
	"Yeah! I was just here, minding my buisness, when BOOM he dies of a heart attack and starts bleeding everywhere. I left everything the way it is. Did I mention that I'm a monkey?",
	"(Hey isn't that a chocolate stain near his mouth?)", "(Yeah it looks like one.)",
	"(Isn't it pretty strange that after a chocolate chip cookie dies, he suddenly gets a chocolate stain near his mouth?)",
	"He might not be as innocent as he seems..."]
	dialogue_speaker =  ["Monkey", "Cat Banana", "Llama", "Monkey", "Llama", "Monkey", "Llama", "Cat Banana",
	"Llama", "Cat Banana"]
	dialogue_sprite =  ["monkey", "catBanana", "llamaConfused", "monkey", "llama", "monkey", "llamaPoint", "catBanana", "llamaPoint", "catBanana"]
	textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
	add_child(textbox)
	start.emit()
	$MonkeyArea.queue_free()
	%MonkeyChocolate.visible = true
	evidence["monkeyChocolate"] = 1


func _on_cursor_cookie_corpse_dialouge() -> void:
	var textbox = textboxlocation.instantiate()
	textbox.finished.connect(_on_textbox_finished)
	dialogue_text =  ["Wait is this only part of him?", "Yeah it looks like part of him is cut off somehow.",
	"Thats strange. Also look at that pool of blood!", "Huh this must've been where he died! He doesn't seem to be moved, well most of him that is...",
	"Looking at the wound type, its easy to say that he died of a laceration.", "how do you know that...",
	"teehee >:3", "We should probably write this down!"]
	dialogue_speaker =  ["Cat Banana", "Llama", "Cat Banana", "Llama", "Cat Banana", "Llama", "Cat Banana", "Llama"]
	dialogue_sprite =  ["catBanana", "llama", "catBananaDisgust", "llamaConfused", "catBanana", "llamaFear", "catBananaInsane", "llamaFear"]
	textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
	add_child(textbox)
	start.emit()
	$CookieCorpseArea.queue_free()
	%CookieDead.visible = true
	evidence["cookieCorpse"] = 1


func _on_cursor_knife_dialouge() -> void:
	var textbox = textboxlocation.instantiate()
	textbox.finished.connect(_on_textbox_finished)
	dialogue_text =  ["Oh cool a knife! I can do so many cool tricks with it!", "That's evidence...", "Aw man :(",
	"Well its clear that this gotta be the thing that killed the cookie.", "There isn't anything else here that could do that...",
	"Wait didn't they say he died of a heart attack?", "Yeah?", "Theres blood on this knife, you know what that means?",
	"But then which one of them did it..."]
	dialogue_speaker =  ["Cat Banana", "Llama", "Cat Banana", "Cat Banana", "Cat Banana", "Llama", "Cat Banana", "Llama", "Cat Banana"]
	dialogue_sprite =  ["catBananaInsane", "llamaCry", "catBananaCry", "catBanana", "catBanana", "llamaConfused", "catBanana", "llamaPoint", "catBanana"]
	textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
	add_child(textbox)
	start.emit()
	$KnifeArea.queue_free()
	%Knife.visible = true
	evidence["Knife"] = 1


func _on_cursor_crab_dialouge() -> void:
	var textbox = textboxlocation.instantiate()
	textbox.finished.connect(_on_textbox_finished)
	dialogue_text =  ["Man i cant belive that cookie died!", "He died of a heart attack right?",
	"Yup. I had no involement whatsoever!", "Thats exactly what someone involved would say!",
	"(Plus you literally have chocolate near your mouth...)", "Yeah well its not like i would drag his body here to eat it!",
	"...", "Oh i just remembered something!", "Monkey called the cookie into that closed locked room before he died. Did you know he's a monkey?",
	"Still saying its a heart attack?", "Yeah! He was in there and then died of a knif-I MEAN HEART ATTACK"]
	dialogue_speaker =  ["Crab", "Llama", "Crab", "Llama", "Cat Banana", "Crab", "Llama", "Crab", "Crab", "Cat Banana", "Crab"]
	dialogue_sprite =  ["null", "llamaConfused", "null", "llamaDisgust", "catBanana", "null", "llamaFear", "null", "null", "catBanana", "null"]
	textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
	add_child(textbox)
	start.emit()
	$CrabCollision.queue_free()
	%CrabChocolate.visible = true
	evidence["crabChocolate"] = 1


func _on_cursor_hidden_body() -> void:
	var textbox = textboxlocation.instantiate()
	textbox.finished.connect(_on_textbox_finished)
	dialogue_text =  ["Wait a part of him was cut off and brought here.", "Huh. Why would it be here if the corpse is inside?",
	"It's most likely to dispose the body!", "You can easily hide bodies if you dig under the grass! They never find them!",
	"You're scary...", "And don't crabs burrow? It wouldn't be hard for him to hide  it!",
	"Hey wait there's some...bite marks... on the body???", "Huh thats weird, we should write this down!"]
	dialogue_speaker =  ["Cat Banana", "Llama", "Cat Banana", "Cat Banana (?)", "Llama", "Cat Banana", "Llama", "Cat Banana"]
	dialogue_sprite =  ["catBananaDisgust", "llamaConfused", "catBananaInsane", "catBananaDespair", "llamaGuilt", "catBananaInsane", "llamaFear", "catBanana"]
	textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
	add_child(textbox)
	start.emit()
	$HiddenCookie.queue_free()
	%HiddenCookie.visible = true
	evidence["hiddenCookie"] = 1


func _on_cursor_door() -> void:
	var textbox = textboxlocation.instantiate()
	textbox.finished.connect(_on_textbox_finished)
	dialogue_text =  ["Weren't we the ones who broke down the door?", "Yeah", "So its not relevant to his death.",
	"MAYBE THE DOOR KILLED HIM!", "...", "Lets just move on..."]
	dialogue_speaker =  ["Llama", "Cat Banana", "Llama", "Cat Banana", "Llama", "Llama"]
	dialogue_sprite =  ["llamaConfused", "catBanana", "llama", "catBanana", "llama", "llama"]
	textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
	add_child(textbox)
	start.emit()
	$Door.queue_free()


func _on_cursor_llama() -> void:
	if evidence == {"monkeyChocolate" = 1, "cookieCorpse" = 1, "Knife" = 1, "crabChocolate" = 1, "hiddenCookie" = 1}:
		var textbox = textboxlocation.instantiate()
		textbox.finished.connect(_on_textbox_finished)
		dialogue_text =  ["Okay that looks like everything. Now we just gotta think about how this went down.", "I need some time to think...",
		"Hey Narrator here! Did you say think? I guess its time for the thinking game!", "Basically you jump to decide where you want to go. You only need to click!",
		"Follow the path that makes sense with what your evidence says!", "Good Luck!", "next"]
		dialogue_speaker =  ["Llama", "Cat Banana", "Narrator", "Narrator", "Narrator", "Narrator", "Narrator"]
		dialogue_sprite =  ["llamaConfused", "catBanana", "null", "null", "null", "null", "null"]
		textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
		add_child(textbox)
		start.emit()
	else:
		var textbox = textboxlocation.instantiate()
		textbox.finished.connect(_on_textbox_finished)
		dialogue_text =  ["Hey we still don't have the full picture!", "Huh I'm missing evidence. If only there was an indicator on the top left telling me how many I need..."]
		dialogue_speaker =  ["Llama", "Cat Banana"]
		dialogue_sprite =  ["llamaConfused", "catBanana"]
		textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
		add_child(textbox)
		start.emit()
