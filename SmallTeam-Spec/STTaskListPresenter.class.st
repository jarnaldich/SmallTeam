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
STTaskListPresenter >> initializePresenters [
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	taskListPresenter := self newTable 
		addColumn: (SpStringTableColumn title: 'Title' evaluated: [:task | task title]);
		yourself.
		
	self layout: (SpBoxLayout newVertical 
		add: taskListPresenter;
		yourself)
]

{ #category : #initialization }
STTaskListPresenter >> initializeWindow: aWindowPresenter [
	aWindowPresenter 
		title: 'Tasques UATD';
		initialExtent: 500@500.
]

{ #category : #initialization }
STTaskListPresenter >> updatePresenter [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	taskListPresenter items: STData tasks asOrderedCollection.
]
