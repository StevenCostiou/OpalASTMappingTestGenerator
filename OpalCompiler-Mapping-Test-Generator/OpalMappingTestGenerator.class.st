Class {
	#name : #OpalMappingTestGenerator,
	#superclass : #Object,
	#category : #'OpalCompiler-Mapping-Test-Generator'
}

{ #category : #'as yet unclassified' }
OpalMappingTestGenerator >> generateBasicMappingTest [

	|str method|
	str := WriteStream on: String new.
	method := MethodMapExamples>>#helperMethod12.
	
	str << 'testMapping'.
	str cr.
	0 to: method endPC do:[:pc|
	|node|
	node := method sourceNodeForPC: pc.
	str cr.	
	str << ('node := cache nodeForPC: ', pc printString).
	str << $..	
	str cr.
	str << ('self assert: node class equals: ', node class name).
	str << $..	
	str cr.
	str << ('self assert: node start equals: ', node start printString).
	str << $..	
	str cr.
	str << ('self assert: node stop equals: ', node stop printString).
	str << $..	
	str cr.
	str << ('self assert: node sourceCode equals: ', (
		node isMethod ifTrue:['compiledMethod ast sourceCode']
	ifFalse:[node sourceCode printString]
	
	 )).
	str << $..	

	 
	str cr.

	].
	str contents inspect
]
