Include Ensemble

Class Irisnator.Deploy Extends St.Tools.Deploy
{

ClassMethod Deploy()
{
    set production = "Irisnator.Production"
    set currentNamespace = $Namespace
    
    // Add main paramaters
    do ..AddItem(production, "Irisnator.BS.Rest","Irisnator.BS.Rest")
    do ..AddItem(production, "Irisnator.BP.BusinessNodes","Irisnator.BP.BusinessNodes")
    do ..AddItem(production, "Irisnator.BP.GetNode","Irisnator.BP.GetNode")
    do ..AddItem(production, "Irisnator.BP.Score","Irisnator.BP.Score")
    do ..AddItem(production, "Irisnator.BP.TopScore","Irisnator.BP.TopScore")
    do ..AddItem(production, "Irisnator.BP.Node","Irisnator.BP.Node")
    // Add default parameters
    do ..AddDefaultSetting(production,,"Irisnator.BS.Rest","BusinessNodesConfigName","Irisnator.BP.BusinessNodes")

    // Add API Services
    do ..RegisterWebApplication(currentNamespace, "/irisnator/api","Irisnator.BS.Rest")
}

}
