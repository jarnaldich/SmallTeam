"
I represent a class with a task list and a detail form kept in sync...
"
Class {
	#name : #STTaskDualPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'taskListPresenter',
		'taskFormPresenter'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskDualPresenter >> defaultLayout [ 
	"Initialize  layout"	
			
	^ SpBoxLayout newLeftToRight 
			add: taskListPresenter;
			add: taskFormPresenter;
			yourself.

	
]

{ #category : #initialization }
STTaskDualPresenter >> initializePresenters [
	"Initialize controls"	
	| selected |
	selected := STData tasks at: 1.
	taskListPresenter := self instantiate: STTaskListPresenter on: STData tasks.
	taskListPresenter selectIndex: 1.
	taskFormPresenter := self instantiate: STTaskFormPresenter on: selected.
]

{ #category : #initialization }
STTaskDualPresenter >> updatePresenter [ 
	| selected |
	selected := taskListPresenter selectedItem.
	"taskFormPresenter := self instantiate: STTaskFormPresenter on: selected."
	taskFormPresenter model: selected.
]
