"
I let the user choose between types tasks
"
Class {
	#name : #STTaskTypePresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'menuPresenter',
		'taskType',
		'action'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #accessing }
STTaskTypePresenter >> action [

	^ action ifNil: [ 
		action := [ :value | 
			UIManager default defer: [ self inform: ('Type chosen.', value asString)
		] ] ]
]

{ #category : #accessing }
STTaskTypePresenter >> action: anObject [

	action := anObject
]

{ #category : #accessing }
STTaskTypePresenter >> defaultLayout [ 
	"intialize the menu"
 	^ SpBoxLayout newVertical 
		add: menuPresenter;
		yourself
]

{ #category : #initialization }
STTaskTypePresenter >> initializePresenters [
	"intialize the menu"
	| menu currentType |
	currentType := self model type.
	menuPresenter := SpMenuButtonPresenter new
		label:  self label.
	menu := (SpMenuPresenter new)
		addGroup: [ :group | 
			STTaskType allSymbols do: [ :sid |
				group addItem: [ :item | 
					| label |
					label := sid asString capitalized.
					item name: label; 
					action: [ 
						menuPresenter label: label.
						self model type: (STTaskType perform: sid).
						self action value: (STTaskType perform: sid)  
					]]	
			].
			
			group ].
	menuPresenter menu: menu.
]

{ #category : #accessing }
STTaskTypePresenter >> label [ 
	"intialize the menu"
	|  type |
	type := self model type.
	^ (type ifNil: ['Tipus'] ifNotNil: [ type name]).
]

{ #category : #accessing }
STTaskTypePresenter >> modelChanged [ 
	"intialize the menu"
	self updatePresenter 
]

{ #category : #accessing }
STTaskTypePresenter >> updatePresenter [ 
	"intialize the menu"
	menuPresenter label:  self label.
]
