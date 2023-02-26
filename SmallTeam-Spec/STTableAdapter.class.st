"
I am an adapter class that wraps the items and active filter for a table. Instead of directly passing items as a model, they pass me, so whenever the filter is changed the table is reactivated.
"
Class {
	#name : #STTableAdapter,
	#superclass : #Object,
	#instVars : [
		'items',
		'filter'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #accessing }
STTableAdapter >> filter [

	^ filter ifNil: [ filter := STTaskFilter new ]
]

{ #category : #accessing }
STTableAdapter >> filter: anObject [

	filter := anObject
]

{ #category : #accessing }
STTableAdapter >> filteredItems [

	^ self items select: self filter.
]

{ #category : #accessing }
STTableAdapter >> items [

	^ items ifNil: [ items := OrderedCollection new. ]
]

{ #category : #accessing }
STTableAdapter >> items: anObject [

	items := anObject
]
