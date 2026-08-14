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
	dialogue_text =  ["So this is the new guy trying to apply for the job?", "Do you even know anything about how the police works?", "Nope :3", "...", "I hate my life","But i'm really passionate about breaki- I MEAN FOLLOWING the law!", "I would never apply here just so i could hide my money laundering scheme!", "We're already pretty short-staffed as is, so i'm just going to pretend i didn't hear that",
	 "Given as you are not corrupt *at all* (and the only person who actually applied), you'll just get the job.", "Yippeee!! More money launder-I Mean detective work! Hey random question but can i be incharge of any investigations for money laundering perchance?", "...", "it sounds like you're just going to hide your own laundering scheme... so no", "darn it", "Oh wait i'm required to give you some sort of \"Enterance Exam\" which lets us know you understand the law somewhat", "To be honest, i dont feel like administering one, so just click on whatever looks like its illegal and i'll say you know it.", "Oh it says this exam is \"coded badly but its near the ysws deadlines so i couldn't bug fix, sorry :(\", so hold E while entering the area and it should fix? Idk what that means", "Okay uhh just find which one of these are breaking the law and we'll say you know enough to get hired",
	"Heyyy its me the narrator so i'm here to explain these minigames work. Basically just click what's going against the prompt, and thats it!", "if it doesn't work, keep the mouse held down and exit and re-enter the area", "next"]
	dialogue_speaker =  ["Police Llama", "Police Llama", "Cat Banana (YOU)", "Police Llama","Police Llama", "Cat Banana","Cat Banana","Police Llama", "Police Llama", "Cat Banana", "Police Llama", "Police Llama", "Cat Banana", "Police Llama", "Police Llama", "Police Llama", "Police Llama", "Narrator", "Narrator", "Narrator"]
	dialogue_sprite =  ["randomLlama", "randomLlama", "catBanana", "randomLlama","randomLlama", "catBanana","catBanana", "randomLlama", "randomLlama", "catBanana", "randomLlama", "randomLlama", "catBanana", "randomLlama", "randomLlama", "randomLlama", "randomLlama", "null", "null", "null"]
	textbox.newDialouge(dialogue_text,dialogue_speaker,dialogue_sprite)
	add_child(textbox)
	start.emit()

func _on_textbox_finished() -> void:
	get_tree().change_scene_to_file("res://tutorial_wrong.tscn")
