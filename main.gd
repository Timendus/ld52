extends Spatial


func harvest_point_object():
	# Hier code voor het oppakken van punten doormiddel van een graan oid
	var harvest = 0
	
	# Add point to current score
	ScoreController.add_to_current_score(1)
	
	
	harvest.connect("collect", $UserInterface/ScoreLabel, "point_collected")
