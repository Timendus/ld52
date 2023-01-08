extends Node

var menu_music = load("res://music/menu.mp3")
var track1_leader_music = load("res://music/track1-leader.mp3")
var track1_music = load("res://music/track1.mp3")
var track2_leader_music = load("res://music/track2-leader.mp3")
var track2_music = load("res://music/track2.mp3")

var playing
const NOTHING = -1
const MENU = 0
const TRACK1 = 1
const TRACK2 = 2

const CHICKEN = 1
const CRASH = 2
const PICKUP = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	track1_leader_music.loop = false
	track2_leader_music.loop = false
	menu_music.loop   = true
	track1_music.loop = true
	track2_music.loop = true
	playing = NOTHING

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

func playSFX(fx):
	if fx == CHICKEN:
		$Chicken.play()
	if fx == CRASH:
		$Crash.play()
	if fx == PICKUP:
		$Pickup.play()

# Callback handler when a song finishes playing (not counting looping songs)
# Used to start the real song after the leader finishes
func _on_Music_finished():
	$MusicLoop.play()

func notYetPlaying(song):
	if playing != song:
		playing = song
		return true
	return false
