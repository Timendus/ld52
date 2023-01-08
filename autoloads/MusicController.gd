extends Node

# Music files
var menu_music = load("res://music/menu.mp3")
var track1_leader_music = load("res://music/track1-leader.mp3")
var track1_music = load("res://music/track1.mp3")
var track2_leader_music = load("res://music/track2-leader.mp3")
var track2_music = load("res://music/track2.mp3")

# Sound effect files
var chicken_sfx = load("res://assets/soundeffects/chicken.mp3")
var crash_sfx = load("res://assets/soundeffects/crash.mp3")
var level_sfx = load("res://assets/soundeffects/level.mp3")
var pickup_sfx = load("res://assets/soundeffects/pickup.mp3")
var engine_sfx = load("res://assets/soundeffects/engine.mp3")
var countdown_sfx = load("res://assets/soundeffects/countdown.mp3")

# Internal state and consts
var playing
var engine_audio

const NOTHING = -1
const MENU = 0
const TRACK1 = 1
const TRACK2 = 2

const CHICKEN = 1
const CRASH = 2
const PICKUP = 3
const LEVEL = 4
const COUNTDOWN = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	menu_music.loop   = true
	track1_leader_music.loop = false
	track2_leader_music.loop = false
	track1_music.loop = true
	track2_music.loop = true

	chicken_sfx.loop = false
	crash_sfx.loop = false
	level_sfx.loop = false
	pickup_sfx.loop = false
	engine_sfx.loop = true
	countdown_sfx.loop = false

	playing = NOTHING

# Music stuff

func play_menu():
	if notYetPlaying(MENU):
		$MusicLoop.stream = menu_music
		$MusicLoop.play()

func play_track1():
	if notYetPlaying(TRACK1):
		$MusicLeader.stream = track1_leader_music
		$MusicLoop.stream = track1_music
		$MusicLeader.play()

func play_track2():
	if notYetPlaying(TRACK2):
		$MusicLeader.stream = track2_leader_music
		$MusicLoop.stream = track2_music
		$MusicLeader.play()

func notYetPlaying(song):
	if playing != song:
		playing = song
		return true
	return false

# Callback handler when a song finishes playing (not counting looping songs)
# Used to start the real song after the leader finishes
func _on_Music_finished():
	$MusicLoop.play()

# Sound effects stuff

func playSFX(fx):
	var effect = AudioStreamPlayer.new()
	match fx:
		CHICKEN:   effect.stream = chicken_sfx
		CRASH:     effect.stream = crash_sfx
		PICKUP:    effect.stream = pickup_sfx
		LEVEL:     effect.stream = level_sfx
		COUNTDOWN: effect.stream = countdown_sfx
	add_child(effect)
	effect.play()
	effect.connect("finished", self, "_remove_Player", [effect])

func _remove_Player(effect):
	remove_child(effect)

func engine_start():
	engine_audio = AudioStreamPlayer.new()
	engine_audio.stream = engine_sfx
	add_child(engine_audio)
	engine_audio.play()

func engine_stop():
	engine_audio.stop()
