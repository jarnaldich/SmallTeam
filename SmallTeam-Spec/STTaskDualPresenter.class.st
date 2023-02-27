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
		'filterPanel'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskDualPresenter >> applyFilters [
	^ STData tasks select: (filterPanel tasksFilter).
	" 
	| filteredByName |
	filteredByName := STData tasks select: personFilter.
	^ filteredByName select: stateFilter. "
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
		addLast: filterPanel ;
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
STTaskDualPresenter >> initializeFilterPanel [
	filterPanel := STTaskFilterPanelPresenter new.
	filterPanel whenFilterChangedDo: [ :f |
		self reLoad ]
	
]

{ #category : #initialization }
STTaskDualPresenter >> initializePresenters [
	"Initialize controls"	
	| selected  |
	super initializePresenters.
	self initializeFilterPanel.
	
	selected := STData tasks at: 1.
	taskListPresenter := self instantiate: STTaskListPresenter on: self taskAdapter.
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

	filterPanel selectAll.	
	taskListPresenter model: self taskAdapter.
	taskListPresenter selectItem: t.
]

{ #category : #initialization }
STTaskDualPresenter >> reLoad [
	"Called when database is loaded from disk"	
	| selected data |
	taskListPresenter model: self taskAdapter.
	data := self taskAdapter filteredItems.
	
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
	STData taskRemove:  t.
	
	taskListPresenter model: self taskAdapter.
"	taskListPresenter announcingObject valueChanged.
	taskListPresenter modelChanged.
"	taskListPresenter selectIndex: 1.	
	self updatePresenter.
]

{ #category : #initialization }
STTaskDualPresenter >> taskAdapter [
	"Initialize controls"	
	^ STTableAdapter new
	  		items: STData tasks;
			filter: filterPanel tasksFilter.
	
	
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
