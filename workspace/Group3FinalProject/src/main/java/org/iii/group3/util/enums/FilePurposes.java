package org.iii.group3.util.enums;

public enum FilePurposes {
	
	CHAN_IMG("channel image"), EP_SOUND("ep sound file"), NOT_DEFINED("not defined");
	public String value;
	
	private FilePurposes(String purpose) {
		this.value = purpose;
	}
	
	public static FilePurposes build(String location) {
		
		switch (location) {
		case "channel/img":
			return FilePurposes.CHAN_IMG;

		case "episode/sound":
			return FilePurposes.EP_SOUND;
			
		default:
			return FilePurposes.NOT_DEFINED;
		}
	}
}
