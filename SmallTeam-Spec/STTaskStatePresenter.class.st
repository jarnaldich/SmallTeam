"
I am the presenter in charge of choosing the options for a task state.
"
Class {
	#name : #STTaskStatePresenter,
	#superclass : #SpPresenterWithModel,
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
	| menu currentState |
	currentState := self model taskStateLog currentState.
	menuPresenter := SpMenuButtonPresenter new
		label:  (currentState ifNil: ['Estat'] ifNotNil: [ currentState name]).
	menu := (SpMenuPresenter new)
		addGroup: [ :group | 
			#(working blocked validation finished abandoned) do: [ :sid |
				group addItem: [ :item | 
					| label |
					label := sid asString capitalized.
					item name: label; 
					action: [ 
						menuPresenter label: label.
						self model taskStateLog changeStateTo: (STTaskState perform: sid).
						self action value: (STTaskState perform: sid)  
					]]	
			].
			
			group ].
	menuPresenter menu: menu.
]

{ #category : #initialization }
STTaskStatePresenter >> modelChanged [ 
	"intialize the menu"
	self updatePresenter 
]

{ #category : #accessing }
STTaskStatePresenter >> taskState [

	^ taskState
]

{ #category : #accessing }
STTaskStatePresenter >> taskState: anObject [

	taskState := anObject
]

{ #category : #initialization }
STTaskStatePresenter >> updatePresenter [ 
	"intialize the menu"
	|  currentState |
	currentState := self model taskStateLog currentState.
	menuPresenter label:  (currentState ifNil: ['Estat'] ifNotNil: [ currentState name]).
]
