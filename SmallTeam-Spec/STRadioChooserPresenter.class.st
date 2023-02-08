"
I am a generic class presenting a set of radiobuttons with a callback whenever the selection changes.

The model is sequence with given texts.
"
Class {
	#name : #STRadioChooserPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'labelText',
		'action',
		'radioButtons',
		'labelPresenter'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #accessing }
STRadioChooserPresenter >> action [

	^ action ifNil: [ 
		action := [ :value | 
			UIManager default defer: [ self inform: (' chosen.', value )
		] ] ]
]

{ #category : #accessing }
STRadioChooserPresenter >> action: anObject [

	action := anObject
]

{ #category : #layout }
STRadioChooserPresenter >> defaultLayout [ 
	| l |
	l := SpBoxLayout newLeftToRight    .
	l add: labelText expand: false.
	radioButtons do: [ :b |
		l add: b  withConstraints: [ :c | c width: 80 ].
	].
	^ l
]

{ #category : #initialization }
STRadioChooserPresenter >> initializePresenters [ 
	| allBtn update |
	labelPresenter := self newLabel label: self labelText.
	update := [  self updatePresenter  ].
	allBtn := (self newRadioButton 
					  label: 'all';
"					  whenActivatedDo: update;"
					  whenDeactivatedDo: update;
						yourself).

	radioButtons := self model asOrderedCollection collect: [ :s |
		| b |
		b := self newRadioButton 
			label: s;
			whenDeactivatedDo: update;
"			whenChangedDo: update;
"			yourself.
		 ].
	
	allBtn associatedRadioButtons: radioButtons.
	radioButtons addFirst: allBtn.
]

{ #category : #accessing }
STRadioChooserPresenter >> labelText [

	^ labelText ifNil: [ labelText := '' ]
]

{ #category : #accessing }
STRadioChooserPresenter >> labelText: anObject [

	labelText := anObject
]

{ #category : #initialization }
STRadioChooserPresenter >> updatePresenter [ 
	radioButtons detect: [ :r | r state ]
		ifFound: [ :r |
			self action value: r label 
		]

]
