"
I represent the log of state changes in a STTask. I hold a list of STTaskStateTransition.
"
Class {
	#name : #STTaskStateLog,
	#superclass : #Object,
	#instVars : [
		'transitions',
		'task'
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
	^ self transitions ifEmpty: nil ifNotEmpty: [ (self transitions at: 1) toState ].
]

{ #category : #accessing }
STTaskStateLog >> saveToDb: aDb [
	self transitions do: [ :t |
		aDb execute: '
			INSERT INTO task_state_log(
				task_title, task_creation_date,
				to_state, changed_at)
			VALUES (?,?,?,?)
			ON CONFLICT DO NOTHING
		' 
		value: (self task title)
		value: (self task creationDate)
		value: t toState id
		value: t when
	]
]

{ #category : #accessing }
STTaskStateLog >> task [

	^ task ifNil: [ task := nil ]
]

{ #category : #accessing }
STTaskStateLog >> task: anObject [

	task := anObject
]

{ #category : #accessing }
STTaskStateLog >> transitions [

	^ transitions ifNil: [ transitions := OrderedCollection new ]
]

{ #category : #accessing }
STTaskStateLog >> transitions: anObject [

	transitions := anObject
]
