package schema

import "strings"

#Partner: {
	name!:  strings.MinRunes(1)
	logo!:  =~"^https?://"
	url?:   =~"^https?://"
}
