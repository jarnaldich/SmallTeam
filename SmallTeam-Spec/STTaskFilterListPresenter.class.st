"
I am the base class for Task Filter Presenters. I have children for each attribute that can be used to filter a Task.
"
Class {
	#name : #STTaskFilterListPresenter,
	#superclass : #STTaskFilterPresenter,
	#instVars : [
		'listPresenter'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskFilterListPresenter >> defaultLayout [  
	^ SpBoxLayout newTopToBottom 
			add: listPresenter;
			"expand: false;"
			yourself.
]

{ #category : #initialization }
STTaskFilterListPresenter >> initializePresenters [ 
	super initializePresenters.
	
	listPresenter := self newList
		items: self items;
		beMultipleSelection.
	self selectAll.
	listPresenter whenSelectionChangedDo: [ :selection |
		self buildTaskFilterAndCallBack: selection ]
]

{ #category : #initialization }
STTaskFilterListPresenter >> selectAll [
		listPresenter selectItems: listPresenter items.
]
