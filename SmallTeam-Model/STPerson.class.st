"
I represent a Person in a Team. I hold a Person's data. I am assigned STTasks.

"
Class {
	#name : #STPerson,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'SmallTeam-Model'
}

{ #category : #'instance creation' }
STPerson class >> newNamed: aString [
	"Creates a new Person with the given name"
	^ self new name: aString
]

{ #category : #accessing }
STPerson >> name [

	^ name
]

{ #category : #accessing }
STPerson >> name: aString [

	name := aString
]
