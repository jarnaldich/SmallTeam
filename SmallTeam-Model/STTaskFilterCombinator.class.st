"
I am a task filter combinator. I have children task filters and combine them with a logic predicate (and, or, not...)
"
Class {
	#name : #STTaskFilterCombinator,
	#superclass : #STTaskFilter,
	#instVars : [
		'children'
	],
	#category : #'SmallTeam-Model'
}

{ #category : #'instance creation' }
STTaskFilterCombinator class >> withChildren: aFilterCollection [
	^ self new children: aFilterCollection
]

{ #category : #accessing }
STTaskFilterCombinator >> children [

	^ children ifNil: [ children := OrderedCollection new ]
]

{ #category : #accessing }
STTaskFilterCombinator >> children: anObject [

	children := anObject
]
