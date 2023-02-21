"
I am the base class for Task Filter Presenters. I have children for each attribute that can be used to filter a Task.
"
Class {
	#name : #STTaskFilterPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter',
		'tasksFilter',
		'filterChangedBlock'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskFilterPresenter >> defaultLayout [  
	^ SpBoxLayout newTopToBottom 
			add: listPresenter;
			"expand: false;"
			yourself.
]

{ #category : #accessing }
STTaskFilterPresenter >> filterChangedBlock [

	^ filterChangedBlock ifNil: [ filterChangedBlock := [ :f | UIManager default defer: [ self inform: 'Filter Changed' ]  ] ]
]

{ #category : #initialization }
STTaskFilterPresenter >> initializePresenters [ 
	super initializePresenters.
	
	listPresenter := self newList
		items: self items;
		beMultipleSelection.
	listPresenter selectItems: listPresenter items.
	listPresenter whenSelectionChangedDo: [ :selection |
		self buildTaskFilter: selection.
		self filterChangedBlock value: tasksFilter ]
]

{ #category : #initialization }
STTaskFilterPresenter >> whenFilterChangedDo: aBlock [
	filterChangedBlock := aBlock.
]
