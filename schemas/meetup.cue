package schema

import "strings"

#Meetup: {
	name!:        strings.MinRunes(2)
	start!:       =~"^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}[+-][0-9]{2}:[0-9]{2}$"
	end!:         =~"^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}[+-][0-9]{2}:[0-9]{2}$"
	description!: strings.MinRunes(10)
	cover!:       =~"^https?://"

	location!: {
		name!:    strings.MinRunes(2)
		map_url?: =~"^https?://"
	}

	stream_url?:       =~"^https?://"
	registration_url?: =~"^https?://"

	speakers?: [...#MeetupSpeaker]

	schedule?: [...#ScheduleItem]

	photos?: [...{
		url!:  =~"^https?://"
		type?: "image" | "folder"
	}]

	videos?: [...{
		title!:     strings.MinRunes(2)
		embed_url!: =~"^https?://"
	}]
}

#MeetupSpeaker: {
	name!:             strings.MinRunes(2)
	title!:            strings.MinRunes(2)
	bio!:              strings.MinRunes(10)
	image!:            =~"^https?://"
	talk_title!:       strings.MinRunes(2)
	talk_description!: strings.MinRunes(10)
	slides_url?:       =~"^https?://"
	recording_url?:    =~"^https?://"
	socials?: [...#Social]
}

#ScheduleItem: {
	time!:  strings.MinRunes(3)
	title!: strings.MinRunes(2)
	type!:  "networking" | "talk" | "panel" | "workshop" | "open_discussion" | "break"
	lead?:  string | null
	resources?: [...{
		title!: strings.MinRunes(2)
		url!:   =~"^https?://"
	}]
}
