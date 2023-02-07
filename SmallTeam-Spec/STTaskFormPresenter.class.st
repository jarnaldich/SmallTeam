"
I am the presenter for the form for editing and creating STTasks.
"
Class {
	#name : #STTaskFormPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'titleTextInput',
		'descriptionTextInput',
		'refDocTextInput',
		'actionBar',
		'taskStatePresenter'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #accessing }
STTaskFormPresenter >> actionBar [

	^ actionBar
]

{ #category : #accessing }
STTaskFormPresenter >> actionBar: anObject [

	actionBar := anObject
]

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

{ #category : #layout }
STTaskFormPresenter >> defaultLayout [ 
	"Initialize  layout"	
			
	^ SpBoxLayout newTopToBottom 
			add: 'Títol'
			expand: false
			fill: false
			padding: 5;
			add: titleTextInput;			
	
			add: 'Descripció'
			expand: false
			fill: false
			padding: 5;
			add: descriptionTextInput  withConstraints: [ :c | c height: 120 ];
			
			add: 'Doc. extra (url, correu...)'
			expand: false
			fill: false
			padding: 5;
			add: refDocTextInput;	

			add: (SpBoxLayout newLeftToRight 
						add: taskStatePresenter 
						withConstraints: [ :c | c width: 300 ]; 					
						yourself)

				 withConstraints: [ :c | c width: 100 ];	
					
			add: actionBar;	
			
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
STTaskFormPresenter >> initializeDialogWindow: aDialogWindowPresenter [
	"Initialize controls"	

	aDialogWindowPresenter 
		title: 'Task';
		initialExtent: 500@500;
		addButton: 'Ok' do: [  :dialog |
			self updateModel.
			dialog close ];
		addButton: 'Cancel' do: [ :dialog |
			dialog close ].
]

{ #category : #initialization }
STTaskFormPresenter >> initializePresenters [
	"Initialize controls"	

	titleTextInput := self newTextInput.
	descriptionTextInput :=  self newTextInput.
	descriptionTextInput := self newText.
	refDocTextInput := self newTextInput.
	
	taskStatePresenter := STTaskStatePresenter on: self model. "or announcingObject?"
	
	actionBar := self newActionBar
		addLast: (self newButton
			label: 'Add'; 
			icon: (self iconNamed: #smallOk);
			help: 'Add.';
			action: [ UIManager default defer: [ self inform: 'Add' ] ];
			yourself);
		addLast: (self newButton
			label: 'Remove'; 
			icon: (self iconNamed: #smallCancel);
			help: 'Remove.';
			action: [ UIManager default defer: [ self inform: 'Remove' ] ];
			yourself);
		add: (self newButton
			label: 'Other'; 
			help: 'Other.';
			icon: (self iconNamed: #smallAdd);
			action: [ self newTask ];
			yourself);
		yourself.
]

{ #category : #initialization }
STTaskFormPresenter >> modelChanged [ 
	self titleTextInput text: self model title.
	self descriptionTextInput text: self model description.
	self refDocTextInput text: self model refDoc.
	
]

{ #category : #initialization }
STTaskFormPresenter >> newTask [
	"Adds a task"
	| t |
	t := STTask new.
	STData taskAdd: t.
	self model: t.
	self modelChanged.
	UIManager default defer: [ self inform: 'Task added' ].
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

{ #category : #initialization }
STTaskFormPresenter >> updateModel [ 
	self model description: self descriptionTextInput text.
	self model refDoc: self refDocTextInput text.
	self model title: self titleTextInput text.
	
	self announcingObject valueChanged.

]
