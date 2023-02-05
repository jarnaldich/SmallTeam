"
I am the presenter for the form for editing and creating STTasks.
"
Class {
	#name : #STTaskFormPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'titleTextInput',
		'descriptionTextInput',
		'refDocTextInput'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskFormPresenter >> connectPresenters [ 
	self descriptionTextInput whenEditableChangedDo:  [ :old :n :e | 
		self model description: n.
		Transcript show: n; cr. ]."
	self descriptionTextInput whenSubmitDo: [ :txt | 
		self model description: txt.
		Transcript crShow: 'Description ', self model description.
		self announcingObject valueChanged.
		Transcript show: self announcingObject; cr.
		Transcript show: self model; cr.
		Transcript show: txt; cr. ].	
	"
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
				add: refDocTextInput;
				
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
	"Initialize controls"	

	titleTextInput := self newTextInput.
	descriptionTextInput := self newTextInput.
	refDocTextInput := self newTextInput.
	
]

{ #category : #initialization }
STTaskFormPresenter >> modelChanged [ 
	self titleTextInput text: self model title.
	self descriptionTextInput text: self model description.
	self refDocTextInput text: self model refDoc.
	
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
