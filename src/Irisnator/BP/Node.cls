/// 
Class Irisnator.BP.Node Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Irisnator.MSG.API.Node.NewNodeRequest' response='Irisnator.MSG.API.Node.NewNodeResponse' height='2000' width='2000' >
<context>
<property name='currentNodeId' type='%Integer' instantiate='0' />
<property name='newNodeYes' type='%Integer' instantiate='0' />
<property name='newNodeNo' type='%Integer' instantiate='0' />
</context>
<sequence xend='200' yend='700' >
<code name='CalculateNodeId' xpos='200' ypos='250' >
<![CDATA[ set context.currentNodeId = request.NodeId
 set context.newNodeYes = context.currentNodeId * 2
 set context.newNodeNo = context.newNodeYes + 1]]>
</code>
<flow name='UpdateData' xpos='200' ypos='350' xend='200' yend='600' >
<sequence >
<sql name='InsertNewNode' xpos='200' ypos='500' >
<![CDATA[ INSERT INTO Irisnator_data.Nodes(NodeId, Question, Text) values (:context.newNodeYes, 0, :request.NewCharacter)]]>
</sql>
</sequence>
<sequence >
<sql name='InsertOldNode' xpos='470' ypos='500' >
<![CDATA[ INSERT INTO Irisnator_data.Nodes(NodeId, Question, Text) values (:context.newNodeNo, 0, :request.OldCharacter)]]>
</sql>
</sequence>
<sequence >
<sql name='UpdateOldCharacter' xpos='740' ypos='500' >
<![CDATA[ UPDATE Irisnator_data.Nodes SET Text = :request.Text, Verb = :request.Verb,
 Question = 1 WHERE NodeId = :context.currentNodeId]]>
</sql>
</sequence>
<sequence >
<sql name='Score' xpos='1010' ypos='500' >
<![CDATA[ INSERT INTO Irisnator_data.Score(CharacterName, Success) VALUES (:request.NewCharacter, 0)]]>
</sql>
</sequence>
</flow>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
