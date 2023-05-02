"
I am a STTask. I represent the minimun unit of work that can be assigned to a developer.

I gather information for

- Title and description
- Reference to external info (mail...)
- Who am I assigned to.
- The log of states I have been in.
- The estimated duration.


"
Class {
	#name : #STTask,
	#superclass : #Object,
	#instVars : [
		'assignedTo',
		'creationDate',
		'taskStateLog',
		'estimatedDuration',
		'title',
		'description',
		'refDoc',
		'priority',
		'type',
		'project'
	],
	#category : #'SmallTeam-Model'
}

{ #category : #'instance creation' }
STTask class >> withTitle: aString [
	"initialize a task with a title"
	^ self new 
		title: aString;
		creationDate: (DateAndTime now).
		 
]

{ #category : #accessing }
STTask >> archive [
	| newState |
	
	newState := (STTaskState new id: #archived).		
	self taskStateLog changeStateTo: newState.
]

{ #category : #accessing }
STTask >> asDictionary [
	^ { 	
		'assignedTo' -> (self assignedTo ifNotNil: [:d | d name]) .
	'creationDate' -> (self creationDate) .
	'title' -> (self title) . 
	'description' -> (self description) .
	'priority' -> (self priority) .
	'refDoc' -> (self refDoc) .
	'type' -> (self type name) . 
	'project' -> (self project ifNotNil: [:p | p name] ) } asDictionary.
	


]

{ #category : #accessing }
STTask >> assignedTo [

	^ assignedTo
]

{ #category : #accessing }
STTask >> assignedTo: anObject [

	assignedTo := anObject
]

{ #category : #accessing }
STTask >> changeStateTo: taskSymbolOrStringOrTaskState [
	| newState |

	(taskSymbolOrStringOrTaskState isKindOf: Symbol)
		ifTrue: 
			[ newState := (STTaskState perform: taskSymbolOrStringOrTaskState) ].

	(taskSymbolOrStringOrTaskState isKindOf: String)
		ifTrue: 
			[ newState := (STTaskState named: taskSymbolOrStringOrTaskState) ].
		
	(taskSymbolOrStringOrTaskState isKindOf: STTaskState)
		ifTrue: 
			[ newState := STTaskState ].	
			
	newState ifNil: [ AssertionFailure new signal ].
			
	self taskStateLog changeStateTo: newState.
]

{ #category : #accessing }
STTask >> creationDate [

	^ creationDate ifNil: [ creationDate := DateAndTime now ]
]

{ #category : #accessing }
STTask >> creationDate: anObject [

	creationDate := anObject
]

{ #category : #accessing }
STTask >> currentState [ 
	^ self taskStateLog currentState 
]

{ #category : #accessing }
STTask >> description [

	^ description ifNil: [ '' ]
]

{ #category : #accessing }
STTask >> description: anObject [

	description := anObject
]

{ #category : #accessing }
STTask >> estimatedDuration [

	^ estimatedDuration ifNil: [ estimatedDuration := 1 ]
]

{ #category : #accessing }
STTask >> estimatedDuration: anObject [

	estimatedDuration := anObject
]

{ #category : #accessing }
STTask >> getUrl [
	"Returns an appropiate URL from the refDoc field"
	| prefixRe  outLookPattern refDocOrEmpty |
	refDocOrEmpty := self refDoc ifNil: [ ' ' ].
	outLookPattern := 'https://outlook.office365.com/owa/?ItemID={1}&exvsurl=1&viewmodel=ReadMessageItem'.
	prefixRe := 'https\://outlook.office.com/mail/id/(.*)' asRegex.
	
	(prefixRe matchesPrefix: refDocOrEmpty)
		ifTrue: [ ^  outLookPattern format: { prefixRe subexpression: 2 }].
		
	('https\:' asRegex matchesPrefix: refDocOrEmpty)
		ifTrue: [ ^ self refDoc  ].
		
	^ refDocOrEmpty.
]

{ #category : #accessing }
STTask >> isArchived [
	^ self currentState ifNil: [ false ] ifNotNil: [ :s | s id = #archived ].
]

{ #category : #accessing }
STTask >> priority [

	^ priority ifNil: [ priority := 10 ]
]

{ #category : #accessing }
STTask >> priority: anObject [

	priority := anObject asInteger
]

{ #category : #accessing }
STTask >> project [

	^ project
]

{ #category : #accessing }
STTask >> project: anObject [

	project := anObject
]

{ #category : #accessing }
STTask >> refDoc [

	^ refDoc ifNil: [ '' ]
]

{ #category : #accessing }
STTask >> refDoc: anObject [

	refDoc := anObject
]

{ #category : #accessing }
STTask >> saveToDb: aDb [
	aDb execute: '
		INSERT INTO tasks(
			assigned_to, title, creation_date, 
			description, ref_doc, priority,
			type, project)
		VALUES (
			:assignedTo, :title, :creationDate,
			:description, :refDoc, :priority,
			:type, :project)
		ON CONFLICT DO NOTHING
	' with: self asDictionary .
	self taskStateLog saveToDb: aDb.
	
]

{ #category : #accessing }
STTask >> taskStateLog [

	^ taskStateLog ifNil: [ taskStateLog := STTaskStateLog new task: self ]
]

{ #category : #accessing }
STTask >> title [

	^ title ifNil: [ '' ]
]

{ #category : #accessing }
STTask >> title: anObject [

	title := anObject
]

{ #category : #accessing }
STTask >> type [

	^ type
]

{ #category : #accessing }
STTask >> type: anObject [

	type := anObject
]
