"
A class to hold the collections of the STData Application. I only have class side variables, holding collections for People, Tasks, etc...


"
Class {
	#name : #STData,
	#superclass : #Object,
	#classVars : [
		'developers',
		'tasks'
	],
	#category : #'SmallTeam-DataBase'
}

{ #category : #accessing }
STData class >> defaultRepo [ 
	"Returns location of repo. Should be machine dendendent, configured or sth in the future..."
	^ FileLocator localDirectory  / 'iceberg' / 'jarnaldich' / 'SmallTeam' / 'data'
]

{ #category : #'as yet unclassified' }
STData class >> developerByName: aString [
	"returns developer by name"
	^ self developers at: aString.
]

{ #category : #accessing }
STData class >> developers [
	^ developers ifNil: [ 
		developers := Dictionary  new.
		#('Albert' 'David' 'Joan' 'Muñoz' 'Bayona' 'Fernando') do: [ :d |
			developers at: d put: (STPerson newNamed: d)
		]
	]
]

{ #category : #accessing }
STData class >> developers: anObject [

	developers := anObject
]

{ #category : #accessing }
STData class >> taskAdd: aTask [
	self tasks addFirst: aTask.
]

{ #category : #accessing }
STData class >> taskRemove: aTask [
	self tasks addFirst: aTask.
	self tasks remove: aTask ifAbsent: [  ].
]

{ #category : #accessing }
STData class >> tasks [

	^ tasks ifNil: [ tasks := OrderedCollection new ]
]

{ #category : #accessing }
STData class >> tasks: anObject [

	tasks := anObject
]

{ #category : #accessing }
STData class >> tasksLoad [
	"Saves the tasks collection to disk as STON"
	^ self tasksLoadFile: (self defaultRepo / 'Tasks.ston' ) pathString .
]

{ #category : #accessing }
STData class >> tasksLoadFile: aPathString [
	"Loads the tasks collection from disk as STON. Returns false on error."
	| s obj |
	s := aPathString asFileReference readStream. 
	obj := STON fromStream: s.
	obj
		ifNil: [ ^ false ]
		ifNotNil: [ self tasks: obj ].
	^ true.
]

{ #category : #accessing }
STData class >> tasksSave [
	"Saves the tasks collection to disk as STON"
	self tasksSaveFile: (self defaultRepo / 'Tasks.ston' ) pathString .
]

{ #category : #accessing }
STData class >> tasksSaveFile: aPathString [
	"Saves the tasks collection to disk as STON"
	| s |
	s := aPathString asFileReference writeStream.
	(STON writer on: s) nextPut: self tasks.
	s close.

]
