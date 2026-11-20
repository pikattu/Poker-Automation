draw_self();

var w  = 20;
var bx = x - w / 2;
var by = y - 24;

draw_set_valign(fa_middle);
draw_set_halign(fa_right);
draw_set_color(c_white);

// ---- HP ----
draw_text_transformed(bx - 3, by, "HP", 0.8, 0.8, 0);

draw_line_width_color(bx, by, bx + w, by, 5, c_black, c_black);
var hw = w * clamp(hp / max_hp, 0, 1);
if (hw > 0) draw_line_width_color(bx, by, bx + hw, by, 3, c_red, c_red);

// ---- Energy ----
draw_text_transformed(bx - 3, by + 7, "E", 0.8, 0.8, 0);

draw_line_width_color(bx, by + 7, bx + w, by + 7, 5, c_black, c_black);
var ew = w * clamp(energy / max_energy, 0, 1);
if (ew > 0) draw_line_width_color(bx, by + 7, bx + ew, by + 7, 3, c_orange, c_orange);

// Reset drawing settings
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_white);