Class {
	#name : #STTaskStateTest,
	#superclass : #TestCase,
	#category : #'SmallTeam-Model-Test'
}

{ #category : #tests }
STTaskStateTest >> testCreation [
	"Test instance creation"
	self assert: STTaskState new id equals: #init.
	#(working finished blocked abandoned) do: [ :messageId |
		| s |
		s := STTaskState perform: messageId.
		self assert: s id equals: messageId ]
]
