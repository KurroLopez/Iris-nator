/// 
Class Irisnator.BP.BusinessNodes Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.Request' response='Ens.Response' height='2000' width='2150' >
<sequence xend='200' yend='800' >
<switch name='ValidateRequest' xpos='200' ypos='250' xend='200' yend='700' >
<case condition='$classname(request)="Irisnator.MSG.API.Score.Request"' name='Irisnator.MSG.API.Score.Request' >
<call name='Score' target='Irisnator.BP.Score' async='1' xpos='470' ypos='400' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<sync name='WaitScore' calls='Score' type='all' xpos='470' ypos='500' />
</case>
<case condition='$classname(request)="Irisnator.MSG.API.Score.TopScoreRequest"' name='Irisnator.MSG.API.Score.TopScoreRequest' >
<call name='GetScore' target='Irisnator.BP.TopScore' async='1' xpos='740' ypos='400' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<sync name='WaitGetScore' calls='GetScore' type='all' xpos='740' ypos='500' />
</case>
<case condition='$classname(request)="Irisnator.MSG.API.Node.NewNodeRequest"' name='Irisnator.MSG.API.Node.NewNodeRequest' >
<call name='Node' target='Irisnator.BP.Node' async='1' xpos='1010' ypos='400' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<sync name='WaitNode' calls='Node' type='all' xpos='1010' ypos='500' />
</case>
<case condition='$classname(request)="Irisnator.MSG.API.Node.Request"' name='Irisnator.MSG.API.Node.Request' >
<call name='GetNode' target='Irisnator.BP.GetNode' async='1' xpos='1280' ypos='400' >
<request type='Ens.Request' >
<assign property="callrequest" value="request" action="set" languageOverride="" />
</request>
<response type='Ens.Response' >
<assign property="response" value="callresponse" action="set" languageOverride="" />
</response>
</call>
<sync name='WaitGetNode' calls='GetNode' type='all' xpos='1280' ypos='500' />
<code name='CalculateNextNode' xpos='1280' ypos='600' >
<![CDATA[ if response.Question = 0 {
    set response.NodeYes = 0
    set response.NodeNo= -1
 } else {
    set response.NodeYes = request.NodeId * 2
    set response.NodeNo= (request.NodeId * 2) + 1
 }]]>
</code>
</case>
<default name='default' >
<empty xpos='200' ypos='400' />
</default>
</switch>
</sequence>
</process>
}

}
