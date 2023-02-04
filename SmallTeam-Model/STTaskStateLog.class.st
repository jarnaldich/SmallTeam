"
I represent the log of state changes in a STTask. I hold a list of STTaskStateTransition.
"
Class {
	#name : #STTaskStateLog,
	#superclass : #Object,
	#instVars : [
		'transitions'
	],
	#category : #'SmallTeam-Model'
}

{ #category : #'as yet unclassified' }
STTaskStateLog >> changeStateTo: aState [ 
	"Add a new state"
	self changeStateTo: aState because: nil.
]

{ #category : #'as yet unclassified' }
STTaskStateLog >> changeStateTo: aState because: aString [
	"Add a new state"
			
	| st |
	st:= STTaskStateTransition new
			when: DateAndTime now;
			toState: aState;
			reason: aString.
			 
	self transitions addFirst: st.
]

{ #category : #'as yet unclassified' }
STTaskStateLog >> currentState [  
	"return current state"
	^ (self transitions at: 1) toState.
]

{ #category : #accessing }
STTaskStateLog >> transitions [

	^ transitions ifNil: [ transitions := OrderedCollection new ]
]

{ #category : #accessing }
STTaskStateLog >> transitions: anObject [

	transitions := anObject
]
