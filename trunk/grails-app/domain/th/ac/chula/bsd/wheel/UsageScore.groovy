package th.ac.chula.bsd.wheel

class UsageScore {

	SpokeType sType
	UsageType uType
	int	score
	
    static constraints = {
		sType nullable: false
		uType nullable: false
		score nullable: false
    }
}

enum SpokeType{
	PAN,
	WIDE,
	NARROW,
	NET
	}

enum UsageType {
	CITY,
	HEAVY,
	LONGWAY,
	OFFROAD
}