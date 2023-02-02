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
