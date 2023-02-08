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
		'taskStatePresenter',
		'personChoosePresenter',
		'taskTypePresenter'
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

	self descriptionTextInput whenTextChangedDo:  [ :new :old | 
		self model description: new ].
	
	self titleTextInput whenTextChangedDo: [ :new :old |
			self model title: new ].
	
	self refDocTextInput  whenTextChangedDo: [ :new :old |
			self model refDoc: new ].
	
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
						withConstraints: [ :c | c width: 150 ]; 	
						add: personChoosePresenter  
						withConstraints: [ :c | c width: 150 ]; 		
						add: taskTypePresenter  
						withConstraints: [ :c | c width: 150 ]; 		
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
		initialExtent: 800@500;
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
	personChoosePresenter := STPersonChoosePresenter on: self model.
	taskTypePresenter := STTaskTypePresenter on: self model.
	
	actionBar := self newActionBar
		addLast: (self newButton
			label: 'Add'; 
			icon: (self iconNamed: #smallOk);
			help: 'Add.';
			action: [ 
				self updateModel.
				UIManager default defer: [ self inform: 'Add' ]. ];
			yourself);
		yourself.
]

{ #category : #initialization }
STTaskFormPresenter >> modelChanged [ 
	self titleTextInput text: self model title.
	self descriptionTextInput text: self model description.
	self refDocTextInput text: self model refDoc.
	self taskStatePresenter model: self model.
	self personChoosePresenter model: self model.
	self taskTypePresenter model: self model.
	
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
STTaskFormPresenter >> personChoosePresenter [

	^ personChoosePresenter
]

{ #category : #accessing }
STTaskFormPresenter >> personChoosePresenter: anObject [

	personChoosePresenter := anObject
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
STTaskFormPresenter >> taskStatePresenter [

	^ taskStatePresenter
]

{ #category : #accessing }
STTaskFormPresenter >> taskStatePresenter: anObject [

	taskStatePresenter := anObject
]

{ #category : #accessing }
STTaskFormPresenter >> taskTypePresenter [

	^ taskTypePresenter
]

{ #category : #accessing }
STTaskFormPresenter >> taskTypePresenter: anObject [

	taskTypePresenter := anObject
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
