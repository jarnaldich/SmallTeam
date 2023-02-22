"
I am a presenter class for constructing Task Filters based on values of the assigned developer. 
"
Class {
	#name : #STTaskFilterByDeveloperPresenter,
	#superclass : #STTaskFilterListPresenter,
	#category : #'SmallTeam-Spec'
}

{ #category : #accessing }
STTaskFilterByDeveloperPresenter >> buildTaskFilter: aSelection [ 
	tasksFilter := (STTaskFilter withBlock: [ :t | 
			t assignedTo 
				ifNil: [ aSelection selectedItems includes: '-' ]
				ifNotNil: [ :d | aSelection selectedItems includes: d name ]]).
]

{ #category : #accessing }
STTaskFilterByDeveloperPresenter >> items [
	|developers|
	developers :=  STData developers keys asOrderedCollection.
	developers addFirst: '-'.
	
	^ developers.
]
