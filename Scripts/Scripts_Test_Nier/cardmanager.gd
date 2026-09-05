extends Node2D

const COLLISION_MASK_CARD_SLOT = 2
const COLLISION_MASK_CARD = 1

# Reference to the card currently being dragged (null if none)
var card_being_dragged
# Stores the size of the screen/viewport, used to clamp the card's movement
var screen_size
# Stores the difference between the card's position and the mouse position at the moment of the click,
# so the card doesn't "jump" to the center of the cursor when dragging starts
var drag_offset := Vector2.ZERO
var is_hovering_on_card
var player_hand_reference
func _ready() -> void:
	# Get the viewport size once, when the scene starts
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Only run the drag logic if a card is currently selected
	if card_being_dragged:
		# Get the current mouse position in global space
		var mouse_pos = get_global_mouse_position()
		
		# Update the card's position to follow the mouse,
		# using clamp to keep it within screen bounds (X and Y axes)
		card_being_dragged.position = Vector2(
			clamp(mouse_pos.x, 0, screen_size.x), 
			clamp(mouse_pos.y, 0, screen_size.y)
		)
		player_hand_reference = $"../PlayerHand"

func _input(event):
	# Check if the event is a mouse click and if it was the left button
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		
		if event.pressed:		
			var card = raycast_check_for_card()
			if card:
				start_drag(card)
		else:
			if card_being_dragged:
				finish_drag()

func start_drag(card):
	card_being_dragged = card
	card.scale = Vector2(1.3, 1.3)
func finish_drag():
	player_hand_reference.remove_card_from_hand(card_being_dragged)
	card_being_dragged.scale = Vector2(1.2, 1.2)
	var card_slot_found = raycast_check_for_cardslot()
	if card_slot_found and not card_slot_found.card_in_slot:
		card_being_dragged.position = card_slot_found.position
		card_being_dragged.get_node("Area2D/CollisionShape2D").disabled = true
		card_slot_found.card_in_slot = true
	else:
		player_hand_reference.add_card_to_hand(card_being_dragged)
	card_being_dragged = null
func raycast_check_for_cardslot():
	# Get the 2D world's physics state, needed for collision queries
	var space_state = get_world_2d().direct_space_state
	
	# Create the parameters for the point query (position to be checked)
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	
	# Allow the query to detect Area2D nodes (not just solid physics bodies)
	parameters.collide_with_areas = true
	
	# Define the collision layer to be considered in the search
	parameters.collision_mask = COLLISION_MASK_CARD_SLOT
	
	# Run the query and return a list of collisions found at that point
	var result = space_state.intersect_point(parameters)
	
	if result.size() > 0:
		# If something was found, print the result for debugging
		print(result)
		# Return the parent node of the found collider
		# (assuming the collision Area2D is a child of the actual "Card" node)
		return result[0].collider.get_parent()
	
	# No card found under the cursor
	return null

func connect_card_signals(card):
	card.connect("hovered", on_hovered_over_card)
	card.connect("hovered_off", on_hovered_off_card)
# Called when the node enters the scene tree for the first time.
func on_hovered_over_card(card):
	if !is_hovering_on_card:
		is_hovering_on_card = true
		highlight_card(card, true)
	
func on_hovered_off_card(card):
	if !card_being_dragged:
		is_hovering_on_card=false;
		highlight_card(card, false)
		var new_card_hovered = raycast_check_for_card()
		if new_card_hovered:
			highlight_card(new_card_hovered, true)
	
func highlight_card(card, hovered):
	if hovered:
		card.scale = Vector2(1.2, 1.2)
		card.z_index = 2
	else:
		card.scale = Vector2(1.3, 1.3)
		card.z_index = 1

func raycast_check_for_card():
	# Get the 2D world's physics state, needed for collision queries
	var space_state = get_world_2d().direct_space_state
	
	# Create the parameters for the point query (position to be checked)
	var parameters = PhysicsPointQueryParameters2D.new()
	parameters.position = get_global_mouse_position()
	
	# Allow the query to detect Area2D nodes (not just solid physics bodies)
	parameters.collide_with_areas = true
	
	# Define the collision layer to be considered in the search
	parameters.collision_mask = 1
	
	# Run the query and return a list of collisions found at that point
	var result = space_state.intersect_point(parameters)
	
	if result.size() > 0:
		# If something was found, print the result for debugging
		print(result)
		
		# Return the parent node of the found collider
		# (assuming the collision Area2D is a child of the actual "Card" node)
		return get_card_with_highest_z_index(result)
	
	# No card found under the cursor
	return null

func get_card_with_highest_z_index(cards):
	var highest_z_card = cards[0].collider.get_parent()
	var highest_z_index = highest_z_card.z_index
	for i in range(1, cards.size()):
		var current_card = cards[i].collider.get_parent()
		if current_card.z_index > highest_z_index:
			highest_z_card = current_card
			highest_z_index = current_card.z_index
	return highest_z_card
# Called every frame. 'delta' is the elapsed time since the previous frame.
