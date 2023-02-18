Class {
	#name : #STTaskFilterCombinatorOr,
	#superclass : #STTaskFilterCombinator,
	#category : #'SmallTeam-Model'
}

{ #category : #accessing }
STTaskFilterCombinatorOr >> boolBlock [

	^ boolBlock ifNil: [ boolBlock := [ :t | 
			self children anySatisfy: [ :f | f value: t ] ] ]
]
