"
I represent the transition from a Task State to the next, for a reason at a given time. I am a member of the list in TaskStateLog.
"
Class {
	#name : #STTaskStateTransition,
	#superclass : #Object,
	#instVars : [
		'toState',
		'when',
		'reason'
	],
	#category : #'SmallTeam-Model'
}

{ #category : #accessing }
STTaskStateTransition >> reason [

	^ reason
]

{ #category : #accessing }
STTaskStateTransition >> reason: anObject [

	reason := anObject
]

{ #category : #accessing }
STTaskStateTransition >> toState [

	^ toState
]

{ #category : #accessing }
STTaskStateTransition >> toState: anObject [

	toState := anObject
]

{ #category : #accessing }
STTaskStateTransition >> when [

	^ when
]

{ #category : #accessing }
STTaskStateTransition >> when: anObject [

	when := anObject
]
