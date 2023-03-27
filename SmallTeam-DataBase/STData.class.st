"
A class to hold the collections of the STData Application. I only have class side variables, holding collections for People, Tasks, etc...


"
Class {
	#name : #STData,
	#superclass : #Object,
	#classVars : [
		'developers',
		'projects',
		'tasks'
	],
	#category : #'SmallTeam-DataBase'
}

{ #category : #accessing }
STData class >> defaultRepo [ 
	"Returns location of repo. Should be machine dendendent, configured or sth in the future..."
	NetNameResolver localHostName = 'CASTELLFOLLIT'
		ifTrue: [ ^ FileLocator C / 'Users' / 'j.arnaldich' / 'Dropbox' / 'Feina' / 'ICGC' / 'Tasques' ]
		ifFalse: [ ^ FileLocator localDirectory  / 'iceberg' / 'jarnaldich' / 'SmallTeam' / 'data' ]
	
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

{ #category : #'as yet unclassified' }
STData class >> projectByName: aString [
	"returns developer by name"
	^ self projects at: aString.
]

{ #category : #accessing }
STData class >> projects [

	^ projects ifNil: [ 
		projects := Dictionary  new.
		#('orto'
		  'distrib' 'minerva' 'fototeca' 'i+d' 
		  'ct1mv3' 'rtt' 'sidl' 'serveis' 'gestio' 'newspace' 'cintoteca' 'openicgc' 'bdps') do: [ :p |
			projects at: p put: (STProject new name: p)
		]
	]
]

{ #category : #accessing }
STData class >> projects: anObject [

	projects := anObject
]

{ #category : #accessing }
STData class >> taskAdd: aTask [
	tasks addFirst: aTask.
]

{ #category : #accessing }
STData class >> taskRemove: aTask [
	tasks remove: aTask ifAbsent: [  ].
]

{ #category : #accessing }
STData class >> tasks [

	| col |
	col := tasks ifNil: [ tasks := OrderedCollection new ].
	^ col reject: [ :t | t isArchived ]
]

{ #category : #accessing }
STData class >> tasks: anObject [

	tasks := anObject
]

{ #category : #accessing }
STData class >> tasksArchive [

	| col |
	col := tasks ifNil: [ tasks := OrderedCollection new ].
	^ col select: [ :t | t isArchived ].
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
STData class >> tasksReadyToArchive [
	^ self tasks select: [ :t | #( finished abandoned ) includes: (t currentState id) ]
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
	(STON writer on: s) nextPut: tasks. "Not self tasks, because archived tasks should be saved..."
	s close.

]
