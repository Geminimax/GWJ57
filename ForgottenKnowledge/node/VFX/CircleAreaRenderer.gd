extends Node2D

var radius = 50
var rot = 0
var rot_speed = 30
var width = 3
var semi_circle_angle_spacing = 20
var semi_circle_angle_size = 15
var circle_color = Color.white
var follow
func _ready():
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame      .
func _process(delta):
    if(follow):
        global_position = follow.global_position
    update()
    rot+= delta * rot_speed


func _draw():
    var total_semi_length = (semi_circle_angle_size + semi_circle_angle_spacing)
    var semi_circle_amount = 360/total_semi_length
    for i in semi_circle_amount:
        var start_rad = (i * total_semi_length) + rot
        var end_rad = start_rad + semi_circle_angle_size
        draw_arc(Vector2(0,0),radius,deg2rad(start_rad),deg2rad(end_rad),5,circle_color,width,false)
