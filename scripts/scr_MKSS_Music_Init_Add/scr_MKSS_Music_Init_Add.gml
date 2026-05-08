///@description MKSS - Music - Init - Add

function scr_MKSS_Music_Init_Add(targetID,targetName,targetAuthor,targetAudio,targetLoopBegin = 0,targetTimestamps = [])
{
	var targetMappedID = ds_map_size(global.MKSS_MusicIDs);
	ds_map_add(global.MKSS_MusicIDs,targetID,targetMappedID);
		
	global.MKSS_MusicList[global.MKSS_MusicIDs[? targetID]] = 
	{
        ID: targetID,
		name: targetName,
		author: targetAuthor,
		audio: targetAudio,
		loopBegin: targetLoopBegin,
		timestamps: targetTimestamps,
		
		isUnlocked: false
    };
	
	audio_sound_loop_start(targetAudio,targetLoopBegin);
	
	return targetMappedID;
}