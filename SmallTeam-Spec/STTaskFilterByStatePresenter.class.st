"
I am a presenter class for constructing Task Filters based on values of the state attribute. 
"
Class {
	#name : #STTaskFilterByStatePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'listPresenter',
		'filterChangedBlock',
		'tasksFilter'
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

{ #category : #accessing }
STTaskFilterByStatePresenter >> filterChangedBlock [

	^ filterChangedBlock ifNil: [ filterChangedBlock := [ :f | UIManager default defer: [ self inform: 'Filter Changed' ]  ] ]
]

{ #category : #initialization }
STTaskFilterByStatePresenter >> initializePresenters [ 
	listPresenter := self newList
		items: STTaskState allNames;
		beMultipleSelection.
	listPresenter selectItems: listPresenter items.
	listPresenter whenSelectionChangedDo: [ :selection |
		tasksFilter := STTaskFilter withBlock: [ :t | 
			t currentState 
				ifNil: [ false ]
				ifNotNil: [ :s | selection selectedItems includes: s name ]].
		self filterChangedBlock value: tasksFilter ]
]

{ #category : #initialization }
STTaskFilterByStatePresenter >> whenFilterChangedDo: aBlock [
	filterChangedBlock := aBlock.
]
