"
I am the presenter for the form for editing and creating STTasks.
"
Class {
	#name : #STTaskFormPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'titleLabel',
		'titleTextInput',
		'descriptionLabel',
		'descriptionTextInput',
		'refDocLabel',
		'refDocTextInput'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskFormPresenter >> connectPresenters [ 
	self descriptionTextInput whenEditableChangedDo:  [ :old :n :e | 
		self model description: n ].
	self descriptionTextInput whenSubmitDo: [ :txt | 
		self model description: txt.
		self announcingObject valueChanged.
		Transcript show: self announcingObject.
		Transcript show: self model.
		Transcript show: txt. ].	
	
]

{ #category : #initialization }
STTaskFormPresenter >> defaultLayout [ 
	"Initialize  layout"	
	^ SpBoxLayout newTopToBottom 
		add: (SpGridLayout build: [ :builder |
			builder
				add: 'Tasca:';
				add: titleTextInput;
				nextRow;
				add: 'Descripció';
				add: descriptionTextInput;
				nextRow;
				add: 'Documentació';
				add: refDocLabel;
				
				yourself
			]);
		yourself.

	
]

{ #category : #accessing }
STTaskFormPresenter >> descriptionTextInput [

	^ descriptionTextInput
]

{ #category : #accessing }
STTaskFormPresenter >> descriptionTextInput: anObject [

	descriptionTextInput := anObject
]

{ #category : #initialization }
STTaskFormPresenter >> initializePresenters [
	"Initialize controls and layout"	
	titleLabel := self newLabel label: 'Tasca:'.
	titleTextInput := self newTextInput.
	
	descriptionLabel := self newLabel label: 'Descripció'.
	descriptionTextInput := self newTextInput.
	
	refDocLabel := self newLabel label: 'Documentació'.
	refDocLabel := self newTextInput.
	
]

{ #category : #initialization }
STTaskFormPresenter >> modelChanged [ 
	self titleTextInput text: self model title.
	
]

{ #category : #accessing }
STTaskFormPresenter >> refDocTextInput [

	^ refDocTextInput
]

{ #category : #accessing }
STTaskFormPresenter >> refDocTextInput: anObject [

	refDocTextInput := anObject
]

{ #category : #accessing }
STTaskFormPresenter >> titleTextInput [

	^ titleTextInput
]

{ #category : #accessing }
STTaskFormPresenter >> titleTextInput: anObject [

	titleTextInput := anObject
]
