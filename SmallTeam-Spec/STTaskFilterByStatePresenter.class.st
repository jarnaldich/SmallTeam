"
I am a presenter class for constructing Task Filters based on values of the state attribute. 
"
Class {
	#name : #STTaskFilterByStatePresenter,
	#superclass : #STTaskFilterListPresenter,
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskFilterByStatePresenter >> buildTaskFilter: aSelection [ 
	tasksFilter := (STTaskFilter withBlock: [ :t | 
			t currentState 
				ifNil: [ aSelection selectedItems includes: '-' ]
				ifNotNil: [ :s | aSelection selectedItems includes: s name ]]).
]

{ #category : #initialization }
STTaskFilterByStatePresenter >> items [
	|states|
	states :=  STTaskState allNames asOrderedCollection.
	states addFirst: '-'.
	
	^ states.

]
