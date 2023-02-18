Class {
	#name : #STTaskFilterCombinatorAnd,
	#superclass : #STTaskFilterCombinator,
	#category : #'SmallTeam-Model'
}

{ #category : #accessing }
STTaskFilterCombinatorAnd >> boolBlock [

	^ boolBlock ifNil: [ boolBlock := [ :t | 
			self children allSatisfy: [ :f | f value: t ] ] ]
]
