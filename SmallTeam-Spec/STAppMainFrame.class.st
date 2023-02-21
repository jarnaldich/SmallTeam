"
The SmallTeam App main Frame
"
Class {
	#name : #STAppMainFrame,
	#superclass : #SpPresenter,
	#instVars : [
		'dualPresenter',
		'toolBar'
	],
	#category : #'SmallTeam-Spec'
}

{ #category : #layout }
STAppMainFrame >> defaultLayout [  
	"the default layout"
	^ SpBoxLayout newVertical 
		add: toolBar withConstraints: [ :c | c height: 40 ];
		add: dualPresenter ;
		yourself.
]

{ #category : #initialization }
STAppMainFrame >> doArchive [
	STData tasksReadyToArchive do: [ :t |
		t archive
	].
	self inform: 'Archived. Press save to make archival permanent.' 
]

{ #category : #initialization }
STAppMainFrame >> doLoad [
	STData tasksLoad.
	dualPresenter reLoad.
	self inform: 'Loaded' 
]

{ #category : #initialization }
STAppMainFrame >> doSave [
	STData tasksSave.
	self inform: 'Saved' 
]

{ #category : #initialization }
STAppMainFrame >> initializePresenters [ 
	"comment stating purpose of instance-side method"
	"scope: class-variables  &  instance-variables"	
	toolBar := self newToolbar
		addItem: (SpToolbarButtonPresenter new
			label: 'Save';
			icon: (self iconNamed: #smallSave);
			help: 'Save';
			action: [ self doSave ];
			yourself);
		addItem: (SpToolbarButtonPresenter new
			label: 'Load';
			icon: (self iconNamed: #open);
			help: 'Load';
			action: [ self doLoad ];
			yourself);		
		addItem: (SpToolbarButtonPresenter new
			label: 'Archive';
			icon: (self iconNamed: #scriptManager);
			help: 'Archive';
			action: [ self doArchive ];			
			yourself);
		yourself.
		
	dualPresenter := STTaskDualPresenter newApplication: self application owner: self.
		
	
]

{ #category : #initialization }
STAppMainFrame >> initializeWindow: aWindowPresenter [
	aWindowPresenter 
		title: 'Tasques UATD';
		initialExtent: 1400@600.
]
