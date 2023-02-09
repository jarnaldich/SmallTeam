"
I represent the kind of a Task. My class methods are constructors for different kinds:

- bug -> Errors en programari.
- millora -> Millores i evolucions en el programari.
- seguiment -> Seguiments de tasques encarregades (peticions TI).
 
- backlog -> Millores a implementar en un futur.
- dades -> Peticions de dades (peticions de procés ad-hoc).


"
Class {
	#name : #STTaskType,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : #'SmallTeam-Model'
}

{ #category : #'instance creation' }
STTaskType class >> allNames [
	"Create Task in #working state"
	^ self allSymbols collect: [ :s | s asString capitalized ].
]

{ #category : #'instance creation' }
STTaskType class >> allSymbols [ 
	"all symbolss"	
	^ #(bug millora manteniment seguiment backlog dades peticio).
]

{ #category : #'instance creation' }
STTaskType class >> backlog [
	"Create a #backlog TaskType"
	^ self new id: #backlog
]

{ #category : #'instance creation' }
STTaskType class >> bug [
	"Create a #bug TaskType"
	^ self new id: #bug
]

{ #category : #'instance creation' }
STTaskType class >> dades [
	"Create a #dades TaskType"
	^ self new id: #dades
]

{ #category : #'instance creation' }
STTaskType class >> manteniment [
	"Create a #manteniment TaskType. P.ex canvis que venen imposats per migracions postgres..."
	^ self new id: #manteniment
]

{ #category : #'instance creation' }
STTaskType class >> millora [
	"Create a #millora TaskType"
	^ self new id: #millora
]

{ #category : #'instance creation' }
STTaskType class >> named: aSymbolOrString [
	"Create Task in #working state"
	^ self perform: (aSymbolOrString asString asLowercase asSymbol).
]

{ #category : #'instance creation' }
STTaskType class >> peticio [
	"Create a #peticio TaskType"
	^ self new id: #peticio
]

{ #category : #'instance creation' }
STTaskType class >> seguiment [
	"Create a #seguiment TaskType"
	^ self new id: #seguiment
]

{ #category : #accessing }
STTaskType >> id [

	^ id
]

{ #category : #accessing }
STTaskType >> id: anObject [

	id := anObject
]

{ #category : #accessing }
STTaskType >> name [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	^ self id asString capitalized.
]
