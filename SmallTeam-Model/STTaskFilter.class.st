"
I am a class representing a Task filter. I store a function (block) that returns if a task should be accepted or rejected.
"
Class {
	#name : #STTaskFilter,
	#superclass : #Object,
	#instVars : [
		'boolBlock'
	],
	#category : #'SmallTeam-Model'
}

{ #category : #'instance creation' }
STTaskFilter class >> withBlock: aBlock [
	^ self new boolBlock: aBlock.
]

{ #category : #accessing }
STTaskFilter >> boolBlock [

	^ boolBlock ifNil: [ boolBlock := [ :t | true ] ]
]

{ #category : #accessing }
STTaskFilter >> boolBlock: anObject [

	boolBlock := anObject
]

{ #category : #accessing }
STTaskFilter >> value: aTask [
	^ self boolBlock value: aTask
]
