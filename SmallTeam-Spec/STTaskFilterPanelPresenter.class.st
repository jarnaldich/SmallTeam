"
I am the presenter holding all the Task Filter Presenters.
"
Class {
	#name : #STTaskFilterPanelPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'taskFilterByStatePresenter',
		'taskFilterByDeveloperPresenter'
	],
	#category : #'SmallTeam-Spec'
}

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
	taskFilterByStatePresenter := STTaskFilterByStatePresenter new.
	taskFilterByDeveloperPresenter := STTaskFilterByDeveloperPresenter new.
	
]
