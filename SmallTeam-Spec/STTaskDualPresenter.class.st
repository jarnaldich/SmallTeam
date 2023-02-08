"
I represent a class with a task list and a detail form kept in sync...
"
Class {
	#name : #STTaskDualPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'actionBar',
		'taskListPresenter',
		'taskFormPresenter',
		'personFilterPresenter',
		'personFilter'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskDualPresenter >> applyFilters [ 
	| filteredByName |
	filteredByName := STData tasks select: personFilter.
	^ filteredByName. 
]

{ #category : #initialization }
STTaskDualPresenter >> connectPresenters [ 
	"Initialize controls"	
	taskListPresenter tablePresenter whenSelectionChangedDo: [ self updatePresenter  ].
]

{ #category : #initialization }
STTaskDualPresenter >> defaultLayout [ 
	"Initialize  layout"	
			
	^ SpBoxLayout newVertical   
		add: (SpPanedLayout  newLeftToRight 
					add: taskListPresenter;
					add: taskFormPresenter;
					yourself);
		add: actionBar;
		add: personFilterPresenter ;
		yourself.

	
]

{ #category : #initialization }
STTaskDualPresenter >> initializeActionBar [
	actionBar := self newActionBar
		add: (self newButton
			label: 'Add'; 
			icon: (self iconNamed: #smallAdd);
			help: 'Add.';
			action: [ 
				self newTask.
				UIManager default defer: [ self inform: 'Add' ] ];
			yourself);
		add: (self newButton
			label: 'Remove'; 
			icon: (self iconNamed: #smallCancel);
			help: 'Remove.';
			action: [ 
				self removeSelectedTask.
				UIManager default defer: [ self inform: 'Remove' ] 
			];
			yourself);
		yourself

]

{ #category : #initialization }
STTaskDualPresenter >> initializePresenters [
	"Initialize controls"	
	| selected peopleNames |
	 
	personFilter := [ :p | true ].
	peopleNames := STData developers collect: [ :p | p name ].
	personFilterPresenter := STRadioChooserPresenter on: peopleNames.
	personFilterPresenter labelText: 'Assignee: '.
	personFilterPresenter action: [ :name | 
		personFilter := [ :t | name = 'all' or: [  name = (t assignedTo ifNotNil: [ t assignedTo name ]) ]  ].
		self reLoad ].
	
	selected := STData tasks at: 1.
	taskListPresenter := self instantiate: STTaskListPresenter on: STData tasks.
	taskListPresenter selectIndex: 1.
	taskFormPresenter := self instantiate: STTaskFormPresenter on: selected.
	
	self initializeActionBar.

]

{ #category : #initialization }
STTaskDualPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter 
		title: 'Tasques UATD';
		initialExtent: 700@500.
]

{ #category : #initialization }
STTaskDualPresenter >> newTask [
	| t |
	t := STTask new title: 'New Task'.
	STData taskAdd: t.
	
	taskListPresenter model: STData tasks.
	taskListPresenter selectIndex: 1.
	Transcript crShow: t title.
"
	taskListPresenter announcingObject valueChanged.
	taskListPresenter modelChanged.
"
	
	taskFormPresenter model: t.
	
"	taskFormPresenter modelChanged."
]

{ #category : #initialization }
STTaskDualPresenter >> reLoad [
	"Called when database is loaded from disk"	
	| selected data |
	data := self applyFilters.
	taskListPresenter model: data.
	
	"XXX aqui si el resultat es buit caldria desactivar el formulari..."
	data ifNotEmpty: [ 
		taskFormPresenter show.
		selected := data at: 1.
		taskListPresenter selectIndex: 1.
		taskFormPresenter model: selected.
	] ifEmpty: [ 
		taskFormPresenter hide.
	] 
	
	
	
]

{ #category : #initialization }
STTaskDualPresenter >> removeSelectedTask [
	| t  |
	t := taskListPresenter selectedItem.
	STData tasks remove: t.
	
	taskListPresenter model: STData tasks.
"	taskListPresenter announcingObject valueChanged.
	taskListPresenter modelChanged.
"	taskListPresenter selectIndex: 1.
	taskFormPresenter model: (STData tasks at: 1).

"	self updatePresenter."
]

{ #category : #initialization }
STTaskDualPresenter >> updatePresenter [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"
	| t |
	t := taskListPresenter tablePresenter selectedItem.
	t ifNotNil: [ taskFormPresenter model: t.	].
"	
	taskListPresenter selectIndex: 1.
	taskFormPresenter model: t.
	taskFormPresenter modelChanged.
"	
	super updatePresenter.
]
