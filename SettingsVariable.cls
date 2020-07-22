Class User.SettingsVariable Extends %RegisteredObject
{

Property variable As %String;

Property kombi As %Boolean;

Property caption As %String;

Property quantor As %String;

Property head As %String;

Property width As %String;

Method %OnNew(setNum As %Integer, varType As %String, varNum As %Integer) As %Status
{
    Set ..variable=^Settings(setNum,varType,varNum,"variable")
    If varType="keys" Set ..kombi=^Settings(setNum,varType,varNum,"kombi")
    Set ..caption=^Settings(setNum,varType,varNum,"caption")
    If varType="keys" Set ..quantor=^Settings(setNum,varType,varNum,"quantor")
    Set ..head=^Settings(setNum,varType,varNum,"head")
    Set ..width=^Settings(setNum,varType,varNum,"width")
    Return $$$OK
}

}
