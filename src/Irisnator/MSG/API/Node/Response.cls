Class Irisnator.MSG.API.Node.Response Extends (Ens.Response, %JSON.Adaptor, %XML.Adaptor)
{

/// NodeId
Property NodeId As %Numeric(%JSONFIELDNAME = "nodeId") [ InitialExpression = 0 ];

/// Text of the node
Property Text As %String(%JSONFIELDNAME = "text", MAXLEN = "");

/// Verb of the question
Property Verb As %String(%JSONFIELDNAME = "verb", MAXLEN = "");

/// Type of node (0 = text, 1 = question)
Property Question As %Boolean(%JSONFIELDNAME = "question") [ InitialExpression = 0 ];

/// Number of the next node if the ansswer is "yes"
Property NodeYes As %Integer(%JSONFIELDNAME = "nodeYes") [ InitialExpression = 0 ];

/// Number of the next node if the ansswer is "No"
Property NodeNo As %Integer(%JSONFIELDNAME = "nodeNo") [ InitialExpression = 0 ];

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>NodeId</Value>
</Value>
<Value name="2">
<Value>Text</Value>
</Value>
<Value name="3">
<Value>Verb</Value>
</Value>
<Value name="4">
<Value>Question</Value>
</Value>
<Value name="5">
<Value>NodeYes</Value>
</Value>
<Value name="6">
<Value>NodeNo</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
