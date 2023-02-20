"
I am a presenter class for constructing Task Filters based on values of the state attribute. 
"
Class {
	#name : #STTaskFilterByStatePresenter,
	#superclass : #STTaskFilterPresenter,
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskFilterByStatePresenter >> buildTaskFilter: aSelection [ 
	tasksFilter := (STTaskFilter withBlock: [ :t | 
			t currentState 
				ifNil: [ false ]
				ifNotNil: [ :s | aSelection selectedItems includes: s name ]]).
]

{ #category : #initialization }
STTaskFilterByStatePresenter >> items [
	^ STTaskState allNames.
]
