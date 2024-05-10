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

monitor_top_bezel = 7;
monitor_top_clearance = 3;
monitor_depth = 25; // TODO: remeasure
monitor_back_angle = 115; // TODO: remeasure
webcam_stand_depth = 13;
extra_space_for_webcam_stand = 3;

bottom_path = [
    [frame_bottom_back_length * cos(monitor_back_angle), -frame_bottom_back_length * sin(monitor_back_angle)],
    [0, 0],
    [monitor_depth + frame_thickness, 0],
    [monitor_depth + frame_thickness, -monitor_top_bezel - monitor_top_clearance],
];
linear_extrude(frame_width)
    stroke(bottom_path, width=frame_thickness);