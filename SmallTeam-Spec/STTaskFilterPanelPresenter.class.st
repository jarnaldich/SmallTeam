"
I am the presenter holding all the Task Filter Presenters.
"
Class {
	#name : #STTaskFilterPanelPresenter,
	#superclass : #STTaskFilterPresenter,
	#instVars : [
		'taskFilterByStatePresenter',
		'taskFilterByDeveloperPresenter'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #initialization }
STTaskFilterPanelPresenter >> buildTaskFilter: anObject [
	tasksFilter  := STTaskFilterCombinatorAnd withChildren: { 
		taskFilterByStatePresenter tasksFilter .
		taskFilterByDeveloperPresenter tasksFilter .
	}
]

{ #category : #initialization }
STTaskFilterPanelPresenter >> defaultLayout [ 
	^ SpBoxLayout newLeftToRight 
			add: (SpBoxLayout newTopToBottom 
						add: 'By State';
						add: taskFilterByStatePresenter; yourself);
			add: (SpBoxLayout newTopToBottom 
						add: 'By Developer';
						add: taskFilterByDeveloperPresenter; yourself);
			yourself.
]

{ #category : #initialization }
STTaskFilterPanelPresenter >> initializePresenters [ 
	super initializePresenters.
	taskFilterByStatePresenter := STTaskFilterByStatePresenter new
		whenFilterChangedDo: [ :f | self buildTaskFilterAndCallBack: f ].
	taskFilterByDeveloperPresenter := STTaskFilterByDeveloperPresenter new
		whenFilterChangedDo: [ :f | self buildTaskFilterAndCallBack: f ].
	
	
	
]

{ #category : #initialization }
STTaskFilterPanelPresenter >> selectAll [
	taskFilterByStatePresenter selectAll.
	taskFilterByDeveloperPresenter selectAll.
]
