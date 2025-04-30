/// 
Class Irisnator.BP.GetNode Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Irisnator.MSG.API.Node.Request' response='Irisnator.MSG.API.Node.Response' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<sql name='GetNode' xpos='200' ypos='250' >
<![CDATA[ SELECT NodeId, Verb, Text, Question
 INTO :response.NodeId, :response.Verb, :response.Text, :response.Question
 FROM Irisnator_Data.Nodes
 WHERE NodeId = :request.NodeId]]>
</sql>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
