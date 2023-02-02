Class {
	#name : #STDataTest,
	#superclass : #TestCase,
	#category : #'SmallTeam-DataBase-Test'
}

{ #category : #tests }
STDataTest >> testDevelperScafolded [
	"test default developers ar added"
			
	| albert |
	albert := STData developers at: 'Albert'.
	self assert: albert isNil not. 
]
