"
I am a Presenter that lets you choose the person assigned to a Task.
"
Class {
	#name : #STPersonChoosePresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'menuPresenter',
		'person',
		'action'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STPersonChoosePresenter >> action [

	^ action ifNil: [ 
		action := [ :value | 
			UIManager default defer: [ self inform: ('Person chosen.', value name)
		] ] ]
]

{ #category : #initialization }
STPersonChoosePresenter >> action: anObject [

	action := anObject
]

{ #category : #initialization }
STPersonChoosePresenter >> defaultLayout [ 
	"intialize the menu"
 	^ SpBoxLayout newVertical 
		add: menuPresenter;
		yourself
]

{ #category : #initialization }
STPersonChoosePresenter >> initializePresenters [
	"intialize the menu"
	| menu assignedTo |
	assignedTo := self model assignedTo.
	menuPresenter := SpMenuButtonPresenter new
		label:  (assignedTo ifNil: ['Unassigned'] ifNotNil: [ assignedTo name]).
	menu := (SpMenuPresenter new)
		addGroup: [ :group | 
			STData developers do: [ :devel |
				group addItem: [ :item | 
					item name: devel name; 
					action: [ 
						menuPresenter label: devel name.
						self model assignedTo: devel.
						self action value: devel.  
					]]	
			].
			
			group ].
	menuPresenter menu: menu.
]

{ #category : #accessing }
STPersonChoosePresenter >> person [

	^ person
]

{ #category : #accessing }
STPersonChoosePresenter >> person: anObject [

	person := anObject
]
