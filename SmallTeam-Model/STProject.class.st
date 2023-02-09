"
I represent a grouping of tasks.
"
Class {
	#name : #STProject,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'SmallTeam-Model'
}

{ #category : #accessing }
STProject >> name [

	^ name
]

{ #category : #accessing }
STProject >> name: anObject [

	name := anObject
]
