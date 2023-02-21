"
I am the base class for Task Filter Presenters. I hold the task filter and the callback block to call when the filter condition changes.
"
Class {
	#name : #STTaskFilterPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'tasksFilter',
		'filterChangedBlock'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #accessing }
STTaskFilterPresenter >> filterChangedBlock [

	^ filterChangedBlock ifNil: [ filterChangedBlock := [ :f | UIManager default defer: [ self inform: 'Filter Changed' ]  ] ]
]

{ #category : #initialization }
STTaskFilterPresenter >> whenFilterChangedDo: aBlock [
	filterChangedBlock := aBlock.
]
