"
I represet the state a STTask is in. (working, blocked, finished...). 

he inner state is represented as a Symbol.Class side has constructors for each symbol.

They can be:

- #initial -> initial state
- #working -> Someone is working on it
- #blocked -> Developer cannot continue
- #validation -> Waiting for user to validate the feature
- #abandoned -> Will not implement
- #finished -> Finished implementing

"
Class {
	#name : #STTaskState,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'SmallTeam-Model'
}

{ #category : #'instance creation' }
STTaskState class >> abandoned [
	"Create Task in #abandoned state"
	^ self new id: #abandoned
]

{ #category : #'instance creation' }
STTaskState class >> blocked [
	"Create Task in #blocked state"
	^ self new id: #blocked
]

{ #category : #'instance creation' }
STTaskState class >> finished [
	"Create Task in #finished state"
	^ self new id: #finished
]

{ #category : #'instance creation' }
STTaskState class >> validation [
	"Create Task in #validation state"
	^ self new id: #validation
]

{ #category : #'instance creation' }
STTaskState class >> working [
	"Create Task in #working state"
	^ self new id: #working
]

{ #category : #converting }
STTaskState >> asString [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^ 'TaskState[',self id asString capitalized,']'.
]

{ #category : #accessing }
STTaskState >> id [

	^ id ifNil: [ id := #init ]
]

{ #category : #accessing }
STTaskState >> id: anObject [

	id := anObject
]
