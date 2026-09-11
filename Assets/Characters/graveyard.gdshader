shader_type canvas_item;
void fragment() {
 vec4 tex = texture(TEXTURE, UV);
 vec3 c = tex.rgb;
 // MOUNTAIN → GRAVEYARD
 // Naranja → Blanco
 if (distance(c, vec3(200.0, 76.0, 12.0) / 255.0) < 0.03) {
 c = vec3(252.0, 252.0, 252.0) / 255.0;
 }
 // Beige → Gris
 if (distance(c, vec3(252.0, 216.0, 168.0) / 255.0) < 0.03) {
 c = vec3(116.0, 116.0, 116.0) / 255.0;
 }
 // Azul → Azul
 // No necesitamos modificarlo.
 COLOR = vec4(c, tex.a);
}
