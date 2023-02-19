"
I am a presenter class for constructing Task Filters based on values of the state attribute. 
"
Class {
	#name : #STTaskFilterByStatePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskFilterByStatePresenter >> defaultLayout [  
	^ SpBoxLayout newTopToBottom 
			add: listPresenter;
			"expand: false;"
			yourself.
]

{ #category : #initialization }
STTaskFilterByStatePresenter >> initializePresenters [ 
	listPresenter := self newList 
		items: STTaskState allNames;
		beMultipleSelection.
]
