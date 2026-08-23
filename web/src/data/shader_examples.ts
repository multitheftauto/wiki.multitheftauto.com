export interface ShaderItem {
  title: string;
  image: string;
  description: string;
  downloadUrl: string;
}

export const shaders: ShaderItem[] = [
  {
    title: "Roadshine",
    image: "Shaders/roadshine.jpg",
    description: "This resource creates a light reflection effect on the ground (looks best when moving).",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_roadshine3.zip"
  },
  {
    title: "UV Scroll",
    image: "Shaders/uvscroll.jpg",
    description: "This resource scrolls a texture from left to right. It doesn't use vertex or pixels shaders, so it should work on all hardware.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_uv_scroll.zip"
  },
  {
    title: "UV scripted",
    image: "Shaders/uvscripted.jpg",
    description: "This resource controls a texture's UVs using Lua. It shows that anything is possible if you can imagine it.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_uv_scripted.zip"
  },
  {
    title: "Car paint",
    image: "Shaders/carpaint.jpg",
    description: "This resource shows you how to apply a shader to the vehicle models. The shader itself is not that great, so don't get your hopes up.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_car_paint.zip"
  },
  {
    title: "Water",
    image: "Shaders/water.jpg",
    description: "This resource applies a shader to the GTA world water. The Lua script shows how to use a timer to transfer the conventional water color setting to the shader.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_water.zip"
  },
  {
    title: "Bloom",
    image: "Shaders/bloom.jpg",
    description: "This resource shows you how 'bounce' full screen effects using a render target pool. It uses the onClientHUDRender event to exclude the HUD from the effect.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_bloom.zip"
  },
  {
    title: "Block world",
    image: "Shaders/blockworld.jpg",
    description: "This resource makes the textures look all blocky. It also changes colors when the 'k' key is pressed.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_block_world.zip"
  },
  {
    title: "Texture names",
    image: "Shaders/texnames.jpg",
    description: "This resource is only a tool, and doesn't do anything pretty. It shows a list of the current visible texture names, and highlights the selected texture. Ideal for finding a texture name to use with engineApplyShaderToWorldTexture.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_tex_names.zip"
  },
  {
    title: "Skid marks",
    image: "Shaders/skidmarks.jpg",
    description: "This resource shows you how to do multiple passes in a shader, and input different variables to the vertex shader for each pass. Use the command /skidmarks 1-4 to see the different effects. (You have skid a car to see it!)",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_skidmarks.zip"
  },
  {
    title: "HDR contrast",
    image: "Shaders/hdr.jpg",
    description: "This resource applies a 'High Dynamic Range' contrast effect. It uses a 1 pixel render target to sample the whole scene, and then uses that to brighten or darken the next frame. So going into somewhere dark will automatically brighten the scene, and visa versa",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_contrast.zip"
  },
  {
    title: "Tessellation",
    image: "Shaders/tesselation.jpg",
    description: "This resource shows how to use shader tessellation to animate the shape of a dxDrawImage and use shader transform to give it a 3rd dimension. The example has a GUI (press numpad-8) so you can fiddle with the settings.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_flag.zip"
  },
  {
    title: "Radial blur",
    image: "Shaders/radialblur.jpg",
    description: "This resource sort of looks a little bit like the GTAIV motion blur you get when you move the mouse quickly, or drive a fast car. The fast car effect is a bit more subtle than the screen shot would suggest, as it leaves the center of the screen nice and clear so you can see where you are going.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_radial_blur.zip"
  },
  {
    title: "Detail",
    image: "Shaders/detail.jpg",
    description: "Applies a few monochrome detail textures, at various scales, to (parts of) the world.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_detail.zip"
  },
  {
    title: "Ped morph",
    image: "Shaders/pedmorph.jpg",
    description: "This resource uses a vertex shader to modify the geometry of a ped model as it is rendered. When the resource has started, use the 'k' and 'l' keys to change morph size.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_ped_morph.zip"
  },
  {
    title: "Ped shell",
    image: "Shaders/pedshell.jpg",
    description: "This resource draws a translucent effect as a shader layer. The first pass is done by GTA, and the vertex shader is only applied in the second to add the effect 'on top' of the standard output. When the resource has started, use the 'm' key to see the shell effect.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_ped_shell.zip"
  },
  {
    title: "Hud mask",
    image: "Shaders/hud_mask.jpg",
    description: "This resource shows how to draw a hud texture with a shape mask.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_hud_mask.zip"
  },
  {
    title: "Circle",
    image: "Shaders/circle.jpg",
    description: "This resource exports a 'dxDrawCircle' function for use in your own scripts.",
    downloadUrl: "https://nightly.mtasa.com/files/shaders/shader_circle.zip"
  }
];