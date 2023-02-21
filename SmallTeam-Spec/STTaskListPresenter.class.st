"
I am the Spec Presenter responsible for showing a list of Tasks.
"
Class {
	#name : #STTaskListPresenter,
	#superclass : #SpPresenterWithModel,
	#instVars : [
		'tablePresenter'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskListPresenter >> defaultLayout [ 
	"Initialize  layout"	
	^ SpBoxLayout newVertical 
			add: tablePresenter;
			yourself
]

{ #category : #initialization }
STTaskListPresenter >> initializePresenters [
	"comment stating purpose of instance-side method"
	super initializePresenters.
	tablePresenter := self newTable 
		addColumn: ((SpStringTableColumn 
							title: 'Priority' 
							evaluated: [:task | task priority printPaddedWith: Character space to: 2])
							beSortable;
							width: 40;
							yourself);	
		addColumn: ((SpStringTableColumn 
							title: 'Who' 
							evaluated: [:task | task assignedTo ifNil: ['-'] ifNotNil: [ :p | p name ] ])
							beSortable;
							width: 40;
							yourself);
		addColumn: ((SpStringTableColumn 
							title: 'State' 
							evaluated: [:task | task currentState ifNil: ['-'] ifNotNil: [ :p | p name ] ]) 	
							beSortable;
							width: 40;
							yourself);
		addColumn: ((SpStringTableColumn 
							title: 'Type' 
							evaluated: [:task | task type ifNil: ['-'] ifNotNil: [ :p | p name ] ]) 	
							beSortable;
							width: 50;
							yourself);
		addColumn: ((SpStringTableColumn 
							title: 'Title' 
							evaluated: [:task | task title])
							beSortable);
					
		contextMenu: self taskListContextMenu;
		yourself.

]

{ #category : #initialization }
STTaskListPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter 
		title: 'Tasques UATD';
		initialExtent: 500@500.
]

{ #category : #initialization }
STTaskListPresenter >> inspectSelectedTask [
	| task  |
	task := tablePresenter selection selectedItem.
	task inspect.	
		
]

{ #category : #updating }
STTaskListPresenter >> modelChanged [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	self updatePresenter.
	super modelChanged.
]

{ #category : #initialization }
STTaskListPresenter >> selectIndex: anInteger [
	tablePresenter selectIndex: anInteger.
]

{ #category : #initialization }
STTaskListPresenter >> selectedIndex [
	^ tablePresenter selectedIndex
]

{ #category : #initialization }
STTaskListPresenter >> selectedItem [
	^ tablePresenter selectedItem
]

{ #category : #accessing }
STTaskListPresenter >> tablePresenter [

	^ tablePresenter
]

{ #category : #accessing }
STTaskListPresenter >> tablePresenter: anObject [

	tablePresenter := anObject
]

{ #category : #initialization }
STTaskListPresenter >> taskListContextMenu [
	^ self newMenu
		addItem: [ :item | item name: 'Inspect'; action: [ self inspectSelectedTask ] ].
]

{ #category : #updating }
STTaskListPresenter >> updatePresenter [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	
	tablePresenter items: self model.

]
