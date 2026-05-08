///@description Create

//create = true;

startFight = false;

secondphase = false;

// Background

sprBG = bg_MKSS_BgEnv_StarlessMarxArena;
sprBGPal = bg_MKSS_BgEnv_StarlessMarxArena_Palette_Normal;

bgX = 0;
bgY = 0;

bgVDir = 1;

bgSp = 0.25;

palIndex = 0;
alpha = 1;

// Set Background layer's alpha to 0
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);
layer_background_alpha(back_id, 0);

// Scrolling Ground

sprTileRow1 = spr_MKSS_BgEnv_StarlessMarxArena_Ground_Row1;
sprTileRow2 = spr_MKSS_BgEnv_StarlessMarxArena_Ground_Row2;
sprTileRow3 = spr_MKSS_BgEnv_StarlessMarxArena_Ground_Row3;
sprTileRow4 = spr_MKSS_BgEnv_StarlessMarxArena_Ground_Row4;
sprTileRow5 = spr_MKSS_BgEnv_StarlessMarxArena_Ground_Row5;

rowSpeed[0] = 5;
rowSpeed[1] = 4;
rowSpeed[2] = 3;
rowSpeed[3] = 2;
rowSpeed[4] = 1;

starsWidth = 400;
stars1X = 0;
stars1Spd = .6;
stars2X = 0;
stars2Spd = .4;
stars3X = 0;
stars3Spd = .2;

//// Background
//sprBG = spr_marxsoul_bg;
//sprPal = bg_MKSS_BgEnv_StarlessMarxArena_Palette_Normal;

//tileRowPrefObj = obj_MKSS_BgEnv_StarlessMarxArena_Ground;

var tileRow1a = instance_create_depth(0,room_height,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow1a.sprIdle = sprTileRow5;
var tileRow1b = instance_create_depth(256,room_height,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow1b.sprIdle = sprTileRow5;
var tileRow1c = instance_create_depth((256*2),room_height,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow1c.sprIdle = sprTileRow5;
var tileRow1d = instance_create_depth((256*3),room_height,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow1d.sprIdle = sprTileRow5;
tileRow1a.maxHsp = -4 * .75;
tileRow1b.maxHsp = tileRow1a.maxHsp;
tileRow1c.maxHsp = tileRow1a.maxHsp;
tileRow1d.maxHsp = tileRow1a.maxHsp;
tileRow1a.accel = 0.5/16 * .75;
tileRow1b.accel = tileRow1a.accel;
tileRow1c.accel = tileRow1a.accel;
tileRow1d.accel = tileRow1a.accel;

var spriteHeight = sprite_get_height(sprTileRow5);
var tileRow1a = instance_create_depth(0,room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow1a.sprIdle = sprTileRow4;
var tileRow1b = instance_create_depth(256,room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow1b.sprIdle = sprTileRow4;
var tileRow1c = instance_create_depth((256*2),room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow1c.sprIdle = sprTileRow4;
var tileRow1d = instance_create_depth((256*3),room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow1d.sprIdle = sprTileRow4;
tileRow1a.maxHsp = -4 * .75;
tileRow1b.maxHsp = tileRow1a.maxHsp;
tileRow1c.maxHsp = tileRow1a.maxHsp;
tileRow1d.maxHsp = tileRow1a.maxHsp;
tileRow1a.accel = 0.5/16 * .75;
tileRow1b.accel = tileRow1a.accel;
tileRow1c.accel = tileRow1a.accel;
tileRow1d.accel = tileRow1a.accel;

spriteHeight += sprite_get_height(sprTileRow4);
var tileRow2a = instance_create_depth(0,room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow2a.sprIdle = sprTileRow3;
var tileRow2b = instance_create_depth(256,room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow2b.sprIdle = sprTileRow3;
var tileRow2c = instance_create_depth((256*2),room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow2c.sprIdle = sprTileRow3;
var tileRow2d = instance_create_depth((256*3),room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow2d.sprIdle = sprTileRow3;
tileRow2a.maxHsp = -3 * .75;
tileRow2b.maxHsp = tileRow2a.maxHsp;
tileRow2c.maxHsp = tileRow2a.maxHsp;
tileRow2d.maxHsp = tileRow2a.maxHsp;
tileRow2a.accel = 0.25/16 * .75;
tileRow2b.accel = tileRow2a.accel;
tileRow2c.accel = tileRow2a.accel;
tileRow2d.accel = tileRow2a.accel;

spriteHeight += sprite_get_height(sprTileRow3);
var tileRow3a = instance_create_depth(0,room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow3a.sprIdle = sprTileRow2;
var tileRow3b = instance_create_depth(256,room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow3b.sprIdle = sprTileRow2;
var tileRow3c = instance_create_depth((256*2),room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow3c.sprIdle = sprTileRow2;
var tileRow3d = instance_create_depth((256*3),room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow3d.sprIdle = sprTileRow2;
tileRow3a.maxHsp = -2 * .75;
tileRow3b.maxHsp = tileRow3a.maxHsp;
tileRow3c.maxHsp = tileRow3a.maxHsp;
tileRow3d.maxHsp = tileRow3a.maxHsp;
tileRow3a.accel = 0.125/16 * .75;
tileRow3b.accel = tileRow3a.accel;
tileRow3c.accel = tileRow3a.accel;
tileRow3d.accel = tileRow3a.accel;

spriteHeight += sprite_get_height(sprTileRow2);
var tileRow4a = instance_create_depth(0,room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow4a.sprIdle = sprTileRow1;
var tileRow4b = instance_create_depth(256,room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow4b.sprIdle = sprTileRow1;
var tileRow4c = instance_create_depth((256*2),room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow4c.sprIdle = sprTileRow1;
var tileRow4d = instance_create_depth((256*3),room_height - spriteHeight,1099,obj_MKSS_BgEnv_StarlessMarxArena_Ground);
tileRow4d.sprIdle = sprTileRow1;
tileRow4a.maxHsp = -1 * .75;
tileRow4b.maxHsp = tileRow4a.maxHsp;
tileRow4c.maxHsp = tileRow4a.maxHsp;
tileRow4d.maxHsp = tileRow4a.maxHsp;
tileRow4a.accel = 0.0625/16 * .75;
tileRow4b.accel = tileRow4a.accel;
tileRow4c.accel = tileRow4a.accel;
tileRow4d.accel = tileRow4a.accel;