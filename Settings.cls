Class User.Settings Extends %RegisteredObject
{

ClassMethod Setting(SettingsNumber) As %Status
{
   
    Set scr=##class(User.Input).%New()
    Do scr.ClearScreen()

    Write
    Return $$$OK
}

ClassMethod Selection() As %Status
{
    Set line=3

    Return $$$OK
}

}
