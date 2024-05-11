include <BOSL2/rounding.scad>
include <BOSL2/std.scad>

$fn = 96 * 4;
// $fn = 96;

INCHES_TO_MM = 25.4;
EXTRA = 0.1;

frame_thickness = 2;
frame_width = 50;
frame_bottom_back_length = 30;
frame_top_depth = 20;
frame_top_back_angle = 15;

monitor_top_bezel = 7;
// how much space should we leave between the bottom of the stand and the bottom
// of the bezel
monitor_top_clearance = 3;
monitor_depth = 25; // TODO: remeasure
monitor_back_angle = 115; // TODO: remeasure
// how deep is the front part of the webcam's stand
webcam_stand_depth = 13; // TODO: remeasure
extra_space_for_webcam_stand = 2;
frame_top_height = webcam_stand_depth + extra_space_for_webcam_stand;

module extrude_shape(width, thickness) {
    bottom_path = [
        [frame_bottom_back_length * cos(monitor_back_angle), -frame_bottom_back_length * sin(monitor_back_angle)],
        [0, 0],
        [monitor_depth + frame_thickness, 0],
        [monitor_depth + frame_thickness, -monitor_top_bezel - monitor_top_clearance],
    ];
    top_path = [
        [0, 0],
        [-frame_top_height * tan(frame_top_back_angle), frame_top_height],
        [frame_top_depth, frame_top_height],
        [frame_top_depth, 0],
    ];

    linear_extrude(width) {
        stroke(bottom_path, width=thickness);
        stroke(top_path, width=thickness);
    }
}

frame_bezel = 0.5;
hull() {
    up(frame_bezel)
        extrude_shape(frame_width - 2 * frame_bezel, frame_thickness);
    extrude_shape(frame_width, frame_thickness - 2 * frame_bezel);
}