"
I am a presenter class for constructing Task Filters based on values of the assigned developer. 
"
Class {
	#name : #STTaskFilterByDeveloperPresenter,
	#superclass : #STTaskFilterPresenter,
	#category : #'SmallTeam-Spec'
}

{ #category : #accessing }
STTaskFilterByDeveloperPresenter >> buildTaskFilter: aSelection [ 
	tasksFilter := (STTaskFilter withBlock: [ :t | 
			t assignedTo 
				ifNil: [ false ]
				ifNotNil: [ :d | aSelection selectedItems includes: d name ]]).
]

{ #category : #accessing }
STTaskFilterByDeveloperPresenter >> items [
	^ STData developers keys.
]
