Class {
	#name : #STTaskStateLogTest,
	#superclass : #TestCase,
	#category : #'SmallTeam-Model-Test'
}

{ #category : #tests }
STTaskStateLogTest >> testChangeStateTo [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
			
	| st  s |
	st := STTaskStateLog new.
	s := STTaskState working.
	st changeStateTo: s.
	self assert: (st currentState id) equals: #working. 
	
]
