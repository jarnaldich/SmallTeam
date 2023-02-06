"
I am the presenter in charge of choosing the options for a task state.
"
Class {
	#name : #STTaskStatePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'menuPresenter',
		'taskState',
		'action'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #accessing }
STTaskStatePresenter >> action [

	^ action ifNil: [ 
		action := [ :value | 
			UIManager default defer: [ self inform: ('State chosen.', value asString)
		] ] ]
]

{ #category : #accessing }
STTaskStatePresenter >> action: anObject [

	action := anObject
]

{ #category : #initialization }
STTaskStatePresenter >> defaultLayout [ 
	"intialize the menu"
 	^ SpBoxLayout newVertical 
		add: menuPresenter;
		yourself
]

{ #category : #initialization }
STTaskStatePresenter >> initializePresenters [
	"intialize the menu"
	| menu |
	menuPresenter := SpMenuButtonPresenter new
		label: 'Estat'.
	menu := (SpMenuPresenter new)
		addGroup: [ :group | group
			addItem: [ :item | 
				item name: 'Unassign'; 
					action: [ self action value: nil ] ];
			addItem: [ :item | 
				item name: 'Working'; 
				action: [ self action value: STTaskState working  ] ];
			yourself ].
	menuPresenter menu: menu.
]

{ #category : #accessing }
STTaskStatePresenter >> taskState [

	^ taskState
]

{ #category : #accessing }
STTaskStatePresenter >> taskState: anObject [

	taskState := anObject
]
