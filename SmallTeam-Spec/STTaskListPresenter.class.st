"
I am the Spec Presenter responsible for showing a list of Tasks.
"
Class {
	#name : #STTaskListPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'taskListPresenter'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskListPresenter >> defaultLayout [ 
	"Initialize  layout"	
	^ SpBoxLayout newVertical 
			add: taskListPresenter;
			yourself
]

{ #category : #initialization }
STTaskListPresenter >> editSelectedTask [
	| task app |
	task := taskListPresenter selection selectedItem.
	"app := STTaskFormPresenter newApplication: self application."
	app := STTaskFormPresenter newApplication: self application owner: self model: task.
	app openModal.
	
	self updatePresenter.
		
]

{ #category : #initialization }
STTaskListPresenter >> initializePresenters [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	taskListPresenter := self newTable 
		addColumn: (SpStringTableColumn title: 'Title' evaluated: [:task | task title]);
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
STTaskListPresenter >> removeSelectedTask [
	| task  |
	task := taskListPresenter selection selectedItem.
	STData taskRemove: task.	
	self updatePresenter.
		
]

{ #category : #initialization }
STTaskListPresenter >> taskListContextMenu [
	^ self newMenu
		addItem: [ :item | item name: 'Edit'; action: [  self editSelectedTask ] ];
		addItem: [ :item | item name: 'Remove'; action: [ self removeSelectedTask ] ].
]

{ #category : #initialization }
STTaskListPresenter >> updatePresenter [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	taskListPresenter items: STData tasks asOrderedCollection.
]
