/// delete_surface(surf)

var surf = argument0;

surface_set_target(surf);
draw_clear_alpha(c_black, 0);
surface_reset_target( );
surface_free(surf);

