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
		'refDoc'
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
STTask >> assignedTo [

	^ assignedTo
]

{ #category : #accessing }
STTask >> assignedTo: anObject [

	assignedTo := anObject
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
STTask >> description [

	^ description
]

{ #category : #accessing }
STTask >> description: anObject [

	description := anObject
]

{ #category : #accessing }
STTask >> estimatedDuration [

	^ estimatedDuration
]

{ #category : #accessing }
STTask >> estimatedDuration: anObject [

	estimatedDuration := anObject
]

{ #category : #accessing }
STTask >> refDoc [

	^ refDoc
]

{ #category : #accessing }
STTask >> refDoc: anObject [

	refDoc := anObject
]

{ #category : #accessing }
STTask >> taskStateLog [

	^ taskStateLog ifNil: [ taskStateLog := STTaskStateLog new ]
]

{ #category : #accessing }
STTask >> title [

	^ title
]

{ #category : #accessing }
STTask >> title: anObject [

	title := anObject
]
