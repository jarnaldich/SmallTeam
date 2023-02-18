Class {
	#name : #STTaskFilterTest,
	#superclass : #TestCase,
	#instVars : [
		'sampleTasks'
	],
	#category : #'SmallTeam-Model-Test'
}

{ #category : #accessing }
STTaskFilterTest >> sampleTasks [
	" Returns some sample tasks for testing filters "
	^ sampleTasks ifNil: [ 
		sampleTasks := 
			#( finished assigned working ) flatCollect: [ :s | 
		 	 #( 'Albert' 'Fernando' ) collect: [ :d | 
			 	 STTask new
				 	 assignedTo: (STData developerByName: d);
				 	 changeStateTo: s ] ] ]
]

{ #category : #accessing }
STTaskFilterTest >> sampleTasks: anObject [

	sampleTasks := anObject
]

{ #category : #tests }
STTaskFilterTest >> testCombinatorAnd [
	| count  filter |
	filter := STTaskFilterCombinatorAnd withChildren: { 
		STTaskFilter withBlock: [ :t | t currentState id = #assigned ] .
		STTaskFilter withBlock: [ :t | t assignedTo name = 'Albert' ]
	}.
	count := self sampleTasks count: filter.
	self assert: count equals: 1.

]

{ #category : #tests }
STTaskFilterTest >> testCombinatorOr [
	| count  filter |
	filter := STTaskFilterCombinatorOr withChildren: { 
		STTaskFilter withBlock: [ :t | t currentState id = #assigned ] .
		STTaskFilter withBlock: [ :t | t currentState id = #finished ]
	}.
	count := self sampleTasks count: filter.
	self assert: count equals: 4.

]

{ #category : #tests }
STTaskFilterTest >> testInitialFilter [
	| filtered |
	filtered := self sampleTasks count: (STTaskFilter new).
	self assert: filtered equals: (self sampleTasks size)

]

{ #category : #tests }
STTaskFilterTest >> testSimpleFilter [
	| filtered |
	filtered := self sampleTasks count: (STTaskFilter withBlock: [ :t | t currentState id = #assigned ]).
	self assert: filtered equals: 2.

]
