package th.ac.chula.bsd.wheel
import grails.validation.Validateable

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

@Validateable
enum SpokeType{
	PAN,
	WIDE,
	NARROW,
	NET
	}

@Validateable
enum UsageType {
	CITY,
	HEAVY,
	LONGWAY,
	OFFROAD
}