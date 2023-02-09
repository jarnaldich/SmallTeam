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
STTaskState class >> activeSymbols [
	"Create Task in #working state"
	^ #(blocked validation working).
]

{ #category : #'instance creation' }
STTaskState class >> allNames [
	"Create Task in #working state"
	^ self allSymbols collect: [ :s | s asString capitalized ].
]

{ #category : #'instance creation' }
STTaskState class >> allSymbols [
	"priorize -> assigned -> [ working blocked abandoned ] -> validation? -> finished "	
	^ #(assigned abandoned blocked finished validation working priorize).
]

{ #category : #'instance creation' }
STTaskState class >> assigned [
	"Create Task in #assigned state"
	^ self new id: #assigned
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
STTaskState class >> named: aSymbolOrString [
	"Create Task in #working state"
	^ self perform: (aSymbolOrString asString asLowercase asSymbol).
]

{ #category : #'instance creation' }
STTaskState class >> priorize [
	"Create Task in #priorize state"
	^ self new id: #priorize
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

{ #category : #accessing }
STTaskState >> isActive [

	^ self class activeSymbols includes: self id.
]

{ #category : #converting }
STTaskState >> name [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^ self id asString capitalized.
]
